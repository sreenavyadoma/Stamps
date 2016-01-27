Feature: Local Rating test for zone 5

  Background:
    Given I am signed in to Orders as ff/qacc/orders1000/password1

  @local_rating
  @local_rating5
  Scenario:  All Services
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Order Details: Set Weight to 0 lbs 5 oz
    Then Expect Order Details Total to be $1.86

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Order Details: Set Weight to 0 lbs 11 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $3.40

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details: Set Weight to 1 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.20

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Weight to 21 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Set Length to 14
    Then Order Details: Set Width to 30
    Then Order Details: Set Height to 5
    Then Expect Order Details Total to be $22.78

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Set Weight to 5 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Order Details: Set Length to 20
    Then Order Details: Set Width to 20
    Then Order Details: Set Height to 15
    Then Expect Order Details Total to be $42.61

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Weight to 5 lbs 3 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 7 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 15 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $5.75

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Order Details: Set Weight to 2 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $6.10

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Order Details: Set Weight to 23 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $11.95

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Order Details: Set Weight to 37 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $16.35

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Express Package"
    Then Order Details: Set Weight to 6 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $50.13

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Order Details: Set Weight to 10 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Weight to 4 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Order Details: Set Weight to 28 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $20.66

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Media Mail Package"
    Then Order Details: Set Weight to 13 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $8.72

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Order Details: Set Weight to 6 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $12.06

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Weight to 17 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $21.23

    Then Order Details: Set Ship-To to Random Address in Zone 5
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Weight to 56 lbs 0 oz
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Expect Order Details Total to be $105.11

    And Sign out