Feature: January 2017 Rates for CPP User in Zone 8

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_cpp_zone_8
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service FCM Large Envelope
    Then set Order Details form Weight to 0 lb 13 oz
    Then expect Order Details form Service Cost is 3.50
    Then expect Order Details form Total Ship Cost is 3.50

  @rates_orders_cpp_zone_8
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 10 oz
    Then expect Order Details form Service Cost is 3.46
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 3.46

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Large Envelope
    Then set Order Details form Weight to 26 lb 0 oz
    Then expect Order Details form Service Cost is 65.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 65.40

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Package
    Then set Order Details form Weight to 18 lb 0 oz
    Then set Order Details form Length to 8
    Then set Order Details form Width to 16
    Then set Order Details form Height to 9
    Then expect Order Details form Service Cost is 53.88
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 53.88

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Large Package
    Then set Order Details form Weight to 32 lb 0 oz
    Then set Order Details form Tracking to USPS Tracking
    Then set Order Details form Length to 30
    Then set Order Details form Width to 15
    Then set Order Details form Height to 15
    Then expect Order Details form Service Cost is 76.91
    Then expect Order Details form Total Ship Cost is 76.91

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Weight to 53 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 25 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 37 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Small Flat Rate Box
    Then set Order Details form Weight to 61 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then set Order Details form Weight to 40 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PM Large Flat Rate Box
    Then set Order Details form Weight to 35 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05

  @local_rating8
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Regional Rate Box A
    Then set Order Details form Weight to 5 lb 0 oz
    Then expect Order Details form Service Cost is 10.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 10.28

  @local_rating8
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Regional Rate Box B
    Then set Order Details form Weight to 2 lb 0 oz
    Then expect Order Details form Service Cost is 20.41
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 20.41

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PME Package
    Then set Order Details form Weight to 56 lb 0 oz
    Then expect Order Details form Service Cost is 276.79
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 276.79

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PME Flat Rate Envelope
    Then set Order Details form Weight to 4 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.18

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 21 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.64

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 70 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.28

  @rates_orders_cpp_zone_8
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service MM Package
    Then set Order Details form Weight to 39 lb 0 oz
    Then expect Order Details form Service Cost is 20.93
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 20.93

  @rates_orders_cpp_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PSG Package
    Then set Order Details form Weight to 12 lb 0 oz
    Then expect Order Details form Service Cost is 41.35
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 41.35

  @rates_orders_cpp_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PSG Large Package
    Then set Order Details form Weight to 24 lb 0 oz
    Then expect Order Details form Service Cost is 62.29
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 62.29

  @rates_orders_cpp_zone_8
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 8
    Then on Order Details form, select service PSG Oversized Package
    Then set Order Details form Weight to 7 lb 0 oz
    Then expect Order Details form Service Cost is 173.87
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 176.32


    Then Sign out
