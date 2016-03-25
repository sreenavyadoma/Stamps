Feature: Local Rating test for zone 8

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating8
  Scenario:  All Services
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Details: Set Weight to 0 lbs 13 oz
    Then Details: Expect Total to be $3.62

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Details: Set Weight to 0 lbs 10 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $3.35

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Details: Set Weight to 26 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $63.49

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Weight to 18 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Set Length to 8
    Then Details: Set Width to 16
    Then Details: Set Height to 9
    Then Details: Expect Total to be $52.31

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Large Package"
    Then Details: Set Weight to 32 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Set Length to 30
    Then Details: Set Width to 15
    Then Details: Set Height to 15
    Then Details: Expect Total to be $78.80

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Weight to 53 lbs 3 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $5.75

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Details: Set Weight to 25 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $6.10

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Details: Set Weight to 37 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $5.75

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Details: Set Weight to 61 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $6.10

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Details: Set Weight to 40 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $11.95

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Details: Set Weight to 35 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $16.35

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Express Package"
    Then Details: Set Weight to 56 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $274.05

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Weight to 21 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Details: Set Weight to 70 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $20.66

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Weight to 39 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $21.72

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Parcel Select Ground Package"
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $40.14

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Set Weight to 24 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $60.47

    Then Details: Set Ship-To to Random Address in Zone 8
    Then Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Set Tracking to "USPS Tracking"
    Then Details: Expect Total to be $169.87

    Then Sign out