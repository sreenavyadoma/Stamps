Feature: January 2017 Rates for Core User in Zone 6

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_zone_6
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service FCM Large Envelope
    Then set Order Details form Weight to 0 lb 12 oz
    Then expect Order Details form Service Cost is 3.29
    Then expect Order Details form Total Ship Cost is 3.29

  @rates_orders_zone_6
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 5 oz
    Then expect Order Details form Service Cost is 2.77
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 2.77

  @rates_orders_zone_6
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Large Envelope
    Then set Order Details form Weight to 34 lb 0 oz
    Then expect Order Details form Service Cost is 54.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 54.18


  @rates_orders_zone_6
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Package
    Then set Order Details form Weight to 11 lb 0 oz
    Then set Order Details form Length to 10
    Then set Order Details form Width to 10
    Then set Order Details form Height to 10
    Then expect Order Details form Service Cost is 27.00
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 27.00


  @rates_orders_zone_6
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Large Package
    Then set Order Details form Weight to 42 lb 0 oz
    Then set Order Details form Length to 20
    Then set Order Details form Width to 10
    Then set Order Details form Height to 30
    Then expect Order Details form Service Cost is 64.74
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 64.74


  @rates_orders_zone_6
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Weight to 32 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95


  @rates_orders_zone_6
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 23 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50


  @rates_orders_zone_6
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 33 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25


  @rates_orders_zone_6
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Small Flat Rate Box
    Then set Order Details form Weight to 55 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45


  @rates_orders_zone_6
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then set Order Details form Weight to 46 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40


  @rates_orders_zone_6
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Large Flat Rate Box
    Then set Order Details form Weight to 31 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05

  @local_rating6
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Regional Rate Box A
    Then set Order Details form Weight to 3 lb 0 oz
    Then expect Order Details form Service Cost is 9.19
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 9.19

  @local_rating6
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PM Regional Rate Box B
    Then set Order Details form Weight to 1 lb 0 oz
    Then expect Order Details form Service Cost is 15.68
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 15.68


  @rates_orders_zone_6
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PME Package
    Then set Order Details form Weight to 23 lb 0 oz
    Then expect Order Details form Service Cost is 117.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 117.40


  @rates_orders_zone_6
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PME Flat Rate Envelope
    Then set Order Details form Weight to 19 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.18


  @rates_orders_zone_6
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 57 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.64


  @rates_orders_zone_6
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 40 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.28


  @rates_orders_zone_6
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service MM Package
    Then set Order Details form Weight to 66 lb 0 oz
    Then expect Order Details form Service Cost is 33.89
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 33.89


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PSG Package
    Then set Order Details form Weight to 38 lb 0 oz
    Then expect Order Details form Service Cost is 59.04
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 59.04


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PSG Large Package
    Then set Order Details form Weight to 59 lb 0 oz
    Then expect Order Details form Service Cost is 77.60
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 77.60


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 6
    Then on Order Details form, select service PSG Oversized Package
    Then set Order Details form Weight to 48 lb 0 oz
    Then expect Order Details form Service Cost is 123.37
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 125.82

    Then Sign out
