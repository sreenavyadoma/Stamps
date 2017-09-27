Feature: Registration Membership page validation Theme 1632

  Background:
    Given I loaded the default registration page

  @registration_ui_validation_add_validation_model
  Scenario: Address Validation Model

    # Profile Page
    Then set Profile page Email to random value
    Then set Profile page Username to random value
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Both mailing and shipping
    Then set Profile page Promo Code to PR33-NH77
    Then continue to Membership page

    # Membership Page
    Then set Membership page First Name to Kevin
    Then set Membership page Last Name to Ryan
    Then set Membership page Company to random value
    Then set Membership page Address to World Way
    Then set Membership page City to Los Angeles
    Then select Membership page State CA
    Then set Membership page Zip to 90045
    Then set Membership page Phone to random value
    Then set Membership page Cardholder's Name to random value
    Then set Membership page Credit Card Number to default value
    Then set Membership page Month to Dec (12)
    Then set Membership page Year to this year plus 1
    Then check Membership page Terms & Conditions
    Then click Membership page Submit button

    # Multi match Address Validation Model
    Then Pause for 2 second
    Then expect Membership page Address validation model pop up header is Exact address not found
    Then expect Membership page Address validation model pop up header instructions is The USPS address standardization system could not find your exact address. Select an address from the list below that best matches it:
    Then expect Membership page Address validation model pop up Cancel button exists
    Then expect Membership page Address validation model pop up Continue button exists
    Then click Membership page Address validation model pop up Cancel button
    Then click Membership page Submit button
    Then Pause for 2 second
    Then click Membership page Address validation model pop up Continue button