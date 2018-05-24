Feature: Verify Mail Elements Are Present

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_postage_fields
  Scenario: Print Mail Elements
    Then select print on Shipping Label - Paper
    Then expect Print form Print On Field is present
    Then expect Print form Mail From Field is present
    Then expect Print form Mail To Link is present
    Then expect Print form Mail To Country Field is present
    Then set print form mail-to Country to United States
    Then expect Print form Domestic Address Field is present
    Then expect Print form Email Check Box is present
    Then expect Print form Email Field is present
    Then expect Print form Pounds Field is present
    Then expect Print form Ounces Field is present
    Then expect Print form Weigh Button is present
    Then expect Print form service Field is present
    Then expect Print form service Price is present
    Then expect Print form Insure For Field is present
    Then expect Print form Insure For Price is present
    Then expect Print form Tracking Field is present
    Then expect Print form Tracking Price is present
    Then show Advanced Options
    Then expect Print form Label Image Preview is present
    Then expect Print form Hide Mail Value check box is present
    Then expect Print form Print Receipt check box is present
    Then expect Print form Print Reference Number check box is present
    Then expect Advanced Options Reference Number field is present
    Then expect Advanced Options Cost Code Field is present
    Then expect Print form Mail Total is present
    Then expect Print form Print Sample Button is present
    Then expect Print form Print Button is present

    Then set print form mail-to Country to India
    Then expect Print form International Name Field is present
    Then expect Print form International Company Field is present
    Then expect Print form International Address 1 Field is present
    Then expect Print form International City Field is present
    Then expect Print form International Province Field is present
    Then expect Print form International Postcode Field is present
    Then expect Print form International Phone Field is present

    Then sign out
