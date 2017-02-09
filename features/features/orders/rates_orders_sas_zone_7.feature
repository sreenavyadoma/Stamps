Feature: January 2017 Rates for SAS User in Zone 7

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_sas_zone_7
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Weight to 0 lb 11 oz
    Then on Order Details form, expect Service Cost is $3.04
    Then on Order Details form, expect Total Ship Cost is $3.04
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then on Order Details form, set Weight to 0 lb 8 oz
    Then on Order Details form, expect Service Cost is $2.60
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $2.60
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Weight to 33 lb 1 oz
    Then on Order Details form, expect Service Cost is $64.26
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $64.26
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Weight to 10 lb 1 oz
    Then on Order Details form, expect Service Cost is $31.92
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, expect Total Ship Cost is $31.92
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Weight to 41 lb 1 oz
    Then on Order Details form, expect Service Cost is $73.93
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, set Length to 7
    Then on Order Details form, set Width to 25
    Then on Order Details form, set Height to 25
    Then on Order Details form, expect Total Ship Cost is $73.93
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 31 lb 1 oz
    Then on Order Details form, expect Service Cost is $5.75
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 22 lb 1 oz
    Then on Order Details form, expect Service Cost is $6.10
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 32 lb 1 oz
    Then on Order Details form, expect Service Cost is $5.75
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, set Weight to 54 lb 1 oz
    Then on Order Details form, expect Service Cost is $6.10
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, set Weight to 45 lb 1 oz
    Then on Order Details form, expect Service Cost is $11.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $11.95
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, set Weight to 30 lb 1 oz
    Then on Order Details form, expect Service Cost is $16.35
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $16.35
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Weight to 22 lb 1 oz
    Then on Order Details form, expect Service Cost is $122.31
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $122.31
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, set Weight to 18 lb 1 oz
    Then on Order Details form, expect Service Cost is $20.66
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 56 lb 1 oz
    Then on Order Details form, expect Service Cost is $20.66
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 39 lb 15 oz
    Then on Order Details form, expect Service Cost is $20.66
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Weight to 65 lb 15 oz
    Then on Order Details form, expect Service Cost is $35.22
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $35.22
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Weight to 37 lb 15 oz
    Then on Order Details form, expect Service Cost is $68.02
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $68.02
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Weight to 58 lb 15 oz
    Then on Order Details form, expect Service Cost is $91.52
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $91.52
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 7
    Then on Order Details form, select service PSG Oversized Package
    Then on Order Details form, set Weight to 47 lb 15 oz
    Then on Order Details form, expect Service Cost is $141.62
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $141.62
    Then Sign out

