Feature: January 2017 Rates for Core User in Zone 6

  Background:
    Given A user is signed in to Orders

  @rates_orders_zone_6
  Scenario: FCM Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service FCM Large Envelope
    Then On Order Details form, set Weight to 0 lb 12 oz
    Then On Order Details form, expect service Cost is $3.29
    Then On Order Details form, expect Total Ship Cost is $3.29

  @rates_orders_zone_6
  Scenario: First-Class Mail Package/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service First-Class Mail Package/Thick Envelope
    Then On Order Details form, set Weight to 0 lb 5 oz
    Then On Order Details form, expect service Cost is $2.77
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $2.77

  @rates_orders_zone_6
  Scenario: Priority Mail Large/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, set Weight to 34 lb 0 oz
    Then On Order Details form, expect service Cost is $54.18
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $54.18


  @rates_orders_zone_6
  Scenario: Priority Mail Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Weight to 11 lb 0 oz
    Then On Order Details form, set Length to 10
    Then On Order Details form, set Width to 10
    Then On Order Details form, set Height to 10
    Then On Order Details form, expect service Cost is $27.00
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $27.00


  @rates_orders_zone_6
  Scenario: Priority Mail Large Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Weight to 42 lb 0 oz
    Then On Order Details form, set Length to 20
    Then On Order Details form, set Width to 10
    Then On Order Details form, set Height to 30
    Then On Order Details form, expect service Cost is $64.74
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $64.74


  @rates_orders_zone_6
  Scenario: Priority Mail Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Weight to 32 lb 3 oz
    Then On Order Details form, expect service Cost is $5.95
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $5.95


  @rates_orders_zone_6
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Padded Flat Rate Envelope
    Then On Order Details form, set Weight to 23 lb 0 oz
    Then On Order Details form, expect service Cost is $6.50
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $6.50


  @rates_orders_zone_6
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, set Weight to 33 lb 0 oz
    Then On Order Details form, expect service Cost is $6.25
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $6.25


  @rates_orders_zone_6
  Scenario: Priority Mail Small Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Small Flat Rate Box
    Then On Order Details form, set Weight to 55 lb 0 oz
    Then On Order Details form, expect service Cost is $6.45
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $6.45


  @rates_orders_zone_6
  Scenario: Priority Mail Medium Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Medium Flat Rate Box
    Then On Order Details form, set Weight to 46 lb 0 oz
    Then On Order Details form, expect service Cost is $12.40
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $12.40


  @rates_orders_zone_6
  Scenario: Priority Mail Large Flat Rate Box
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Large Flat Rate Box
    Then On Order Details form, set Weight to 31 lb 0 oz
    Then On Order Details form, expect service Cost is $17.05
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $17.05

  @local_rating6
  Scenario: Priority Mail Regional Rate Box A
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Regional Rate Box A
    Then On Order Details form, set Weight to 3 lb 0 oz
    Then On Order Details form, expect service Cost is $9.19
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $9.19

  @local_rating6
  Scenario: Priority Mail Regional Rate Box B
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PM Regional Rate Box B
    Then On Order Details form, set Weight to 1 lb 0 oz
    Then On Order Details form, expect service Cost is $15.68
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $15.68


  @rates_orders_zone_6
  Scenario: Priority Mail Express Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PME Package
    Then On Order Details form, set Weight to 23 lb 0 oz
    Then On Order Details form, expect service Cost is $117.40
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $117.40


  @rates_orders_zone_6
  Scenario: Priority Mail Express Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PME Flat Rate Envelope
    Then On Order Details form, set Weight to 19 lb 0 oz
    Then On Order Details form, expect service Cost is $21.18
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $21.18


  @rates_orders_zone_6
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Weight to 57 lb 0 oz
    Then On Order Details form, expect service Cost is $21.64
    Then On Order Details form, set Tracking to Signature Required
    Then On Order Details form, expect Total Ship Cost is $21.64


  @rates_orders_zone_6
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PME Legal Flat Rate Envelope
    Then On Order Details form, set Weight to 40 lb 0 oz
    Then On Order Details form, expect service Cost is $21.28
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $21.28


  @rates_orders_zone_6
  Scenario: MM Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Weight to 66 lb 0 oz
    Then On Order Details form, expect service Cost is $33.89
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $33.89


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Weight to 38 lb 0 oz
    Then On Order Details form, expect service Cost is $59.04
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $59.04


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PSG Large Package
    Then On Order Details form, set Weight to 59 lb 0 oz
    Then On Order Details form, expect service Cost is $77.60
    Then On Order Details form, set Tracking to USPS Tracking
    Then On Order Details form, expect Total Ship Cost is $77.60


  @rates_orders_zone_6
  Scenario: Parcel Select Ground Oversized Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to address in Zone 6
    Then On Order Details form, select service PSG Oversized Package
    Then On Order Details form, set Weight to 48 lb 0 oz
    Then On Order Details form, expect service Cost is $123.37
    Then On Order Details form, set Tracking to Signature Required
    Then On Order Details form, expect Total Ship Cost is $125.82

    Then Sign out
