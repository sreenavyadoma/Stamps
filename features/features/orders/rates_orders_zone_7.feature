Feature: January 2017 Rates for Core User in Zone 7

  Background:
    Given I am signed in to Orders

  @rates_orders_zone_7
  Scenario: FCM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Set Weight to 0 lb 11 oz
    Then Order Details: Expect Service Cost is $3.04
    Then Order Details: Expect Total Ship Cost is $3.04
    Then Sign out

  @rates_orders_zone_7
  Scenario: First-Class Mail Package/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service First-Class Mail Package/Thick Envelope
    Then Order Details: Set Weight to 0 lb 8 oz
    Then Order Details: Expect Service Cost is $2.60
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $2.60
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Large/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Weight to 33 lb 1 oz
    Then Order Details: Expect Service Cost is $64.26
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $64.26
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 10 lb 1 oz
    Then Order Details: Expect Service Cost is $31.92
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Set Length to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Expect Total Ship Cost is $31.92
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Weight to 41 lb 1 oz
    Then Order Details: Expect Service Cost is $73.93
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Set Length to 7
    Then Order Details: Set Width to 25
    Then Order Details: Set Height to 25
    Then Order Details: Expect Total Ship Cost is $73.93
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 31 lb 1 oz
    Then Order Details: Expect Service Cost is $5.75
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Set Weight to 22 lb 1 oz
    Then Order Details: Expect Service Cost is $6.10
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Weight to 32 lb 1 oz
    Then Order Details: Expect Service Cost is $5.75
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Small Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Set Weight to 54 lb 1 oz
    Then Order Details: Expect Service Cost is $6.10
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Medium Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Set Weight to 45 lb 1 oz
    Then Order Details: Expect Service Cost is $11.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $11.95
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Large Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Set Weight to 30 lb 1 oz
    Then Order Details: Expect Service Cost is $16.35
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $16.35
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Regional Rate Box A
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Weight to 10 lb 1 oz
    Then Order Details: Expect Service Cost is $9.99
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $9.99


  @rates_orders_zone_7
  Scenario: Priority Mail Regional Rate Box B
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Set Weight to 30 lb 1 oz
    Then Order Details: Expect Service Cost is $17.93
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $17.93

  @local_rating_zone_7
  Scenario: Priority Mail Express Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PME Package
    Then Order Details: Set Weight to 22 lb 1 oz
    Then Order Details: Expect Service Cost is $122.31
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $122.31
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Set Weight to 18 lb 1 oz
    Then Order Details: Expect Service Cost is $20.66
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Weight to 56 lb 1 oz
    Then Order Details: Expect Service Cost is $20.66
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Set Weight to 39 lb 15 oz
    Then Order Details: Expect Service Cost is $20.66
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_zone_7
  Scenario: MM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service MM Package
    Then Order Details: Set Weight to 65 lb 15 oz
    Then Order Details: Expect Service Cost is $35.22
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $35.22
    Then Sign out

  @rates_orders_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 37 lb 15 oz
    Then Order Details: Expect Service Cost is $68.02
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $68.02
    Then Sign out

  @rates_orders_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 58 lb 15 oz
    Then Order Details: Expect Service Cost is $91.52
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $91.52
    Then Sign out

  @rates_orders_zone_7
  Scenario: Parcel Select Ground Oversized Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 7
    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Set Weight to 47 lb 15 oz
    Then Order Details: Expect Service Cost is $141.62
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $141.62
    Then Sign out

