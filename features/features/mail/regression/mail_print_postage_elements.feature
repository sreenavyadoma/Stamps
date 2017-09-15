Feature: Verify Mail Elements Are Present

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_postage_elements
  Scenario: Print Mail Elements
    Then select Print On Shipping Label - Paper
    Then expect Print form Print On Field is present
#    Then expect Print form Ship From Field is present
#    Then expect Print form Ship To Link is present
#    Then expect Print form Ship To Country Field is present
    Then set Print form Mail-To Country to United States
    Then expect Print form Domestic Address Field is present
    Then expect Print form Email Check Box is present
    Then expect Print form Email Field is present
    Then expect Print form Pounds Field is present
    Then expect Print form Ounces Field is present
    Then expect Print form Weigh Button is present
    Then expect Print form Auto Weigh check box is present
    Then expect Print form service Field is present
    Then expect Print form service Price is present
    Then expect Print form Insure For Field is present
    Then expect Print form Insure For Price is present
    Then select Print form service Priority Mail Package
    Then expect Print form Tracking Field is present
    Then expect Print form Tracking Price is present
    #Then expect Print form Extra Services Button is present
    Then expect Print form Label Image Preview is present
    Then expect Print form Hide Mail Value check box is present
    Then expect Print form Print Receipt check box is present
    #Then expect Print form Print Reference Number check box is present
    Then expect Advanced Options Reference Number field is present
    Then expect Advanced Options Cost Code Field is present
    Then expect Print form Reset Button is present
    Then expect Print form Settings Button is present
    Then expect Print form Feedback Button is present
    Then expect Print form Classic Button is present
    Then expect Print form Mail Total is present
    Then expect Print form Print Sample Button is present
    Then expect Print form Print Button is present
    #Then on Print form, set Mail To country to Canada
    Then expect Print form International Name Field is present
    Then expect Print form International Company Field is present
    Then expect Print form International Address 1 Field is present
    Then expect Print form International Address 2 Field is present
    Then expect Print form International City Field is present
    Then expect Print form International Province Field is present
    Then expect Print form International Postcode Field is present
    Then expect Print form International Phone Field is present
    Then Sign out



