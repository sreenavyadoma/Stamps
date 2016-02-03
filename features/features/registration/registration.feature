
Feature: Registration
  Background:
    Given Registration page is loaded

  @registration
  Scenario:
    Then Registration: Set email to printing_cost0001@mailinator.com
    Then Registration: Set User ID to ORD10000000001
    Then Registration: Set Password to pass111
    Then Registration: Set Re-Type password to pass111
    Then Registration: Set How will you use Stamps.com to Both Mailing and Shipping

    Then Registration: Set Referrer Name to Already used in office
    Then Registration: Set Referrer Name to Email from Stamps
    Then Registration: Set Referrer Name to Magazine Ad
    Then Registration: Set Referrer Name to Newspaper Ad
    Then Registration: Set Referrer Name to Other
    Then Registration: Set Referrer Name to Radio Podcast Streaming Audio
    Then Registration: Set Referrer Name to Received Mailer
    Then Registration: Set Referrer Name to Recommended by Friend
    Then Registration: Set Referrer Name to Recommended by USPS
    Then Registration: Set Referrer Name to Telephone Call
    Then Registration: Set Referrer Name to Television Commercial
    Then Registration: Set Referrer Name to Trade show convention
    Then Registration: Set Referrer Name to Web Banner
    Then Registration: Set 1st Question to What is your mother's maiden name
    Then Registration: Set 1st Answer to stamps
    Then Registration: Set 2nd Question to What was your high school mascot
    Then Registration: Set 2nd Answer to stamps
    Then Registration: Continue

  Scenario:
    Then Registration: Set How will you use Stamps.com to Mostly Mailing
    Then Registration: Set How will you use Stamps.com to Mostly Shipping
    Then Registration: Set How will you use Stamps.com to Both Mailing and Shipping
    Then Registration: Set How will you use Stamps.com to Home Office

    Then Registration: Set 1st Question to What is your mother's maiden name
    Then Registration: Set 1st Question to What is the make and model of your first car
    Then Registration: Set 1st Question to What is the name of your first school
    Then Registration: Set 1st Question to What is your city of birth
    Then Registration: Set 1st Question to What is your father's birthplace
    Then Registration: Set 1st Question to What is your pet's name
    Then Registration: Set 1st Question to What street did you grow up on

    Then Registration: Set 1st Question to What is your mother's maiden name
    Then Registration: Set 2nd Question to What is the make and model of your first car
    Then Registration: Set 2nd Question to What is the name of your first school
    Then Registration: Set 2nd Question to What is your city of birth
    Then Registration: Set 2nd Question to What is your father's birthplace
    Then Registration: Set 2nd Question to What is your pet's name
    Then Registration: Set 2nd Question to What street did you grow up on
    Then Registration: Set 2nd Question to What was your high school mascot


