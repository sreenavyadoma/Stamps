@mail_reset
Feature: Resetting mail fields

  Background:
    Given a valid user is signed in to Web Apps

  Scenario: Check if extra services enabled after reset
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PM Flat Rate Envelope
    Then Show Advanced Options
    Then expect Advanced Options Extra Services Button is enabled
    Then click Mail toolbar menu reset button
    Then expect mail fields are reset
#    Then expect Print form Domestic Address field is empty
#    Then expect Print form Pounds Field is 0
#    Then expect Print form Ounces Field is 0
#    Then expect Print form service is empty
    ##########
    Then set Print form Mail-To random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PM Flat Rate Envelope
    Then expect Advanced Options Extra Services Button is enabled
    Then Sign out
    #AB_ORDERSAUTO_3516