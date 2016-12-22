Feature: Local Rating test for zone 5

  Background:
    Given I am signed in to Orders

  @local_rating
  @local_rating5
  Scenario:  All Services
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Expect Service Cost is $1.82
    Then Details: Expect Total Ship Cost is $1.82

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 11 oz
    Then Details: Expect Service Cost is $3.60
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $3.60

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 1 lbs 0 oz
    Then Details: Expect Service Cost is $6.73
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.73

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 21 lbs 0 oz
    Then Details: Set Length to 14
    Then Details: Set Width to 30
    Then Details: Set Height to 5
    Then Details: Expect Service Cost is $30.30
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $30.30

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 5 lbs 0 oz
    Then Details: Set Length to 20
    Then Details: Set Width to 20
    Then Details: Set Height to 15
    Then Details: Expect Service Cost is $10.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $10.95

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 5 lbs 3 oz
    Then Details: Expect Service Cost is $5.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.95

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Expect Service Cost is $6.50
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.50

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 15 lbs 0 oz
    Then Details: Expect Service Cost is $6.25
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.25

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Expect Service Cost is $6.45
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.45

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Expect Service Cost is $12.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $12.40

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 37 lbs 0 oz
    Then Details: Expect Service Cost is $17.05
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $17.05

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Expect Service Cost is $51.38
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $51.38

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 10 lbs 0 oz
    Then Details: Expect Service Cost is $21.18
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.18

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Expect Service Cost is $21.64
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $21.64

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 28 lbs 0 oz
    Then Details: Expect Service Cost is $21.28
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.28

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 13 lbs 0 oz
    Then Details: Expect Service Cost is $8.45
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $8.45

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Expect Service Cost is $13.59
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $13.59

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Parcel Select Ground Large Package
    Then Details: Set Weight to 17 lbs 0 oz
    Then Details: Expect Service Cost is $29.42
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $29.42

    Then Details: Set Ship-To to address in Zone 5
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 56 lbs 0 oz
    Then Details: Expect Service Cost is $106.11
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $106.11

    Then Sign out
