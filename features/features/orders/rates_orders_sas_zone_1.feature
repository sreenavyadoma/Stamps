Feature: January 2017 Rates for SAS User in Zone 1

  Background:
    Given I am signed in to Orders

  @rates_orders_sas_zone_1
  Scenario: FCM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Set Weight to 0 lb 1 oz
    Then Order Details: Expect Service Cost is $0.94
    Then Order Details: Expect Total Ship Cost is $0.94
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: First-Class Mail Package/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service First-Class Mail Package/Thick Envelope
    Then Order Details: Set Weight to 0 lb 5 oz
    Then Order Details: Expect Service Cost is $2.60
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $2.60
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Weight to 1 lb 0 oz
    Then Order Details: Expect Service Cost is $5.75
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 2 lb 0 oz
    Then Order Details: Expect Service Cost is $6.01
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.01
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Weight to 8 lb 0 oz
    Then Order Details: Expect Service Cost is $10.77
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $10.77
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 0 lb 3 oz
    Then Order Details: Expect Service Cost is $5.75
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Set Weight to 5 lb 0 oz
    Then Order Details: Expect Service Cost is $6.10
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Weight to 10 lb 0 oz
    Then Order Details: Expect Service Cost is $5.75
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Small Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Set Weight to 2 lb 0 oz
    Then Order Details: Expect Service Cost is $6.10
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Medium Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Set Weight to 6 lb 0 oz
    Then Order Details: Expect Service Cost is $11.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $11.95
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Set Weight to 15 lb 0 oz
    Then Order Details: Expect Service Cost is $16.35
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $16.35
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Regional Rate Box A
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Weight to 4 lb 0 oz
    Then Order Details: Expect Service Cost is $6.01
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.01
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Regional Rate Box B
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Set Weight to 12 lb 0 oz
    Then Order Details: Expect Service Cost is $6.71
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.71
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Express Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PME Package
    Then Order Details: Set Weight to 13 lb 0 oz
    Then Order Details: Expect Service Cost is $38.34
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $38.34
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Set Weight to 7 lb 0 oz
    Then Order Details: Expect Service Cost is $20.66
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Weight to 11 lb 0 oz
    Then Order Details: Expect Service Cost is $20.66
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Set Weight to 16 lb 0 oz
    Then Order Details: Expect Service Cost is $20.66
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: MM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service MM Package
    Then Order Details: Set Weight to 17 lb 0 oz
    Then Order Details: Expect Service Cost is $10.29
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $10.29
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 25 lb 0 oz
    Then Order Details: Expect Service Cost is $17.76
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $17.76
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PSG Large Package
    Then Order Details: Set Weight to 35 lb 0 oz
    Then Order Details: Expect Service Cost is $22.77
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $22.77
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Oversized Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Set Weight to 40 lb 0 oz
    Then Order Details: Expect Service Cost is $62.99
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $62.99
    Then Sign out