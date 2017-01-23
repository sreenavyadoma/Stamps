Feature: January 2017 Rates for Core User in Zone 6

  Background:
    Given I am signed in to Orders

  @rates_orders_zone_6
  Scenario: FCM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Set Weight to 0 lb 12 oz
    Then Order Details: Expect Service Cost is $3.29
    Then Order Details: Expect Total Ship Cost is $3.29

  @rates_orders_zone_6
  Scenario: First-Class Mail Package/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service First-Class Mail Package/Thick Envelope
    Then Order Details: Set Weight to 0 lb 5 oz
    Then Order Details: Expect Service Cost is $2.77
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $2.77

  @rates_orders_zone_6
  Scenario: Priority Mail Large/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Weight to 34 lb 0 oz
    Then Order Details: Expect Service Cost is $54.18
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $54.18


  @rates_orders_zone_6
  Scenario: Priority Mail Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 11 lb 0 oz
    Then Order Details: Set Length to 10
    Then Order Details: Set Width to 10
    Then Order Details: Set Height to 10
    Then Order Details: Expect Service Cost is $27.00
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $27.00


  @rates_orders_zone_6
  Scenario: Priority Mail Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Weight to 42 lb 0 oz
    Then Order Details: Set Length to 20
    Then Order Details: Set Width to 10
    Then Order Details: Set Height to 30
    Then Order Details: Expect Service Cost is $64.74
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $64.74


  @rates_orders_zone_6
  Scenario: Priority Mail Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 32 lb 3 oz
    Then Order Details: Expect Service Cost is $5.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.95


  @rates_orders_zone_6
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Set Weight to 23 lb 0 oz
    Then Order Details: Expect Service Cost is $6.50
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.50


  @rates_orders_zone_6
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Weight to 33 lb 0 oz
    Then Order Details: Expect Service Cost is $6.25
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.25


  @rates_orders_zone_6
  Scenario: Priority Mail Small Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Set Weight to 55 lb 0 oz
    Then Order Details: Expect Service Cost is $6.45
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.45


  @rates_orders_zone_6
  Scenario: Priority Mail Medium Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Set Weight to 46 lb 0 oz
    Then Order Details: Expect Service Cost is $12.40
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $12.40


  @rates_orders_zone_6
  Scenario: Priority Mail Large Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Set Weight to 31 lb 0 oz
    Then Order Details: Expect Service Cost is $17.05
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $17.05

  @local_rating6
  Scenario: Priority Mail Regional Rate Box A
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Weight to 3 lb 0 oz
    Then Order Details: Expect Service Cost is $9.19
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $9.19

  @local_rating6
  Scenario: Priority Mail Regional Rate Box B
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Set Weight to 1 lb 0 oz
    Then Order Details: Expect Service Cost is $15.68
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $15.68


  @rates_orders_zone_6
  Scenario: Priority Mail Express Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PME Package
    Then Order Details: Set Weight to 23 lb 0 oz
    Then Order Details: Expect Service Cost is $117.40
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $117.40


  @rates_orders_zone_6
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Set Weight to 19 lb 0 oz
    Then Order Details: Expect Service Cost is $21.18
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.18


  @rates_orders_zone_6
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Weight to 57 lb 0 oz
    Then Order Details: Expect Service Cost is $21.64
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $21.64


  @rates_orders_zone_6
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Set Weight to 40 lb 0 oz
    Then Order Details: Expect Service Cost is $21.28
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.28


  @rates_orders_zone_6
  Scenario: MM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service MM Package
    Then Order Details: Set Weight to 66 lb 0 oz
    Then Order Details: Expect Service Cost is $33.89
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $33.89


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 38 lb 0 oz
    Then Order Details: Expect Service Cost is $59.04
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $59.04


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PSG Large Package
    Then Order Details: Set Weight to 59 lb 0 oz
    Then Order Details: Expect Service Cost is $77.60
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $77.60


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Oversized Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 6
    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Set Weight to 48 lb 0 oz
    Then Order Details: Expect Service Cost is $123.37
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $125.82

    Then Sign out
