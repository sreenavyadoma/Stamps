Feature: Local Rating test for zone 5

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating5
  Scenario:  All Services
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Expect Total to be $1.86

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 11 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $3.40

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 1 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $6.20

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 21 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Set Length to 14
    Then Details: Set Width to 30
    Then Details: Set Height to 5
    Then Details: Expect Total to be $22.78

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 5 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Set Length to 20
    Then Details: Set Width to 20
    Then Details: Set Height to 15
    Then Details: Expect Total to be $42.61

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 5 lbs 3 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $5.75

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $6.10

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 15 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $5.75

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $6.10

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $11.95

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 37 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $16.35

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $50.13

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 10 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 28 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 13 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $8.72

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Parcel Select Ground Package
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $12.06

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Parcel Select Ground Large Package
    Then Details: Set Weight to 17 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $21.23

    Then Details: Set Ship-To to Random Address in Zone 5
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 56 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $105.11

    Then Sign out