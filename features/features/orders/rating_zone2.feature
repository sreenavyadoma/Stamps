Feature: Local Rating test for zone 2

  Background:
    Given I am signed in to Orders as ff/qacc/ss_rob14/pass111

  @local_rating
  @local_rating2
  Scenario:  All Services
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Order Details: Set Weight to 0 lbs 4 oz
    Then Expect Order Details Total to be $1.64

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Order Details: Set Weight to 0 lbs 10 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $3.35

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details: Set Weight to 0 lbs 8 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Weight to 2 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.09

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Set Weight to 22 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $13.26

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 13 lbs 3 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 3 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 6 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Order Details: Set Weight to 2 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Order Details: Set Weight to 6 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $11.95

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Order Details: Set Weight to 15 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $16.35

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Order Details: Set Weight to 4 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.01

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Regional Rate Box B"
    Then Order Details: Set Weight to 12 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.71

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Express Package"
    Then Order Details: Set Weight to 9 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $30.92

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Order Details: Set Weight to 7 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 11 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 16 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Media Mail Package"
    Then Order Details: Set Weight to 3 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $3.72

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Order Details: Set Weight to 6 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $7.55

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Weight to 12 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $10.77

    Then Order Details: Set Ship-To to Random Address in Zone 2
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Weight to 50 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $62.99

    And Sign out