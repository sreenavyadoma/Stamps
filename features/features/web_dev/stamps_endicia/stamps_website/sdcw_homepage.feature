Feature: Stamps Website: Home Page

  Background:
    Given Start test driver

  @sdc_website_homepage
  Scenario: Stamps Website: Home Page UI Validation

    Then SDCW: navigate to home page

    #above-offer
    Then SDCW: expect homepage left content header is POSTAGE ON DEMAND®

#    Then SDCW: expect homepage left content click image exists
#    Then SDCW: expect homepage left content click header is CLICK
#    Then SDCW: expect homepage left content click text is Instantly buy andcalculate exact postage.
#
#    Then SDCW: expect homepage left content print image exists
#    Then SDCW: expect homepage left content print header is PRINT
#    Then SDCW: expect homepage left content print text is Print postage on labels,envelopes or plain paper.
#
#    Then SDCW: expect homepage left content mail image exists
#    Then SDCW: expect homepage left content mail header is MAIL
#    Then SDCW: expect homepage left content mail text is Affix postage and mailanywhere in the world.

    Then SDCW: click on see offer details link


    Then SDCW: expect stamps website footer usps logo exists
    Then SDCW: expect stamps website footer usps logo words is Stamps.com is an independent vendor of the USPS.
    Then SDCW: expect stamps website footer copyright exists
    Then SDCW: expect stamps website footer copyright text is Copyright © 1998-2018 Stamps.com Inc.
    Then SDCW: click on copyright link
    Then SDCW: navigate back