Feature: Local Rating test for zone 2

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating2
  Scenario:  All Services
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 4 oz
    Then Details: Expect Total Ship Cost is $1.64

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 10 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $3.35

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 0 lbs 8 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.01

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 22 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $13.26

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 13 lbs 3 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 3 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $11.95

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 15 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $16.35

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.01

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.71

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 9 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $30.92

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 11 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 16 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 3 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $3.72

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $7.55

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $10.77

    Then Details: Set Ship-To to address in Zone 2
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 50 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $62.99

    Then Sign out