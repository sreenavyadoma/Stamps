
Feature: Registration
  Background:
    Given WebReg: Load QA Web Registration Page
  #ORD10000000007
  @registration
  Scenario:
    Then WebReg: Set email to ORD10000000007@mailinator.com
    Then WebReg: Set User ID to ORD10000000007

    Then WebReg: Set Password to pass111
    Then WebReg: Set Re-Type password to pass111
    Then WebReg: Set How will you use Stamps.com to Both Mailing and Shipping
    Then WebReg: Set Referrer Name to Already used in office
    Then WebReg: Set 1st Question to What is your mother's maiden name
    Then WebReg: Set 1st Answer to stamps
    Then WebReg: Set 2nd Question to What was your high school mascot
    Then WebReg: Set 2nd Answer to stamps

    Then WebReg: Continue to Mailing Information Page

    Then WebReg: Set Mailing Info First Name to random
    Then WebReg: Set Mailing Info Last Name to random
    Then WebReg: Set Mailing Info Company to random
    Then WebReg: Set Mailing Info Address to 1990 E. Grand Ave.
    Then WebReg: Set Mailing Info City to El Segundo
    Then WebReg: Set Mailing Info State to California
    Then WebReg: Set Mailing Info Zip Code to 90245
    Then WebReg: Set Mailing Info Phone to random
    Then WebReg: Set Mailing Info Extenion to random

    Then WebReg: Set Mailing Info Cardholder name to random
    Then WebReg: Set Mailing Info Card number to 4111111111111111
    Then WebReg: Set Mailing Info Expiration Month to February
    Then WebReg: Set Mailing Info Expiration Year to 2019
    Then WebReg: Set Mailing Info Billing address same as mailing address to Checked
    Then WebReg: Set Mailing Info Terms & Conditions to Checked

    Then WebReg: Mailing Info Submit

    Then PAM: Load Customer Search Page
    Then PAM: Customer Search: Set username to ORD10000000007
    Then PAM: Customer Search: Click Search button

    Then PAM: Customer Profile: Click Change Meter Limit link
    Then PAM: Change Meter Limit: Set USPS approval to Checked
    Then PAM: Change Meter Limit: Set New Meter Limit to $100000
    Then PAM: Change Meter Limit: Click Submit

    Then PAM: Customer Profile: Click ACH Credit link
    Then PAM: ACH Purchase: Set Amount to $100000.00 and Comments to Some String


    Scenario:


  Scenario:
    Then WebReg: Continue
    Then WebReg: Click Mailing Info Back Button

    Then WebReg: Set Mailing Info Terms & Conditions to Unchecked
    Then WebReg: Set Mailing Info Terms & Conditions to Checked

    Then WebReg: Set Mailing Info Billing address same as mailing address to Unchecked
    Then WebReg: Set Mailing Info Billing address same as mailing address to Checked

    Then WebReg: Set Mailing Info State to Armed Forces Americas
    Then WebReg: Set Mailing Info State to Armed Forces
    Then WebReg: Set Mailing Info State to Alaska
    Then WebReg: Set Mailing Info State to Alabama
    Then WebReg: Set Mailing Info State to Armed Forces Pacific
    Then WebReg: Set Mailing Info State to Arkansas
    Then WebReg: Set Mailing Info State to American Samoa
    Then WebReg: Set Mailing Info State to Arizona
    Then WebReg: Set Mailing Info State to California
    Then WebReg: Set Mailing Info State to Colorado
    Then WebReg: Set Mailing Info State to Connecticut
    Then WebReg: Set Mailing Info State to Canal Zone
    Then WebReg: Set Mailing Info State to District of Columbia
    Then WebReg: Set Mailing Info State to Delaware
    Then WebReg: Set Mailing Info State to Florida
    Then WebReg: Set Mailing Info State to Micronesia
    Then WebReg: Set Mailing Info State to Georgia
    Then WebReg: Set Mailing Info State to Guam
    Then WebReg: Set Mailing Info State to Hawaii
    Then WebReg: Set Mailing Info State to Iowa
    Then WebReg: Set Mailing Info State to Idaho
    Then WebReg: Set Mailing Info State to Illinois
    Then WebReg: Set Mailing Info State to Indiana
    Then WebReg: Set Mailing Info State to Kansas
    Then WebReg: Set Mailing Info State to Kentucky
    Then WebReg: Set Mailing Info State to Louisiana
    Then WebReg: Set Mailing Info State to Massachusetts
    Then WebReg: Set Mailing Info State to Maryland
    Then WebReg: Set Mailing Info State to Maine
    Then WebReg: Set Mailing Info State to Marshall Islands
    Then WebReg: Set Mailing Info State to Minnesota
    Then WebReg: Set Mailing Info State to Missouri
    Then WebReg: Set Mailing Info State to Mariana Islands
    Then WebReg: Set Mailing Info State to Mississippi
    Then WebReg: Set Mailing Info State to Montana
    Then WebReg: Set Mailing Info State to North Carolina
    Then WebReg: Set Mailing Info State to North Dakota
    Then WebReg: Set Mailing Info State to Nebraska
    Then WebReg: Set Mailing Info State to New Hampshire
    Then WebReg: Set Mailing Info State to New Jersey
    Then WebReg: Set Mailing Info State to New Mexico
    Then WebReg: Set Mailing Info State to Nevada
    Then WebReg: Set Mailing Info State to New York
    Then WebReg: Set Mailing Info State to Ohio
    Then WebReg: Set Mailing Info State to Oklahoma
    Then WebReg: Set Mailing Info State to Oregon
    Then WebReg: Set Mailing Info State to Pennsylvania
    Then WebReg: Set Mailing Info State to Puerto Rico
    Then WebReg: Set Mailing Info State to Palau
    Then WebReg: Set Mailing Info State to Rhode Island
    Then WebReg: Set Mailing Info State to South Carolina
    Then WebReg: Set Mailing Info State to South Dakota
    Then WebReg: Set Mailing Info State to Tennessee
    Then WebReg: Set Mailing Info State to Texas
    Then WebReg: Set Mailing Info State to Utah
    Then WebReg: Set Mailing Info State to Virginia
    Then WebReg: Set Mailing Info State to Virgin Islands
    Then WebReg: Set Mailing Info State to Vermont
    Then WebReg: Set Mailing Info State to Washington
    Then WebReg: Set Mailing Info State to Wisconsin
    Then WebReg: Set Mailing Info State to West Virginia
    Then WebReg: Set Mailing Info State to Wyoming

    Then WebReg: Set Referrer Name to Email from Stamps
    Then WebReg: Set Referrer Name to Magazine Ad
    Then WebReg: Set Referrer Name to Newspaper Ad
    Then WebReg: Set Referrer Name to Other
    Then WebReg: Set Referrer Name to Radio Podcast Streaming Audio
    Then WebReg: Set Referrer Name to Received Mailer
    Then WebReg: Set Referrer Name to Recommended by Friend
    Then WebReg: Set Referrer Name to Recommended by USPS
    Then WebReg: Set Referrer Name to Telephone Call
    Then WebReg: Set Referrer Name to Television Commercial
    Then WebReg: Set Referrer Name to Trade show convention
    Then WebReg: Set Referrer Name to Web Banner

    Then WebReg: Set How will you use Stamps.com to Mostly Mailing
    Then WebReg: Set How will you use Stamps.com to Mostly Shipping
    Then WebReg: Set How will you use Stamps.com to Both Mailing and Shipping
    Then WebReg: Set How will you use Stamps.com to Home Office

    Then WebReg: Set 1st Question to What is your mother's maiden name
    Then WebReg: Set 1st Question to What is the make and model of your first car
    Then WebReg: Set 1st Question to What is the name of your first school
    Then WebReg: Set 1st Question to What is your city of birth
    Then WebReg: Set 1st Question to What is your father's birthplace
    Then WebReg: Set 1st Question to What is your pet's name
    Then WebReg: Set 1st Question to What street did you grow up on

    Then WebReg: Set 1st Question to What is your mother's maiden name
    Then WebReg: Set 2nd Question to What is the make and model of your first car
    Then WebReg: Set 2nd Question to What is the name of your first school
    Then WebReg: Set 2nd Question to What is your city of birth
    Then WebReg: Set 2nd Question to What is your father's birthplace
    Then WebReg: Set 2nd Question to What is your pet's name
    Then WebReg: Set 2nd Question to What street did you grow up on
    Then WebReg: Set 2nd Question to What was your high school mascot


