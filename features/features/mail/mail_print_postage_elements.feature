Feature: Verify Mail Elements Are Present

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_postage_elements
  Scenario: Print Mail Elements
    Then select Print On Shipping Label - 8 x 11 Paper on Print form
    Then on Print form, expect Print On Field is present
    Then on Print form, expect Ship From Field is present
    Then on Print form, expect Ship To Link is present
    Then on Print form, expect Ship To Country Field is present
    Then set Print form Mail to country to United States
    Then on Print form, expect Domestic Address Field is present
    Then on Print form, expect Email Check Box is present
    Then on Print form, expect Email Field is present
    Then on Print form, expect Pounds Field is present
    Then on Print form, expect Ounces Field is present
    Then on Print form, expect Weigh Button is present
    Then on Print form, expect Auto Weigh check box is present
    Then on Print form, expect service Field is present
    Then on Print form, expect service Price is present
    Then on Print form, expect Insure For Field is present
    Then on Print form, expect Insure For Price is present
    Then on Print form, select service Priority Mail Package
    Then on Print form, expect Tracking Field is present
    Then on Print form, expect Tracking Price is present
    Then on Print form, expect Extra Services Button is present
    Then on Print form, expect Label Image Preview is present
    Then on Print form, expect Hide Mail Value check box is present
    Then on Print form, expect Print Receipt check box is present
    Then on Print form, expect Print Reference Number check box is present
    Then on Print form, expect Reference Number field is present
    Then on Print form, expect Cost Code Field is present
    Then on Print form, expect Reset Button is present
    Then on Print form, expect Settings Button is present
    Then on Print form, expect Feedback Button is present
    Then on Print form, expect Classic Button is present
    Then on Print form, expect Mail Total is present
    Then on Print form, expect Print Sample Button is present
    Then on Print form, expect Print Button is present
    Then on Print form, set Mail To country to Canada
    Then on Print form, expect International Name Field is present
    Then on Print form, expect International Company Field is present
    Then on Print form, expect International Address 1 Field is present
    Then on Print form, expect International Address 2 Field is present
    Then on Print form, expect International City Field is present
    Then on Print form, expect International Province Field is present
    Then on Print form, expect International Postcode Field is present
    Then on Print form, expect International Phone Field is present
    Then Sign out



