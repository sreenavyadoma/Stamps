Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded default registration page

  Scenario: Theme 1632 Happy Path
    Then set Profile Email to random value
    Then expect Profile Email is correct

    Then set Profile Username to random value
    Then expect Profile Username is correct

    Then set Profile Password to random value
    Then set Registration profile Re-type password to random value

    Then set Profile Survey Question to Mostly mailing
    Then set Profile Survey Question to Mostly shipping
    Then set Profile Survey Question to Both mailing and shipping
    Then set Profile Survey Question to Individual

    Then set Profile Promo Code to PR33-NH77

    Then select Profile Security Question 1 What is your mother's maiden name?
    Then select Profile Security Question 1 What is your pet's name?
    Then select Profile Security Question 1 What is your city of birth?
    Then select Profile Security Question 1 What is your father's birthplace?
    Then select Profile Security Question 1 What street did you grow up on?
    Then select Profile Security Question 1 What is the name of your first school?
    Then select Profile Security Question 1 What is the make and model of your first car?
    Then select Profile Security Question 1 What was your high school mascot?
