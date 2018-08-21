Feature: Stamps Website: Header Footer

  Background:
    Given Start test driver

  @sdc_website_header_footer
  Scenario: Stamps Website: Header Footer UI Validation

    Then SDCW: navigate to home page

    ######## footer ######
    Then SDCW: expect stamps website footer usps logo exists
    Then SDCW: expect stamps website footer usps logo words is Stamps.com is an independent vendor of the USPS.
    Then SDCW: expect stamps website footer copyright exists
    Then SDCW: expect stamps website footer copyright text is Copyright © 1998-2018 Stamps.com Inc.
    Then SDCW: click on copyright link
    Then SDCW: page redirects to https://sdcwebsite.qacc.stamps.com/site/copyright/#copyright
    Then SDCW: navigate back