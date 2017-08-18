Feature: Registration Security questions page happy path

  Background:
    Given I loaded the default registration page

  @registration_security_questions_happy_path
  Scenario: Registration Security questions page happy path

    # Profile Page
    Then set Profile page Email to random value
    Then set Profile page Username to random value
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Individual
    Then set How did you hear about us? to Magazine Ad
    Then set Profile page Promo Code to PR33-NH77
    Then continue to Membership page

    # Membership Page
    Then set Membership page member address to random address between zone 1 and 4
    Then set Membership page Company to random value
    Then set Membership page Phone to random value
    Then set Membership page Cardholder's Name to random value
    Then set Membership page Credit Card Number to default value
    Then set Membership page Month to Dec (12)
    Then set Membership page Year to 2026
    Then check Membership page Terms & Conditions
    Then click Membership page Continue button

    # Choose supplies Page
    Then expect welcome_kit_message exists
    Then in Choose Supplies page, click Place Order button

    # Add Postage Page
    #Then expect add_postage_to_account message exists
    #Then in Add Postage page, click Confirm button

    # Ship Volume Survey Page
    Then in Ship Volume Survey page, click Submit button

    # Select security quetions and answers
    Then set Security questions page select first question to What is your city of birth?
    Then set Security questions page select first answer to Auto11
    Then Pause for 10 second
    Then set Security questions page select second question to What was your high school mascot?
    Then set Security questions page select second answer to Auto11
    Then Pause for 10 second
    Then click Get Started button

    # Validate newly created account welcome page
    Then expect congratulations message exists