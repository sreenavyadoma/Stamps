Feature: Verify Postage Elements Are Present


  Background:
    Given I am signed in as a postage shipper


  @wp_print_postage_elements
  Scenario: Print Postage Elements
    Then Postage: Select Shipping Label 8 x 11
    Then Postage: Expect Print On Field is present
    Then Postage: Expect Ship From Field is present
    Then Postage: Expect Ship To Link is present
    Then Postage: Expect Ship To Country Field is present
    Then Postage: Set Ship-To country to United States
    Then Postage: Expect Domestic Address Field is present
    Then Postage: Expect Email Check Box is present
    Then Postage: Expect Email Field is present
    Then Postage: Expect Pounds Field is present
    Then Postage: Expect Ounces Field is present
    Then Postage: Expect Weigh Button is present
    Then Postage: Expect Auto Weigh check box is present
    Then Postage: Expect Service Field is present
    Then Postage: Expect Service Price is present
    Then Postage: Expect Insure For Field is present
    Then Postage: Expect Insure For Price is present
    Then Postage Shipping Labels: Select Service Priority Mail Package
    Then Postage: Expect Tracking Field is present
    Then Postage: Expect Tracking Price is present
    Then Postage: Expect Extra Services Button is present
    Then Postage: Expect Label Image Preview is present
    Then Postage: Expect Hide Postage Value check box is present
    Then Postage: Expect Print Receipt check box is present
    Then Postage: Expect Print Reference Number check box is present
    Then Postage: Expect Reference Number field is present
    Then Postage: Expect Cost Code Field is present
    Then Postage: Expect Reset Button is present
    Then Postage: Expect Settings Button is present
    Then Postage: Expect Feedback Button is present
    Then Postage: Expect Classic Button is present
    Then Postage: Expect Postage Total is present
    Then Postage: Expect Print Sample Button is present
    Then Postage: Expect Print Button is present
    Then Postage: Set Ship-To country to Canada
    Then Postage: Expect International Name Field is present
    Then Postage: Expect International Company Field is present
    Then Postage: Expect International Address 1 Field is present
    Then Postage: Expect International Address 2 Field is present
    Then Postage: Expect International City Field is present
    Then Postage: Expect International Province Field is present
    Then Postage: Expect International Postcode Field is present
    Then Postage: Expect International Phone Field is present
    Then Sign out



