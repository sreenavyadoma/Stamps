Feature: January 2017 Rates for Core User in Zone 7

  Background:
    Given A user is signed in to Orders

  @rates_orders_zone_7
  Scenario: FCM Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service FCM Large Envelope
    Then On Order Details form, set Weight to 0 lb 11 oz
    Then On Order Details form, expect service Cost is $3.04
    Then On Order Details form, expect Total Ship Cost is $3.04
    Then Sign out

  @rates_orders_zone_7
  Scenario: First-Class Mail Package/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service First-Class Mail Package/Thick Envelope
    Then On Order Details form, set Weight to 0 lb 8 oz
    Then On Order Details form, expect service Cost is $2.60
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $2.60
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Large/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, set Weight to 33 lb 1 oz
    Then On Order Details form, expect service Cost is $64.26
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $64.26
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Weight to 10 lb 1 oz
    Then On Order Details form, expect service Cost is $31.92
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, expect Total Ship Cost is $31.92
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Large Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Weight to 41 lb 1 oz
    Then On Order Details form, expect service Cost is $73.93
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, set Length to 7
    Then On Order Details form, set Width to 25
    Then On Order Details form, set Height to 25
    Then On Order Details form, expect Total Ship Cost is $73.93
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 31 lb 1 oz
    Then On Order Details form, expect service Cost is $5.75
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Padded Flat Rate Envelope
    Then On Order Details form, set Weight to 22 lb 1 oz
    Then On Order Details form, expect service Cost is $6.10
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, set Weight to 32 lb 1 oz
    Then On Order Details form, expect service Cost is $5.75
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Small Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Small Flat Rate Box
    Then On Order Details form, set Weight to 54 lb 1 oz
    Then On Order Details form, expect service Cost is $6.10
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Medium Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Medium Flat Rate Box
    Then On Order Details form, set Weight to 45 lb 1 oz
    Then On Order Details form, expect service Cost is $11.95
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $11.95
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Large Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Large Flat Rate Box
    Then On Order Details form, set Weight to 30 lb 1 oz
    Then On Order Details form, expect service Cost is $16.35
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $16.35
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Regional Rate Box A
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Regional Rate Box A
    Then On Order Details form, set Weight to 10 lb 1 oz
    Then On Order Details form, expect service Cost is $9.99
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $9.99


  @rates_orders_zone_7
  Scenario: Priority Mail Regional Rate Box B
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PM Regional Rate Box B
    Then On Order Details form, set Weight to 30 lb 1 oz
    Then On Order Details form, expect service Cost is $17.93
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $17.93

  @local_rating_zone_7
  Scenario: Priority Mail Express Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PME Package
    Then On Order Details form, set Weight to 22 lb 1 oz
    Then On Order Details form, expect service Cost is $122.31
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $122.31
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Express Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PME Flat Rate Envelope
    Then On Order Details form, set Weight to 18 lb 1 oz
    Then On Order Details form, expect service Cost is $20.66
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Weight to 56 lb 1 oz
    Then On Order Details form, expect service Cost is $20.66
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_zone_7
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PME Legal Flat Rate Envelope
    Then On Order Details form, set Weight to 39 lb 15 oz
    Then On Order Details form, expect service Cost is $20.66
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_zone_7
  Scenario: MM Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Weight to 65 lb 15 oz
    Then On Order Details form, expect service Cost is $35.22
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $35.22
    Then Sign out

  @rates_orders_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Weight to 37 lb 15 oz
    Then On Order Details form, expect service Cost is $68.02
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $68.02
    Then Sign out

  @rates_orders_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Weight to 58 lb 15 oz
    Then On Order Details form, expect service Cost is $91.52
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $91.52
    Then Sign out

  @rates_orders_zone_7
  Scenario: Parcel Select Ground Oversized Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 7
    Then On Order Details form, select service PSG Oversized Package
    Then On Order Details form, set Weight to 47 lb 15 oz
    Then On Order Details form, expect service Cost is $141.62
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $141.62
    Then Sign out

