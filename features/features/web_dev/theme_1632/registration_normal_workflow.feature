Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded the default registration page

  @registration_normal_workflow
  Scenario: Theme 1632 Normal Test Workflow
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

    Then save sign-in credentials to parameter file normal_workflow
    Then save sign-in credentials
    Then load sign-in credentials

    # Verify new user exist in PAM
    Then visit PAM Customer Search page
    Then set PAM Customer Search page username to cached value
    Then click PAM Customer Search page Search button
    Then expect PAM Customer Profile Page Status Reason is OK
    Then expect PAM Customer Profile Page Username is correct

    # Verify new user is able to sign-in to Web Apps
#    Then load Web Apps Orders then sign-in expecting Security Questions
#    Then select Security Questions 1st security question What is your mother's maiden name?
#    Then set Security Questions 1st security answer to random value
#    Then expect Security Questions 1st security answer is correct
#
#    Then select Security Questions 2nd security question What is your pet's name?
#    Then set Security Questions 2nd security answer to random value
#    Then expect Security Questions 2nd security answer is correct

    #Then add new order
    #Then expect Order Details form Order ID is the same as saved Order ID
    #Then Sign out





