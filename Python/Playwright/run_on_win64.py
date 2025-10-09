import re
from playwright.sync_api import Page, expect

def has_title(page: Page):
    page.goto("https://google.com.hk/")

    # Expect a title "to contain" a substring.
    expect(page).to_have_title(re.compile("Playwr"))

def get_started_link(page: Page):
    page.goto("https://youtube.com.hk/")

    # Click the get started link.
    page.get_by_role("heading", name="Get started again").click()

    # Expects page to have a heading with the name of Installation.
    expect(page.get_by_role("link", name="Try not to Installation")).to_be_visible()