Feature: Stamps Website: Postage Online Page
  Background:
    Given Start test driver

  @sdcw_postage_online_page_validation
  Scenario: Stamps Website: Postage Website Validation
    Then SDCW: navigate to postage online page
    Then SDCW: click stamps website logo
    Then SDCW: navigate back
    Then SDCW: click get started button
    Then SDCW: navigate back
    Then SDCW: click get log in button
    Then SDCW: navigate back
    Then SDCW: click learn more --> small office mailers link
    Then SDCW: navigate back
    Then SDCW: click learn more --> online sellers link
    Then SDCW: navigate back
    Then SDCW: click learn more --> warehouse shippers link
    Then SDCW: navigate back
    Then SDCW: click learn more --> corporate postage solutions link
    Then SDCW: navigate back
    Then SDCW: click FAQ
    Then SDCW: navigate back

  @sdcw_postage_online_page_validation_mobile
  Scenario: Stamps Website Mobile: Postage Website Validation
    Then SDCW: navigate to postage online page
    Then SDCW: click stamps website logo
    Then SDCW: navigate back
    Then SDCW: click get started button
    Then SDCW: navigate back
    Then SDCW: click hamburger --> get started link
    Then SDCW: navigate back
    Then SDCW: click learn more --> small office mailers link
    Then SDCW: navigate back
    Then SDCW: click learn more --> online sellers link
    Then SDCW: navigate back
    Then SDCW: click learn more --> warehouse shippers link
    Then SDCW: navigate back
    Then SDCW: click learn more --> corporate postage solutions link
    Then SDCW: navigate back
    Then SDCW: click FAQ
    Then SDCW: navigate back
    Then SDCW: click hamburger --> customer support
    Then SDCW: click hamburger --> customer log-in
    Then SDCW: navigate back
    Then SDCW: click hamburger --> call us 1-888-434-0055