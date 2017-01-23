Feature: January 2017 Rates for Core User in Zone 9

  Background:
    Given I am signed in to Orders

  @rates_orders_zone_8
  Scenario: FCM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Set Weight to 0 lb 13 oz
    Then Order Details: Expect Service Cost is $3.50
    Then Order Details: Expect Total Ship Cost is $3.50

  @rates_orders_zone_8
  Scenario: First-Class Mail Package/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service First-Class Mail Package/Thick Envelope
    Then Order Details: Set Weight to 0 lb 10 oz
    Then Order Details: Expect Service Cost is $3.46
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $3.46

  @rates_orders_zone_8
  Scenario: Priority Mail Large/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Weight to 26 lb 0 oz
    Then Order Details: Expect Service Cost is $65.40
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $65.40

  @rates_orders_zone_8
  Scenario: Priority Mail Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 18 lb 0 oz
    Then Order Details: Set Length to 8
    Then Order Details: Set Width to 16
    Then Order Details: Set Height to 9
    Then Order Details: Expect Service Cost is $53.88
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $53.88

  @rates_orders_zone_8
  Scenario: Priority Mail Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Weight to 32 lb 0 oz
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Set Length to 30
    Then Order Details: Set Width to 15
    Then Order Details: Set Height to 15
    Then Order Details: Expect Service Cost is $76.91
    Then Order Details: Expect Total Ship Cost is $76.91

  @rates_orders_zone_8
  Scenario: Priority Mail Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 53 lb 3 oz
    Then Order Details: Expect Service Cost is $5.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.95

  @rates_orders_zone_8
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Set Weight to 25 lb 0 oz
    Then Order Details: Expect Service Cost is $6.50
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.50

  @rates_orders_zone_8
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Weight to 37 lb 0 oz
    Then Order Details: Expect Service Cost is $6.25
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.25

  @rates_orders_zone_8
  Scenario: Priority Mail Small Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Set Weight to 61 lb 0 oz
    Then Order Details: Expect Service Cost is $6.45
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.45

  @rates_orders_zone_8
  Scenario: Priority Mail Medium Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Set Weight to 40 lb 0 oz
    Then Order Details: Expect Service Cost is $12.40
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $12.40

  @rates_orders_zone_8
  Scenario: Priority Mail Large Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Set Weight to 35 lb 0 oz
    Then Order Details: Expect Service Cost is $17.05
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $17.05

  @local_rating8
  Scenario: Priority Mail Regional Rate Box A
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Weight to 5 lb 0 oz
    Then Order Details: Expect Service Cost is $10.28
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $10.28

  @local_rating8
  Scenario: Priority Mail Regional Rate Box B
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Set Weight to 2 lb 0 oz
    Then Order Details: Expect Service Cost is $20.41
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $20.41

  @rates_orders_zone_8
  Scenario: Priority Mail Express Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PME Package
    Then Order Details: Set Weight to 56 lb 0 oz
    Then Order Details: Expect Service Cost is $276.79
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $276.79

  @rates_orders_zone_8
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Set Weight to 4 lb 0 oz
    Then Order Details: Expect Service Cost is $21.18
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.18

  @rates_orders_zone_8
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Weight to 21 lb 0 oz
    Then Order Details: Expect Service Cost is $21.64
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $21.64

  @rates_orders_zone_8
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Set Weight to 70 lb 0 oz
    Then Order Details: Expect Service Cost is $21.28
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $21.28

  @rates_orders_zone_8
  Scenario: MM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service MM Package
    Then Order Details: Set Weight to 39 lb 0 oz
    Then Order Details: Expect Service Cost is $20.93
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $20.93

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 12 lb 0 oz
    Then Order Details: Expect Service Cost is $41.35
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $41.35

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PSG Large Package
    Then Order Details: Set Weight to 24 lb 0 oz
    Then Order Details: Expect Service Cost is $62.29
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $62.29

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Oversized Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 8
    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Set Weight to 7 lb 0 oz
    Then Order Details: Expect Service Cost is $173.87
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $176.32


    Then Sign out
