Feature: Local Rating test for zone 3

  Background:
    Given I am signed in to Orders as ff/qacc/orders1000/password1

 @local_rating
  @local_rating3
  Scenario:  All Services
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Order Details: Set Weight to 0 lbs 2 oz
    Then Order Details: Expect Total to be $1.20

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Order Details: Set Weight to 0 lbs 15 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $3.60

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details: Set Weight to 1 lbs 5 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.15

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Weight to 3 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $7.09

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Set Weight to 12 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $12.15

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 5 lbs 3 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 7 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 2 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Order Details: Set Weight to 8 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Order Details: Set Weight to 13 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $11.95

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Order Details: Set Weight to 20 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $16.35

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Order Details: Set Weight to 5 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $6.15

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Regional Rate Box B"
    Then Order Details: Set Weight to 6 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $7.90

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Express Package"
    Then Order Details: Set Weight to 11 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $48.06

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Order Details: Set Weight to 1 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 14 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 4 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Media Mail Package"
    Then Order Details: Set Weight to 13 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $8.72

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Order Details: Set Weight to 23 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $16.07

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Weight to 33 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $25.69

    Then Order Details: Set Ship-To to Random Address in Zone 3
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Weight to 40 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Expect Total to be $67.94

    And Sign out