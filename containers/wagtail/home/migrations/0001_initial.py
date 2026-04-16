# Squashed migration - represents the complete initial state of the home app
# Combines: 0001_initial, 0002_create_homepage, 0003_contentpage_sectionindexpage...

import os
from django.db import migrations, models
import django.db.models.deletion
import wagtail.fields
import wagtail.blocks


def create_homepage(apps, schema_editor):
    """Create the home page and set it as the site root."""
    ContentType = apps.get_model("contenttypes.ContentType")
    Page = apps.get_model("wagtailcore.Page")
    Site = apps.get_model("wagtailcore.Site")
    HomePage = apps.get_model("home.HomePage")

    # Delete the default "Welcome to Wagtail" page if it exists
    Page.objects.filter(slug='home').delete()

    # Get the root page
    root_page = Page.objects.get(slug='root')

    # Create the homepage
    homepage = HomePage(
        title="Home",
        slug="home",
        path="00010001",
        depth=2,
        numchild=0,
        url_path="/home/",
        hero_heading="Send NHS App messages, emails, texts and letters to patients and the public",
        hero_description="You can use NHS Notify if you work in or with NHS England to support patient care.",
        cta_heading="Find out how you can start using NHS Notify",
        cta_description="NHS England organisations and services that support direct care can register their interest and get started with NHS Notify.",
        cta_button_text="Get started",
        cta_button_url="/get-started/",
    )

    # Set the content type
    homepage_content_type = ContentType.objects.get_for_model(HomePage)
    homepage.content_type = homepage_content_type

    # Add as child of root
    root_page.add_child(instance=homepage)

    # Set as the root page for the default site
    site = Site.objects.filter(is_default_site=True).first()
    if site:
        site.root_page = homepage
        # Update hostname and port from environment variables
        site.hostname = os.environ.get('WAGTAIL_SITE_HOSTNAME', 'localhost')
        site.port = int(os.environ.get('WAGTAIL_SITE_PORT', '80'))
        site.save()

    # Handle locales if they exist (Wagtail 2.11+)
    try:
        Locale = apps.get_model("wagtailcore.Locale")
        if Locale.objects.exists():
            default_locale = Locale.objects.get(language_code="en")
            homepage.locale = default_locale
            homepage.save()
    except LookupError:
        # Locale model doesn't exist in this version
        pass


def remove_homepage(apps, schema_editor):
    """Reverse operation - remove the homepage."""
    HomePage = apps.get_model("home.HomePage")
    HomePage.objects.filter(slug="home").delete()


class Migration(migrations.Migration):

    initial = True

    replaces = [
        ('home', '0001_initial'),
        ('home', '0002_create_homepage'),
        ('home', '0003_contentpage_sectionindexpage_remove_homepage_body_and_more'),
    ]

    dependencies = [
        ('wagtailcore', '0094_alter_page_locale'),
    ]

    operations = [
        # Create HomePage model with all current fields
        migrations.CreateModel(
            name='HomePage',
            fields=[
                ('page_ptr', models.OneToOneField(
                    auto_created=True,
                    on_delete=django.db.models.deletion.CASCADE,
                    parent_link=True,
                    primary_key=True,
                    serialize=False,
                    to='wagtailcore.page'
                )),
                ('hero_heading', models.CharField(
                    default='Send NHS App messages, emails, texts and letters to patients and the public',
                    max_length=255
                )),
                ('hero_description', models.TextField(
                    default='You can use NHS Notify if you work in or with NHS England to support patient care.'
                )),
                ('benefits', wagtail.fields.StreamField(
                    [('benefit', wagtail.blocks.StructBlock([
                        ('heading', wagtail.blocks.CharBlock(max_length=100)),
                        ('description', wagtail.blocks.TextBlock())
                    ]))],
                    blank=True,
                    use_json_field=True
                )),
                ('how_it_works', wagtail.fields.StreamField(
                    [('step', wagtail.blocks.StructBlock([
                        ('heading', wagtail.blocks.CharBlock(max_length=100)),
                        ('description', wagtail.blocks.TextBlock())
                    ]))],
                    blank=True,
                    use_json_field=True
                )),
                ('pricing', wagtail.fields.StreamField(
                    [('pricing_item', wagtail.blocks.StructBlock([
                        ('heading', wagtail.blocks.CharBlock(max_length=50)),
                        ('description', wagtail.blocks.CharBlock(max_length=100)),
                        ('pricing', wagtail.blocks.CharBlock(max_length=50))
                    ]))],
                    blank=True,
                    use_json_field=True
                )),
                ('cta_heading', models.CharField(
                    blank=True,
                    default='Find out how you can start using NHS Notify',
                    max_length=255
                )),
                ('cta_description', models.TextField(
                    blank=True,
                    default='NHS England organisations and services that support direct care can register their interest and get started with NHS Notify.'
                )),
                ('cta_button_text', models.CharField(
                    blank=True,
                    default='Get started',
                    max_length=50
                )),
                ('cta_button_url', models.URLField(
                    blank=True,
                    default='/get-started/'
                )),
            ],
            options={
                'verbose_name': 'Home Page',
            },
            bases=('wagtailcore.page',),
        ),

        # Create SectionIndexPage model
        migrations.CreateModel(
            name='SectionIndexPage',
            fields=[
                ('page_ptr', models.OneToOneField(
                    auto_created=True,
                    on_delete=django.db.models.deletion.CASCADE,
                    parent_link=True,
                    primary_key=True,
                    serialize=False,
                    to='wagtailcore.page'
                )),
                ('introduction', wagtail.fields.RichTextField(
                    blank=True,
                    help_text='Introduction text for this section (Markdown supported)'
                )),
                ('body', wagtail.fields.RichTextField(
                    blank=True,
                    help_text='Main content for this section (Markdown supported)'
                )),
            ],
            options={
                'verbose_name': 'Section Index Page',
            },
            bases=('wagtailcore.page',),
        ),

        # Create ContentPage model
        migrations.CreateModel(
            name='ContentPage',
            fields=[
                ('page_ptr', models.OneToOneField(
                    auto_created=True,
                    on_delete=django.db.models.deletion.CASCADE,
                    parent_link=True,
                    primary_key=True,
                    serialize=False,
                    to='wagtailcore.page'
                )),
                ('introduction', wagtail.fields.RichTextField(
                    blank=True,
                    help_text='Introduction or summary text (Markdown supported)'
                )),
                ('body', wagtail.fields.RichTextField(
                    blank=True,
                    help_text='Main page content (Markdown supported)'
                )),
            ],
            options={
                'verbose_name': 'Content Page',
            },
            bases=('wagtailcore.page',),
        ),
    ]
