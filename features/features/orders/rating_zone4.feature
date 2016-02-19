Feature: Local Rating test for zone 4

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating4
  Scenario:  All Services
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Order Details: Set Weight to 0 lbs 1 oz
    Then Order Details: Expect Total to be $0.98

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Order Details: Set Weight to 0 lbs 5 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $2.60

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details: Set Weight to 2 lbs 8 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $8.17

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Weight to 13 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $10.35

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Set Weight to 32 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $33.63

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 2 lbs 3 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 12 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 5 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Order Details: Set Weight to 23 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Order Details: Set Weight to 14 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $11.95

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Order Details: Set Weight to 3 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $16.35

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Order Details: Set Weight to 7 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.60

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Regional Rate Box B"
    Then Order Details: Set Weight to 18 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $8.75

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Express Package"
    Then Order Details: Set Weight to 26 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $110.25

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Order Details: Set Weight to 1 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 15 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 6 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Media Mail Package"
    Then Order Details: Set Weight to 30 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $17.22

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Order Details: Set Weight to 45 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $40.28

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Weight to 21 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $13.32

    Then Order Details: Set Ship-To to Random Address in Zone 4
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Weight to 13 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $86.89

    Then Sign out