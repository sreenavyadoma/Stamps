Feature: Stamps Website: Postage Online Page
  Background:
    Given Start test driver

  @sdcw_postage_online_page_validation
  Scenario: Stamps Website: Postage Website Validation
    Then SDCW: navigate to postage online page
    Then SDCW: verify default elements on header for browser
    Then SDCW: click FAQ
    Then SDCW: navigate back
    Then SDCW: verify default elements on footer for browser
    Then SDCW: postage online page click support --> faq

  @sdcw_postage_online_page_validation_mobile
  Scenario: Stamps Website Mobile: Postage Website Validation
    Then SDCW: navigate to postage online page
    Then SDCW: verify default elements on header for mobile
    Then SDCW: click FAQ
    Then SDCW: navigate back
    Then SDCW: verify default elements on footer for mobile
    Then SDCW: postage online page click support --> faq