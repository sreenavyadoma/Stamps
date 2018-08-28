Feature: Stamps Website: Header Footer

  Background:
    Given Start test driver

  @sdc_website_header_footer
  Scenario: Stamps Website: Header Footer UI Validation

    Then SDCW: navigate to home page
    Then SDCW: verify default elements on footer for browser

  @sdc_website_header_footer_mobile
  Scenario: Stamps Website: Header Footer UI Validation

    Then SDCW: navigate to home page
    Then SDCW: verify default elements on footer for mobile
