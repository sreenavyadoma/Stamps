Feature: Local Rating test for zone 1

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating1
  Scenario:  All Services
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Expect Service Cost is $55.2
    Then Details: Set Weight to 0 lbs 1 oz
    Then Details: Expect Total Ship Cost is $0.98

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.60

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 1 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $8.20

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.01

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 8 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $13.22

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 0 lbs 3 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 5 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $8.55

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 10 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $8.55

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $11.95

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 15 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $18.80

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.01

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $9.16

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 13 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $38.34

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 11 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 16 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $20.66

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 17 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $10.72

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 25 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $20.21

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 35 lbs 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $22.77

    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 40 lbs 0 oz
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $65.44

    Then Sign out