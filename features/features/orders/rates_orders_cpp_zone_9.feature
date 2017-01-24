Feature: January 2017 Rates for CPP User in Zone 9

  Background:
    Given A user is signed in to Orders

  @rates_orders_cpp_zone_9
  Scenario: FCM Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service FCM Large Envelope
    Then On Order Details form, expect service Cost is $3.62
    Then On Order Details form, set Weight to 0 lb 13 oz
    Then On Order Details form, expect Total Ship Cost is $3.62
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: First-Class Mail Package/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service First-Class Mail Package/Thick Envelope
    Then On Order Details form, set Weight to 0 lb 10 oz
    Then On Order Details form, expect service Cost is $3.35
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $3.35
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Large/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, set Weight to 26 lb 0 oz
    Then On Order Details form, expect service Cost is $63.49
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $63.49
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Weight to 18 lb 0 oz
    Then On Order Details form, expect service Cost is $52.31
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, set Length to 8
    Then On Order Details form, set Width to 16
    Then On Order Details form, set Height to 9
    Then On Order Details form, expect Total Ship Cost is $52.31
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Large Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Weight to 32 lb 0 oz
    Then On Order Details form, expect service Cost is $78.80
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, set Length to 30
    Then On Order Details form, set Width to 15
    Then On Order Details form, set Height to 15
    Then On Order Details form, expect Total Ship Cost is $78.80
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 53 lb 3 oz
    Then On Order Details form, expect service Cost is $5.75
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Padded Flat Rate Envelope
    Then On Order Details form, set Weight to 25 lb 0 oz
    Then On Order Details form, expect service Cost is $6.10
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, set Weight to 37 lb 0 oz
    Then On Order Details form, expect service Cost is $5.75
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Small Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Small Flat Rate Box
    Then On Order Details form, set Weight to 61 lb 0 oz
    Then On Order Details form, expect service Cost is $6.10
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Medium Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Medium Flat Rate Box
    Then On Order Details form, set Weight to 40 lb 0 oz
    Then On Order Details form, expect service Cost is $11.95
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $11.95
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Large Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PM Large Flat Rate Box
    Then On Order Details form, set Weight to 35 lb 0 oz
    Then On Order Details form, expect service Cost is $16.35
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $16.35
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Express Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PME Package
    Then On Order Details form, set Weight to 56 lb 0 oz
    Then On Order Details form, expect service Cost is $274.05
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $274.05
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Express Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PME Flat Rate Envelope
    Then On Order Details form, set Weight to 4 lb 0 oz
    Then On Order Details form, expect service Cost is $20.66
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Weight to 21 lb 0 oz
    Then On Order Details form, expect service Cost is $20.66
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PME Legal Flat Rate Envelope
    Then On Order Details form, set Weight to 70 lb 0 oz
    Then On Order Details form, expect service Cost is $20.66
    Then On Order Details form, set Tracking to Signature Required
    Then On Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: MM Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Weight to 39 lb 0 oz
    Then On Order Details form, expect service Cost is $21.72
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $21.72
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Weight to 12 lb 0 oz
    Then On Order Details form, expect service Cost is $40.14
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $40.14
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Weight to 24 lb 0 oz
    Then On Order Details form, expect service Cost is $60.47
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $60.47
    Then Sign out

  @rates_orders_cpp_zone_9
  Scenario: Parcel Select Ground Oversized Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 9
    Then On Order Details form, select service PSG Oversized Package
    Then On Order Details form, set Weight to 7 lb 0 oz
    Then On Order Details form, expect service Cost is $169.87
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $169.87
    Then Sign out
