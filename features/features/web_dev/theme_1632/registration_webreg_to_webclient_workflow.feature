Feature: Webreg to Web client registration theme_1632

  Background:
    Given I loaded the default registration page

  @registration_webreg_to_webclient_workflow
  Scenario: Webreg to Web client registration

    # Web Registration
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
    Then set Membership page Year to this year plus 1
    Then check Membership page Terms & Conditions
    Then click Membership page Submit button

    # Web Client
    # Default driver launch
    Then load web apps orders then sign-in expecting Security Questions

    # Select security questions and answers
    Then select Security Questions 1st security question What was your high school mascot?
    Then expect Security Questions 1st security quetion is correct
    Then set Security Questions 1st security answer to Auto11
    Then select Security Questions 2nd security question What is your father's birthplace?
    Then expect Security Questions 2nd security quetion is correct
    Then set Security Questions 2nd security answer to Auto11
    Then click Security Questions page Continue button
    Then expect Security Questions successfully set dialog exists
    Then expect Security Questions successfully set dialog contain Security questions and answers have been successfully set.
    Then click Security Questions page Continue button

    Then load web apps orders then sign-in
