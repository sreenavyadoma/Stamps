Feature: Verify Mail Elements Are Present


  Background:
    Given I am signed in as a postage shipper


  @wp_print_postage_elements
  Scenario: Print Mail Elements
    Then Mail: Select Shipping Label 8 x 11
    Then Mail: Expect Print On Field is present
    Then Mail: Expect Ship From Field is present
    Then Mail: Expect Ship To Link is present
    Then Mail: Expect Ship To Country Field is present
    Then Mail: Set Ship-To country to United States
    Then Mail: Expect Domestic Address Field is present
    Then Mail: Expect Email Check Box is present
    Then Mail: Expect Email Field is present
    Then Mail: Expect Pounds Field is present
    Then Mail: Expect Ounces Field is present
    Then Mail: Expect Weigh Button is present
    Then Mail: Expect Auto Weigh check box is present
    Then Mail: Expect Service Field is present
    Then Mail: Expect Service Price is present
    Then Mail: Expect Insure For Field is present
    Then Mail: Expect Insure For Price is present
    Then Mail Shipping Labels: Select Service Priority Mail Package
    Then Mail: Expect Tracking Field is present
    Then Mail: Expect Tracking Price is present
    Then Mail: Expect Extra Services Button is present
    Then Mail: Expect Label Image Preview is present
    Then Mail: Expect Hide Mail Value check box is present
    Then Mail: Expect Print Receipt check box is present
    Then Mail: Expect Print Reference Number check box is present
    Then Mail: Expect Reference Number field is present
    Then Mail: Expect Cost Code Field is present
    Then Mail: Expect Reset Button is present
    Then Mail: Expect Settings Button is present
    Then Mail: Expect Feedback Button is present
    Then Mail: Expect Classic Button is present
    Then Mail: Expect Mail Total is present
    Then Mail: Expect Print Sample Button is present
    Then Mail: Expect Print Button is present
    Then Mail: Set Ship-To country to Canada
    Then Mail: Expect International Name Field is present
    Then Mail: Expect International Company Field is present
    Then Mail: Expect International Address 1 Field is present
    Then Mail: Expect International Address 2 Field is present
    Then Mail: Expect International City Field is present
    Then Mail: Expect International Province Field is present
    Then Mail: Expect International Postcode Field is present
    Then Mail: Expect International Phone Field is present
    Then Sign out



