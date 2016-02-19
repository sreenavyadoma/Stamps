Feature: Local Rating test for zone 1

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating1
  Scenario:  All Services
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Order Details: Set Weight to 0 lbs 1 oz
    Then Order Details: Expect Total to be $0.98

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Order Details: Set Weight to 0 lbs 5 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $2.60

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details: Set Weight to 1 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $8.20

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Weight to 2 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.01

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Set Weight to 8 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $13.22

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 0 lbs 3 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 5 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $8.55

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 10 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Order Details: Set Weight to 2 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $8.55

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Order Details: Set Weight to 6 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $11.95

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Order Details: Set Weight to 15 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $18.80

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Order Details: Set Weight to 4 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.01

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Regional Rate Box B"
    Then Order Details: Set Weight to 12 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $9.16

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Express Package"
    Then Order Details: Set Weight to 13 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $38.34

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Order Details: Set Weight to 7 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 11 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 16 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Media Mail Package"
    Then Order Details: Set Weight to 17 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $10.72

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Order Details: Set Weight to 25 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $20.21

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Weight to 35 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $22.77

    Then Order Details: Set Ship-To to Random Address in Zone 1
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Weight to 40 lbs 0 oz
    Then Order Details: Set Tracking to "Signature Required"
    Then Order Details: Expect Total to be $65.44

    Then Sign out