Feature: January 2017 Rates for SAS User in Zone 5

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_sas_zone_5
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service FCM Large Envelope
    Then set Order Details form Weight to 0 lb 5 oz
    Then expect Order Details form Service Cost is 1.82
    Then expect Order Details form Total Ship Cost is 1.82

  @rates_orders_sas_zone_5
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 11 oz
    Then expect Order Details form Service Cost is 3.60
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 3.60

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Large/Thick Envelope
    Then set Order Details form Weight to 1 lb 0 oz
    Then expect Order Details form Service Cost is 6.73
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.73

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Package
    Then set Order Details form Weight to 21 lb 0 oz
    Then set Order Details form Length to 14
    Then set Order Details form Width to 30
    Then set Order Details form Height to 5
    Then expect Order Details form Service Cost is 30.30
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 30.30

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Large Package
    Then set Order Details form Weight to 5 lb 0 oz
    Then set Order Details form Length to 20
    Then set Order Details form Width to 20
    Then set Order Details form Height to 15
    Then expect Order Details form Service Cost is 10.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 10.95

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Weight to 5 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 7 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 15 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Small Flat Rate Box
    Then set Order Details form Weight to 2 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then set Order Details form Weight to 23 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PM Large Flat Rate Box
    Then set Order Details form Weight to 37 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05


  @local_rating5
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Regional Rate Box A
    Then set Order Details form Weight to 7 lb 0 oz
    Then expect Order Details form Service Cost is 8.15
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 8.15

  @local_rating5
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Regional Rate Box B
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 10.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 10.95

  @rates_orders_sas_zone_5
  Scenario: PME Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PME Package
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 51.38
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 51.38

  @rates_orders_sas_zone_5
  Scenario: PME Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PME Flat Rate Envelope
    Then set Order Details form Weight to 10 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.18

  @rates_orders_sas_zone_5
  Scenario: PME Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 4 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.64

  @rates_orders_sas_zone_5
  Scenario: PME Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 28 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.28

  @rates_orders_sas_zone_5
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service MM Package
    Then set Order Details form Weight to 13 lb 0 oz
    Then expect Order Details form Service Cost is 8.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 8.45

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PSG Package
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 13.59
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 13.59

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Large Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PSG Large Package
    Then set Order Details form Weight to 17 lb 0 oz
    Then expect Order Details form Service Cost is 29.42
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 29.42

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 5
    Then on Order Details form, select service PSG Oversized Package
    Then set Order Details form Weight to 56 lb 0 oz
    Then expect Order Details form Service Cost is 106.11
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 108.56

    Then Sign out
