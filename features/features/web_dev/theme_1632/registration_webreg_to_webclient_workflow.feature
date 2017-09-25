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
    # Default browser launch
    Then new user signed in to Web Apps first time

    # Select security quetions and answers
