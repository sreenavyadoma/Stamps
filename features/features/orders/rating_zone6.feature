Feature: Local Rating test for zone 6

  Background:
    Given I am signed in to Orders

  @local_rating6
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 12 oz
    Then Details: Expect Service Cost is $3.29
    Then Details: Expect Total Ship Cost is $3.29

  @local_rating6
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Expect Service Cost is $2.77
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.77

  @local_rating6
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 34 lbs 0 oz
    Then Details: Expect Service Cost is $54.18
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $54.18


  @local_rating6
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 11 lbs 0 oz
    Then Details: Expect Service Cost is $27.00
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 10
    Then Details: Set Width to 10
    Then Details: Set Height to 10
    Then Details: Expect Total Ship Cost is $27.00


  @local_rating6
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 42 lbs 0 oz
    Then Details: Expect Service Cost is $64.74
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 20
    Then Details: Set Width to 10
    Then Details: Set Height to 30
    Then Details: Expect Total Ship Cost is $64.74


  @local_rating6
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 32 lbs 3 oz
    Then Details: Expect Service Cost is $5.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.95


  @local_rating6
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Expect Service Cost is $6.50
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.50


  @local_rating6
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 33 lbs 0 oz
    Then Details: Expect Service Cost is $6.25
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.25


  @local_rating6
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 55 lbs 0 oz
    Then Details: Expect Service Cost is $6.45
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.45


  @local_rating6
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 46 lbs 0 oz
    Then Details: Expect Service Cost is $12.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $12.40


  @local_rating6
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 31 lbs 0 oz
    Then Details: Expect Service Cost is $17.05
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $17.05


  @local_rating6
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Expect Service Cost is $117.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $117.40


  @local_rating6
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 19 lbs 0 oz
    Then Details: Expect Service Cost is $21.18
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.18


  @local_rating6
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 57 lbs 0 oz
    Then Details: Expect Service Cost is $21.64
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $21.64


  @local_rating6
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 40 lbs 0 oz
    Then Details: Expect Service Cost is $21.28
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.28


  @local_rating6
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 66 lbs 0 oz
    Then Details: Expect Service Cost is $33.89
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $33.89


  @local_rating6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 38 lbs 0 oz
    Then Details: Expect Service Cost is $59.04
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $59.04


  @local_rating6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Parcel Select Ground Large Package
    Then Details: Set Weight to 59 lbs 0 oz
    Then Details: Expect Service Cost is $77.60
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $77.60


  @local_rating6
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 48 lbs 0 oz
    Then Details: Expect Service Cost is $123.37
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $123.37

    Then Sign out
