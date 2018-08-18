Feature: Stamps Website: Home Page

  Background:
    Given Start test driver

  @sdc_website_homepage
  Scenario: Stamps Website: Home Page UI Validation

    Then WL: navigate to https://www.stamps.com/

    #header validation
    Then pause for 2 seconds
#    Then WL: expect registration navigation bar stamps logo exists
#    Then WL: expect registration navigation bar learn more dropdown exists
#    Then WL: expect registration navigation bar get started button exists
#    Then WL: expect registration navigation bar login button exists
#    Then WL: expect registration navigation bar microphone text is HEARD US ON RADIO ORPODCAST? CLICK HERE
#    Then WL: expect registration navigation bar radio image exists

    #above-offer
    Then WL: expect homepage left content header is POSTAGE ON DEMAND®

    Then WL: expect homepage left content click image exists
    Then WL: expect homepage left content click header is CLICK
    Then WL: expect homepage left content click text is Instantly buy andcalculate exact postage.

    Then WL: expect homepage left content print image exists
    Then WL: expect homepage left content print header is PRINT
    Then WL: expect homepage left content print text is Print postage on labels,envelopes or plain paper.

    Then WL: expect homepage left content mail image exists
    Then WL: expect homepage left content mail header is MAIL
    Then WL: expect homepage left content mail text is Affix postage and mailanywhere in the world.