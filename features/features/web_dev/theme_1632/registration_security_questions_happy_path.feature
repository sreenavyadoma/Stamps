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

    #select security quetions and answers
    Then set Security questions page select first question & answer
    Then set Security questions page select second question & answer
    Then click Get Started button

    Then expect congratulations message exists
