from django.db import models
from wagtail.admin.panels import FieldPanel
from wagtail.models import Page
from wagtail.fields import StreamField
from wagtail import blocks
from wagtailmarkdown.fields import MarkdownField


class HomePage(Page):
    """
    Homepage for NHS Notify CMS - with structured content blocks.
    Supports hero section, benefits, how-it-works steps, pricing, and CTA.
    """
    template = "home/home_page.html"
    max_count = 1
    parent_page_types = ['wagtailcore.Page']
    subpage_types = ['home.SectionIndexPage', 'home.ContentPage']

    # Hero section
    hero_heading = models.CharField(
        max_length=255,
        default="Send NHS App messages, emails, texts and letters to patients and the public"
    )

    hero_description = models.TextField(
        default="You can use NHS Notify if you work in or with NHS England to support patient care."
    )

    # Benefits section (3 cards)
    benefits = StreamField([
        ('benefit', blocks.StructBlock([
            ('heading', blocks.CharBlock(max_length=100)),
            ('description', blocks.TextBlock()),
        ]))
    ], blank=True, use_json_field=True)

    # How it works section (4 steps)
    how_it_works = StreamField([
        ('step', blocks.StructBlock([
            ('heading', blocks.CharBlock(max_length=100)),
            ('description', blocks.TextBlock()),
        ]))
    ], blank=True, use_json_field=True)

    # Pricing section (4 items)
    pricing = StreamField([
        ('pricing_item', blocks.StructBlock([
            ('heading', blocks.CharBlock(max_length=50)),
            ('description', blocks.CharBlock(max_length=100)),
            ('pricing', blocks.CharBlock(max_length=50)),
        ]))
    ], blank=True, use_json_field=True)

    # CTA section
    cta_heading = models.CharField(
        max_length=255,
        default="Find out how you can start using NHS Notify",
        blank=True
    )

    cta_description = models.TextField(
        default="NHS England organisations and services that support direct care can register their interest and get started with NHS Notify.",
        blank=True
    )

    cta_button_text = models.CharField(
        max_length=50,
        default="Get started",
        blank=True
    )

    cta_button_url = models.URLField(
        default="/get-started/",
        blank=True
    )

    content_panels = Page.content_panels + [
        FieldPanel("hero_heading"),
        FieldPanel("hero_description"),
        FieldPanel("benefits"),
        FieldPanel("how_it_works"),
        FieldPanel("pricing"),
        FieldPanel("cta_heading"),
        FieldPanel("cta_description"),
        FieldPanel("cta_button_text"),
        FieldPanel("cta_button_url"),
    ]

    class Meta:
        verbose_name = "Home Page"


class SectionIndexPage(Page):
    """
    A section page that can have child pages.
    Used for main navigation sections like "Get Started", "Pricing", etc.
    """
    template = "home/section_index_page.html"

    introduction = MarkdownField(
        blank=True,
        help_text="Introduction text for this section (Markdown supported)"
    )

    body = MarkdownField(
        blank=True,
        help_text="Main content for this section (Markdown supported)"
    )

    content_panels = Page.content_panels + [
        FieldPanel("introduction"),
        FieldPanel("body"),
    ]

    # Can be child of HomePage or another SectionIndexPage
    parent_page_types = ['home.HomePage', 'home.SectionIndexPage']
    # Can have ContentPages or other SectionIndexPages as children
    subpage_types = ['home.ContentPage', 'home.SectionIndexPage']

    class Meta:
        verbose_name = "Section Index Page"


class ContentPage(Page):
    """
    Standard content page for most site content.
    """
    template = "home/content_page.html"

    introduction = MarkdownField(
        blank=True,
        help_text="Introduction or summary text (Markdown supported)"
    )

    body = MarkdownField(
        blank=True,
        help_text="Main page content (Markdown supported)"
    )

    content_panels = Page.content_panels + [
        FieldPanel("introduction"),
        FieldPanel("body"),
    ]

    # Can be child of HomePage or SectionIndexPage
    parent_page_types = ['home.HomePage', 'home.SectionIndexPage']
    # Cannot have children
    subpage_types = []

    class Meta:
        verbose_name = "Content Page"
