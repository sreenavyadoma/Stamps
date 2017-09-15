Feature: Registration Username taken model

  Background:
    Given I loaded the default registration page

  @registration_username_taken_model
  Scenario: Username taken model

    # Profile Page
    Then set Profile page Email to random value
    Then set Profile page Username to AutoStamps
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Both mailing and shipping
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
    Then click Membership page Continue button
    Then Pause for 2 second

    # Reload WebReg site
    Then i loaded SDC Website
    Then click on get started

    # Profile Page
    Then set Profile page Email to random value
    Then set Profile page Username to AutoStamps
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Both mailing and shipping
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
    Then click Membership page Continue button
    Then Pause for 1 second

    # Username Taken Model