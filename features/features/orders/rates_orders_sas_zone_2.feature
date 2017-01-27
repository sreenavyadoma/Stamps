Feature: January 2017 Rates for SAS User in Zone 2

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_sas_zone_2
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Weight to 0 lb 4 oz
    Then on Order Details form, expect service Cost is $1.61
    Then on Order Details form, expect Total Ship Cost is $1.61
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then on Order Details form, set Weight to 0 lb 10 oz
    Then on Order Details form, expect service Cost is $3.46
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $3.46
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Weight to 0 lb 8 oz
    Then on Order Details form, expect service Cost is $5.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.95
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, expect service Cost is $6.52
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.52
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Weight to 22 lb 0 oz
    Then on Order Details form, expect service Cost is $15.54
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $17.99
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 13 lb 3 oz
    Then on Order Details form, expect service Cost is $5.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.95
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 3 lb 0 oz
    Then on Order Details form, expect service Cost is $6.50
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.50
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect service Cost is $6.25
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.25
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, expect service Cost is $6.45
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.45
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect service Cost is $12.40
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $12.40
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, set Weight to 15 lb 0 oz
    Then on Order Details form, expect service Cost is $17.05
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $17.05
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Weight to 4 lb 0 oz
    Then on Order Details form, expect service Cost is $6.52
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.52
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, set Weight to 12 lb 0 oz
    Then on Order Details form, expect service Cost is $7.17
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $7.17
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Weight to 9 lb 0 oz
    Then on Order Details form, expect service Cost is $31.69
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $31.69
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, set Weight to 7 lb 0 oz
    Then on Order Details form, expect service Cost is $21.18
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $21.18
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 11 lb 0 oz
    Then on Order Details form, expect service Cost is $21.64
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $21.64
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 16 lb 0 oz
    Then on Order Details form, expect service Cost is $21.28
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $21.28
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Weight to 3 lb 0 oz
    Then on Order Details form, expect service Cost is $3.61
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $3.61
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect service Cost is $7.52
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $7.52
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Parcel Select Ground Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PSG Large Package
    Then on Order Details form, set Weight to 12 lb 0 oz
    Then on Order Details form, expect service Cost is $14.02
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $14.02
    Then Sign out

  @rates_orders_sas_zone_2
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 2
    Then on Order Details form, select service PSG Oversized Package
    Then on Order Details form, set Weight to 50 lb 0 oz
    Then on Order Details form, expect service Cost is $63.99
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $66.44
    Then Sign out
