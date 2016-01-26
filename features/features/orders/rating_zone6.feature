Feature: Local Rating test for zone 6

  Background:
    Given I am signed in to Orders as ff/qacc/ss_rob14/pass111

  @local_rating
  @local_rating6
  Scenario:  All Services
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Order Details: Set Weight to 0 lbs 12 oz
    Then Expect Order Details Total to be $3.40

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Order Details: Set Weight to 0 lbs 5 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $2.60

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details: Set Weight to 34 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $52.60

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Weight to 11 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Set Length to 10
    Then Order Details: Set Width to 10
    Then Order Details: Set Height to 10
    Then Expect Order Details Total to be $26.21

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Set Weight to 42 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Set Length to 20
    Then Order Details: Set Width to 10
    Then Order Details: Set Height to 30
    Then Expect Order Details Total to be $62.85

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 32 lbs 3 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 23 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 33 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Order Details: Set Weight to 55 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Order Details: Set Weight to 46 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Order Details: Set Weight to 31 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $11.95

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Express Package"
    Then Order Details: Set Weight to 23 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $116.24

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Order Details: Set Weight to 19 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 57 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 40 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Media Mail Package"
    Then Order Details: Set Weight to 66 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $35.22

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Order Details: Set Weight to 38 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $58.37

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Weight to 59 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $75.58

    Then Order Details: Set Ship-To to Random Address in Zone 6
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Weight to 48 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $123.37

    And Sign out