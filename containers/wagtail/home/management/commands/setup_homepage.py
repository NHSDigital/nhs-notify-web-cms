import os
from django.core.management.base import BaseCommand
from django.contrib.contenttypes.models import ContentType
from wagtail.models import Page, Site, Locale

from home.models import HomePage


class Command(BaseCommand):
    help = 'Creates the homepage and sets it as the site root (idempotent)'

    def handle(self, *args, **options):
        # Check if homepage already exists
        if HomePage.objects.filter(slug='home').exists():
            self.stdout.write(self.style.SUCCESS('Homepage already exists, skipping creation'))
            return

        # Delete the default "Welcome to Wagtail" page if it exists
        Page.objects.filter(slug='home', depth=2).exclude(content_type=ContentType.objects.get_for_model(HomePage)).delete()

        # Get the root page
        try:
            root_page = Page.objects.get(slug='root', depth=1)
        except Page.DoesNotExist:
            self.stdout.write(self.style.ERROR('Root page not found. Run migrations first.'))
            return

        # Create the homepage
        homepage = HomePage(
            title="Home",
            slug="home",
            hero_heading="Send NHS App messages, emails, texts and letters to patients and the public",
            hero_description="You can use NHS Notify if you work in or with NHS England to support patient care.",
            cta_heading="Find out how you can start using NHS Notify",
            cta_description="NHS England organisations and services that support direct care can register their interest and get started with NHS Notify.",
            cta_button_text="Get started",
            cta_button_url="/get-started/",
        )

        # Add as child of root
        root_page.add_child(instance=homepage)

        # Handle locales if they exist
        if Locale.objects.exists():
            default_locale = Locale.objects.get(language_code="en")
            homepage.locale = default_locale
            homepage.save()

        # Set as the root page for the default site
        site = Site.objects.filter(is_default_site=True).first()
        if site:
            site.root_page = homepage
            # Update hostname and port from environment variables
            site.hostname = os.environ.get('WAGTAIL_SITE_HOSTNAME', 'localhost')
            site.port = int(os.environ.get('WAGTAIL_SITE_PORT', '80'))
            site.save()
            self.stdout.write(self.style.SUCCESS(f'Homepage created and set as site root for {site.hostname}:{site.port}'))
        else:
            self.stdout.write(self.style.WARNING('Homepage created but no default site found'))
