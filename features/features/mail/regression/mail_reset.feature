@mail_reset
Feature: Resetting mail fields

  Background:
    Given a valid user is signed in to Web Apps

  Scenario: Check if extra services enabled after reset
    Then select print on Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set print form mail-to random address in zone 1
    Then set Print form Ounces to 1
    Then Show Advanced Options
    Then expect Advanced Options Extra Services Button is disabled
    Then select print form service PM Flat Rate Envelope
    Then expect Advanced Options Extra Services Button is enabled
    Then click Mail toolbar menu reset button
    Then expect mail fields are reset
    Then expect Advanced Options Extra Services Button is disabled
    Then set print form mail-to random address in zone 1
    Then set Print form Ounces to 1
    Then select print form service PM Flat Rate Envelope
    Then expect Advanced Options Extra Services Button is enabled
    Then sign out