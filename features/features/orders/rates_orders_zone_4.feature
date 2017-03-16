Feature: January 2017 Rates for Core User in Zone 4

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_zone_4
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service FCM Large Envelope
    Then set Order Details form Weight to 0 lb 1 oz
    Then expect Order Details form Service Cost is 0.98
    Then expect Order Details form Total Ship Cost is 0.98


  @rates_orders_zone_4
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 5 oz
    Then expect Order Details form Service Cost is 2.77
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 2.77


  @rates_orders_zone_4
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Large/Thick Envelope
    Then set Order Details form Weight to 2 lb 8 oz
    Then expect Order Details form Service Cost is 7.86
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 7.86


  @rates_orders_zone_4
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Package
    Then set Order Details form Weight to 13 lb 0 oz
    Then expect Order Details form Service Cost is 15.11
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 15.11


  @rates_orders_zone_4
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Large Package
    Then set Order Details form Weight to 32 lb 0 oz
    Then expect Order Details form Service Cost is 34.64
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 34.64


  @rates_orders_zone_4
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Weight to 2 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95


  @rates_orders_zone_4
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 12 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50


  @rates_orders_zone_4
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 5 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25


  @rates_orders_zone_4
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Small Flat Rate Box
    Then set Order Details form Weight to 23 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45


  @rates_orders_zone_4
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then set Order Details form Weight to 14 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40


  @rates_orders_zone_4
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Large Flat Rate Box
    Then set Order Details form Weight to 3 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05


  @rates_orders_zone_4
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Regional Rate Box A
    Then set Order Details form Weight to 7 lb 0 oz
    Then expect Order Details form Service Cost is 6.83
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.83


  @rates_orders_zone_4
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PM Regional Rate Box B
    Then set Order Details form Weight to 18 lb 0 oz
    Then expect Order Details form Service Cost is 9.19
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 9.19


  @rates_orders_zone_4
  Scenario: PME Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PME Package
    Then set Order Details form Weight to 26 lb 0 oz
    Then expect Order Details form Service Cost is 111.35
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 111.35


  @rates_orders_zone_4
  Scenario: PME Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PME Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.18


  @rates_orders_zone_4
  Scenario: PME Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 15 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.64


  @rates_orders_zone_4
  Scenario: PME Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.28


  @rates_orders_zone_4
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service MM Package
    Then set Order Details form Weight to 30 lb 0 oz
    Then expect Order Details form Service Cost is 16.61
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 16.61


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PSG Package
    Then set Order Details form Weight to 45 lb 0 oz
    Then expect Order Details form Service Cost is 41.49
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 41.49


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Large Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PSG Large Package
    Then set Order Details form Weight to 21 lb 0 oz
    Then expect Order Details form Service Cost is 20.35
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 20.35


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 4
    Then on Order Details form, select service PSG Oversized Package
    Then set Order Details form Weight to 13 lb 0 oz
    Then expect Order Details form Service Cost is 86.89
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 89.34

    Then Sign out

