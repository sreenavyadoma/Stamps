Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded default registration page

  Scenario: Theme 1632 Happy Path
    Then set Profile page Email to random value
    Then expect Profile page Email is correct

    Then set Profile page Username to random value
    Then expect Profile page Username is correct

    Then set Profile page Password to random value
    Then set Registration profile Re-type password to random value

    Then set Profile page Survey Question to Mostly mailing
    Then set Profile page Survey Question to Mostly shipping
    Then set Profile page Survey Question to Both mailing and shipping
    Then set Profile page Survey Question to Individual

    Then set Profile page Promo Code to PR33-NH77

    Then select Profile page Security Question 1 What is your mother's maiden name?
    Then select Profile page Security Question 1 What is your pet's name?
    Then select Profile page Security Question 1 What is your city of birth?
    Then select Profile page Security Question 1 What is your father's birthplace?
    Then select Profile page Security Question 1 What street did you grow up on?
    Then select Profile page Security Question 1 What is the name of your first school?
    Then select Profile page Security Question 1 What is the make and model of your first car?
    Then select Profile page Security Question 1 What was your high school mascot?
