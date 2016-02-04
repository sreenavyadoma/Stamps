
Feature: Registration
  Background:
    Given Registration page is loaded

  @registration
  Scenario:
    Then Registration: Set email to printing_cost0001@mailinator.com
    Then Registration: Set User ID to ORD10000000002
    Then Registration: Set Password to pass111
    Then Registration: Set Re-Type password to pass111
    Then Registration: Set How will you use Stamps.com to Both Mailing and Shipping
    Then Registration: Set Referrer Name to Already used in office
    Then Registration: Set 1st Question to What is your mother's maiden name
    Then Registration: Set 1st Answer to stamps
    Then Registration: Set 2nd Question to What was your high school mascot
    Then Registration: Set 2nd Answer to stamps

    Then Registration: Continue to Mailing Information Page

    Then Registration: Set Mailing Info First Name to random
    Then Registration: Set Mailing Info Last Name to random
    Then Registration: Set Mailing Info Company to random
    Then Registration: Set Mailing Info Address to 1990 E. Grand Ave.
    Then Registration: Set Mailing Info City to El Segundo
    Then Registration: Set Mailing Info State to California
    Then Registration: Set Mailing Info Zip Code to 90245
    Then Registration: Set Mailing Info Phone to random
    Then Registration: Set Mailing Info Extenion to random

    Then Registration: Set Mailing Info Cardholder name to random
    Then Registration: Set Mailing Info Card number to 4111111111111111
    Then Registration: Set Mailing Info Expiration Month to February
    Then Registration: Set Mailing Info Expiration Year to 2019
    Then Registration: Set Mailing Info Billing address same as mailing address to Checked
    Then Registration: Set Mailing Info Billing address same as mailing address to Unchecked
    Then Registration: Set Mailing Info Billing address same as mailing address to Checked
    Then Registration: Set Mailing Info Terms & Conditions to Check
    Then Registration: Set Mailing Info Terms & Conditions to Uncheck
    Then Registration: Set Mailing Info Terms & Conditions to Check

    Then Registration: Mailing Info Submit

  Scenario:
    Then Registration: Continue
    Then Registration: Click Mailing Info Back Button

    Then Registration: Set Mailing Info State to Armed Forces Americas
    Then Registration: Set Mailing Info State to Armed Forces
    Then Registration: Set Mailing Info State to Alaska
    Then Registration: Set Mailing Info State to Alabama
    Then Registration: Set Mailing Info State to Armed Forces Pacific
    Then Registration: Set Mailing Info State to Arkansas
    Then Registration: Set Mailing Info State to American Samoa
    Then Registration: Set Mailing Info State to Arizona
    Then Registration: Set Mailing Info State to California
    Then Registration: Set Mailing Info State to Colorado
    Then Registration: Set Mailing Info State to Connecticut
    Then Registration: Set Mailing Info State to Canal Zone
    Then Registration: Set Mailing Info State to District of Columbia
    Then Registration: Set Mailing Info State to Delaware
    Then Registration: Set Mailing Info State to Florida
    Then Registration: Set Mailing Info State to Micronesia
    Then Registration: Set Mailing Info State to Georgia
    Then Registration: Set Mailing Info State to Guam
    Then Registration: Set Mailing Info State to Hawaii
    Then Registration: Set Mailing Info State to Iowa
    Then Registration: Set Mailing Info State to Idaho
    Then Registration: Set Mailing Info State to Illinois
    Then Registration: Set Mailing Info State to Indiana
    Then Registration: Set Mailing Info State to Kansas
    Then Registration: Set Mailing Info State to Kentucky
    Then Registration: Set Mailing Info State to Louisiana
    Then Registration: Set Mailing Info State to Massachusetts
    Then Registration: Set Mailing Info State to Maryland
    Then Registration: Set Mailing Info State to Maine
    Then Registration: Set Mailing Info State to Marshall Islands
    Then Registration: Set Mailing Info State to Minnesota
    Then Registration: Set Mailing Info State to Missouri
    Then Registration: Set Mailing Info State to Mariana Islands
    Then Registration: Set Mailing Info State to Mississippi
    Then Registration: Set Mailing Info State to Montana
    Then Registration: Set Mailing Info State to North Carolina
    Then Registration: Set Mailing Info State to North Dakota
    Then Registration: Set Mailing Info State to Nebraska
    Then Registration: Set Mailing Info State to New Hampshire
    Then Registration: Set Mailing Info State to New Jersey
    Then Registration: Set Mailing Info State to New Mexico
    Then Registration: Set Mailing Info State to Nevada
    Then Registration: Set Mailing Info State to New York
    Then Registration: Set Mailing Info State to Ohio
    Then Registration: Set Mailing Info State to Oklahoma
    Then Registration: Set Mailing Info State to Oregon
    Then Registration: Set Mailing Info State to Pennsylvania
    Then Registration: Set Mailing Info State to Puerto Rico
    Then Registration: Set Mailing Info State to Palau
    Then Registration: Set Mailing Info State to Rhode Island
    Then Registration: Set Mailing Info State to South Carolina
    Then Registration: Set Mailing Info State to South Dakota
    Then Registration: Set Mailing Info State to Tennessee
    Then Registration: Set Mailing Info State to Texas
    Then Registration: Set Mailing Info State to Utah
    Then Registration: Set Mailing Info State to Virginia
    Then Registration: Set Mailing Info State to Virgin Islands
    Then Registration: Set Mailing Info State to Vermont
    Then Registration: Set Mailing Info State to Washington
    Then Registration: Set Mailing Info State to Wisconsin
    Then Registration: Set Mailing Info State to West Virginia
    Then Registration: Set Mailing Info State to Wyoming

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


