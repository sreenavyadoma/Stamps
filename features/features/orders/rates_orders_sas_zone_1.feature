Feature: January 2017 Rates for SAS User in Zone 1

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_sas_zone_1
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Weight to 0 lb 1 oz
    Then on Order Details form, expect service Cost is $0.94
    Then on Order Details form, expect Total Ship Cost is $0.94
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then on Order Details form, set Weight to 0 lb 5 oz
    Then on Order Details form, expect service Cost is $2.60
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $2.60
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Weight to 1 lb 0 oz
    Then on Order Details form, expect service Cost is $5.75
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, expect service Cost is $6.01
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.01
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Weight to 8 lb 0 oz
    Then on Order Details form, expect service Cost is $10.77
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $10.77
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 0 lb 3 oz
    Then on Order Details form, expect service Cost is $5.75
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 5 lb 0 oz
    Then on Order Details form, expect service Cost is $6.10
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 10 lb 0 oz
    Then on Order Details form, expect service Cost is $5.75
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, expect service Cost is $6.10
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect service Cost is $11.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $11.95
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, set Weight to 15 lb 0 oz
    Then on Order Details form, expect service Cost is $16.35
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $16.35
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Weight to 4 lb 0 oz
    Then on Order Details form, expect service Cost is $6.01
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.01
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, set Weight to 12 lb 0 oz
    Then on Order Details form, expect service Cost is $6.71
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.71
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Weight to 13 lb 0 oz
    Then on Order Details form, expect service Cost is $38.34
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $38.34
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, set Weight to 7 lb 0 oz
    Then on Order Details form, expect service Cost is $20.66
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 11 lb 0 oz
    Then on Order Details form, expect service Cost is $20.66
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 16 lb 0 oz
    Then on Order Details form, expect service Cost is $20.66
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Weight to 17 lb 0 oz
    Then on Order Details form, expect service Cost is $10.29
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $10.29
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Weight to 25 lb 0 oz
    Then on Order Details form, expect service Cost is $17.76
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $17.76
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PSG Large Package
    Then on Order Details form, set Weight to 35 lb 0 oz
    Then on Order Details form, expect service Cost is $22.77
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $22.77
    Then Sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PSG Oversized Package
    Then on Order Details form, set Weight to 40 lb 0 oz
    Then on Order Details form, expect service Cost is $62.99
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $62.99
    Then Sign out