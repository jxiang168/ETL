import re
from playwright.sync_api import Playwright, sync_playwright, expect


def run(playwright: Playwright) -> None:
    # browser = playwright.chromium.launch(headless=False)
    browser = playwright.chromium.launch()
    context = browser.new_context()
    page = context.new_page()
    page.goto("https://auth.huaweicloud.com/authui/login.html#/login")
    page.get_by_placeholder("手机号/邮件地址/账号名/原华为云账号").click()
    page.get_by_text("IAM用户").nth(1).click()
    # page.get_by_placeholder("租户名/原华为云账号").click()
    page.get_by_placeholder("租户名/原华为云账号").fill("pbinfo2022")
    # page.get_by_placeholder("IAM用户名/邮件地址").click()
    page.get_by_placeholder("IAM用户名/邮件地址").fill("o014129")
    # page.get_by_placeholder("IAM用户密码").click()
    page.get_by_placeholder("IAM用户密码").fill("Liuling0)")
    page.locator("#btn_submit").click()

    expect(page.locator("#cf_user_info")).to_contain_text("x014129")

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    run(playwright)
