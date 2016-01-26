Feature: Local Rating test for zone 7

  Background:
    Given I am signed in to Orders as ff/qacc/ss_rob14/pass111

  @local_rating
  @local_rating7
  Scenario:  All Services
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Order Details: Set Weight to 0 lbs 16 oz
    Then Expect Order Details Total to be $max weight exceeded

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Order Details: Set Weight to 0 lbs 8 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $2.60

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details: Set Weight to 33 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $64.26

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Weight to 10 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Set Length to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Expect Order Details Total to be $31.92

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Set Weight to 41 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Set Length to 7
    Then Order Details: Set Width to 25
    Then Order Details: Set Height to 25
    Then Expect Order Details Total to be $73.93

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 31 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 22 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 32 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Order Details: Set Weight to 54 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Order Details: Set Weight to 45 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $11.95

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Order Details: Set Weight to 30 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $16.35

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Express Package"
    Then Order Details: Set Weight to 22 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $122.31

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Order Details: Set Weight to 18 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 56 lbs 1 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 39 lbs 15 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Media Mail Package"
    Then Order Details: Set Weight to 65 lbs 15 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $35.22

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Order Details: Set Weight to 37 lbs 15 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $82.71

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Weight to 58 lbs 15 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $105.48

    Then Order Details: Set Ship-To to Random Address in Zone 7
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Weight to 47 lbs 15 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $169.87

    And Sign out