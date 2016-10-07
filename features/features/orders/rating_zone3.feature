Feature: Local Rating test for zone 3

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating3
  Scenario:  All Services
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 2 oz
    Then Details: Expect Total to be $1.20

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 15 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $3.60

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 1 lbs 5 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $6.15

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 3 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $7.09

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $12.15

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 5 lbs 3 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $5.75

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $6.10

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $5.75

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 8 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $6.10

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 13 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $11.95

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 20 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $16.35

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Weight to 5 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $6.15

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $7.90

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 11 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $48.06

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 1 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 14 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 13 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $8.72

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $16.07

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 33 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $25.69

    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 40 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total to be $67.94

    Then Sign out