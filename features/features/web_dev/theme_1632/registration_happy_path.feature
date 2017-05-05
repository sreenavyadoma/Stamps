Feature: Test Workflow - Theme 1632 Happy Path

  Background:
    Given I loaded SDC Website

  @registration_theme_1632_happy_path
  Scenario: Theme 1632 Happy Path
    Then click on Get Started
    Then set Profile page Email to random value
    Then expect Profile page Email is correct
    Then set Profile page Username to random value
    Then expect Profile page Username is correct
    Then set Profile page Password to random value
    Then expect Profile page Password is correct
    Then set Profile page Re-type password to random value
    Then expect Profile page Re-Type password is correct
    Then set Profile page Survey Question to Business Use - Mostly mailing (letters/postcards/flats)
    Then set Profile page Survey Question to Mostly mailing
    Then set Profile page Survey Question to Mostly shipping
    Then set Profile page Survey Question to Both mailing and shipping
    Then set Profile page Survey Question to Individual
    Then set Profile page Promo Code to PR33-NH77
    Then expect Profile page Promo Code is correct
    Then check Profile page Money-saving offers and new products
    Then expect Profile page Money-saving offers and new products is checked
    Then uncheck Profile page Money-saving offers and new products
    Then expect Profile page Money-saving offers and new products is unchecked
    Then continue to Membership page
    Then set Membership page First Name to random value
    Then expect Membership page First Name is correct
    Then set Membership page Last Name to random value
    Then expect Membership page Last Name is correct
    Then set Membership page Company to random value
    Then expect Membership page Company is correct
    Then set Membership page Address to 1350 Market Street Apt 2901
    Then expect Membership page Address is correct

    Then set Membership page City to San Francisco
    Then expect Membership page City is correct

    Then set Membership page State to CA
    Then expect Membership page State is correct

    Then set Membership page Zip to 94102
    Then expect Membership page Zip is correct

    Then set Membership page Phone to random value
    Then expect Membership page Phone is correct

    Then set Membership page Cardholder's Name to random value
    Then expect Membership page Cardholder's Name is correct

    Then set Membership page Credit Card Number to default value
    Then expect Membership page Credit Card Number is correct

    Then set Membership page Month to May (05)
    Then expect Membership page Month is correct

    Then set Membership page Year to 2027
    Then expect Membership page Year is correct

    Then uncheck Membership page Billing address same as mailing address
    Then expect Membership page Billing address same as mailing address is unchecked
    Then expect Billing Address form is present

    Then check Membership page Billing address same as mailing address
    Then expect Membership page Billing address same as mailing address is checked
    Then expect Billing Address form is not present

    Then uncheck Membership page Billing address same as mailing address

    Then set Membership page Billing Address to 1350 Market Street Apt 2901
    Then expect Membership page Billing Address is correct

    Then set Membership page Billing City to San Francisco
    Then expect Membership page Billing City is correct

    Then set Membership page Billing State to CA
    Then expect Membership page Billing State is correct

    Then set Membership page Billing Zip to 94102
    Then expect Membership page Billing Zip is correct

    Then check Membership page Terms & Conditions
    Then expect Membership page Terms & Conditions is checked

    Then uncheck Membership page Terms & Conditions
    Then expect Membership page Terms & Conditions is unchecked

    Then check Membership page Terms & Conditions

    Then submit Membership Page





