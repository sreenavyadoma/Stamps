Feature: January 2017 Rates for Core User in Zone 9

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_zone_8
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Weight to 0 lb 13 oz
    Then on Order Details form, expect Service Cost is $3.50
    Then on Order Details form, expect Total Ship Cost is $3.50

  @rates_orders_zone_8
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then on Order Details form, set Weight to 0 lb 10 oz
    Then on Order Details form, expect Service Cost is $3.46
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $3.46

  @rates_orders_zone_8
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Weight to 26 lb 0 oz
    Then on Order Details form, expect Service Cost is $65.40
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $65.40

  @rates_orders_zone_8
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Weight to 18 lb 0 oz
    Then on Order Details form, set Length to 8
    Then on Order Details form, set Width to 16
    Then on Order Details form, set Height to 9
    Then on Order Details form, expect Service Cost is $53.88
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $53.88

  @rates_orders_zone_8
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Weight to 32 lb 0 oz
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, set Length to 30
    Then on Order Details form, set Width to 15
    Then on Order Details form, set Height to 15
    Then on Order Details form, expect Service Cost is $76.91
    Then on Order Details form, expect Total Ship Cost is $76.91

  @rates_orders_zone_8
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 53 lb 3 oz
    Then on Order Details form, expect Service Cost is $5.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.95

  @rates_orders_zone_8
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 25 lb 0 oz
    Then on Order Details form, expect Service Cost is $6.50
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.50

  @rates_orders_zone_8
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 37 lb 0 oz
    Then on Order Details form, expect Service Cost is $6.25
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.25

  @rates_orders_zone_8
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, set Weight to 61 lb 0 oz
    Then on Order Details form, expect Service Cost is $6.45
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.45

  @rates_orders_zone_8
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, set Weight to 40 lb 0 oz
    Then on Order Details form, expect Service Cost is $12.40
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $12.40

  @rates_orders_zone_8
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, set Weight to 35 lb 0 oz
    Then on Order Details form, expect Service Cost is $17.05
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $17.05

  @local_rating8
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Weight to 5 lb 0 oz
    Then on Order Details form, expect Service Cost is $10.28
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $10.28

  @local_rating8
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, expect Service Cost is $20.41
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $20.41

  @rates_orders_zone_8
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Weight to 56 lb 0 oz
    Then on Order Details form, expect Service Cost is $276.79
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $276.79

  @rates_orders_zone_8
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, set Weight to 4 lb 0 oz
    Then on Order Details form, expect Service Cost is $21.18
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $21.18

  @rates_orders_zone_8
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 21 lb 0 oz
    Then on Order Details form, expect Service Cost is $21.64
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $21.64

  @rates_orders_zone_8
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 70 lb 0 oz
    Then on Order Details form, expect Service Cost is $21.28
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $21.28

  @rates_orders_zone_8
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Weight to 39 lb 0 oz
    Then on Order Details form, expect Service Cost is $20.93
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $20.93

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Weight to 12 lb 0 oz
    Then on Order Details form, expect Service Cost is $41.35
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $41.35

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PSG Large Package
    Then on Order Details form, set Weight to 24 lb 0 oz
    Then on Order Details form, expect Service Cost is $62.29
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $62.29

  @rates_orders_zone_8
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 8
    Then on Order Details form, select service PSG Oversized Package
    Then on Order Details form, set Weight to 7 lb 0 oz
    Then on Order Details form, expect Service Cost is $173.87
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $176.32


    Then Sign out
