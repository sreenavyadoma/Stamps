Feature: January 2017 Rates for Core User in Zone 6

  Background:
    Given I am signed in to Orders

  @rates_orders_zone_6
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lb 12 oz
    Then Details: Expect Service Cost is $3.29
    Then Details: Expect Total Ship Cost is $3.29

  @rates_orders_zone_6
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lb 5 oz
    Then Details: Expect Service Cost is $2.77
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.77

  @rates_orders_zone_6
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Large/Thick Envelope
    Then Details: Set Weight to 34 lb 0 oz
    Then Details: Expect Service Cost is $54.18
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $54.18


  @rates_orders_zone_6
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Package
    Then Details: Set Weight to 11 lb 0 oz
    Then Details: Set Length to 10
    Then Details: Set Width to 10
    Then Details: Set Height to 10
    Then Details: Expect Service Cost is $27.00
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $27.00


  @rates_orders_zone_6
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Large Package
    Then Details: Set Weight to 42 lb 0 oz
    Then Details: Set Length to 20
    Then Details: Set Width to 10
    Then Details: Set Height to 30
    Then Details: Expect Service Cost is $64.74
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $64.74


  @rates_orders_zone_6
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Flat Rate Envelope
    Then Details: Set Weight to 32 lb 3 oz
    Then Details: Expect Service Cost is $5.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.95


  @rates_orders_zone_6
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Padded Flat Rate Envelope
    Then Details: Set Weight to 23 lb 0 oz
    Then Details: Expect Service Cost is $6.50
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.50


  @rates_orders_zone_6
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Legal Flat Rate Envelope
    Then Details: Set Weight to 33 lb 0 oz
    Then Details: Expect Service Cost is $6.25
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.25


  @rates_orders_zone_6
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Small Flat Rate Box
    Then Details: Set Weight to 55 lb 0 oz
    Then Details: Expect Service Cost is $6.45
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.45


  @rates_orders_zone_6
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Medium Flat Rate Box
    Then Details: Set Weight to 46 lb 0 oz
    Then Details: Expect Service Cost is $12.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $12.40


  @rates_orders_zone_6
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Large Flat Rate Box
    Then Details: Set Weight to 31 lb 0 oz
    Then Details: Expect Service Cost is $17.05
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $17.05

  @local_rating6
  Scenario: Priority Mail Regional Rate Box A
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Regional Rate Box A
    Then Details: Set Weight to 3 lb 0 oz
    Then Details: Expect Service Cost is $9.19
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $9.19

  @local_rating6
  Scenario: Priority Mail Regional Rate Box B
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PM Regional Rate Box B
    Then Details: Set Weight to 1 lb 0 oz
    Then Details: Expect Service Cost is $15.68
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $15.68


  @rates_orders_zone_6
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PME Package
    Then Details: Set Weight to 23 lb 0 oz
    Then Details: Expect Service Cost is $117.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $117.40


  @rates_orders_zone_6
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PME Flat Rate Envelope
    Then Details: Set Weight to 19 lb 0 oz
    Then Details: Expect Service Cost is $21.18
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.18


  @rates_orders_zone_6
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Set Weight to 57 lb 0 oz
    Then Details: Expect Service Cost is $21.64
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $21.64


  @rates_orders_zone_6
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PME Legal Flat Rate Envelope
    Then Details: Set Weight to 40 lb 0 oz
    Then Details: Expect Service Cost is $21.28
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.28


  @rates_orders_zone_6
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 66 lb 0 oz
    Then Details: Expect Service Cost is $33.89
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $33.89


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PSG Package
    Then Details: Set Weight to 38 lb 0 oz
    Then Details: Expect Service Cost is $59.04
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $59.04


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PSG Large Package
    Then Details: Set Weight to 59 lb 0 oz
    Then Details: Expect Service Cost is $77.60
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $77.60


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service PSG Oversized Package
    Then Details: Set Weight to 48 lb 0 oz
    Then Details: Expect Service Cost is $123.37
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $125.82

    Then Sign out
