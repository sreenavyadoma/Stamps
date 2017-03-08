Feature: January 2017 Rates for Core User in Zone 3

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_zone_3
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service FCM Large Envelope
    Then set Order Details form Weight to 0 lb 2 oz
    Then expect Order Details form Service Cost is 1.19
    Then expect Order Details form Total Ship Cost is 1.19

  @rates_orders_zone_3
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 15 oz
    Then expect Order Details form Service Cost is 4.16
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 4.16

  @rates_orders_zone_3
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Large Envelope
    Then set Order Details form Weight to 1 lb 5 oz
    Then expect Order Details form Service Cost is 6.60
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.60

  @rates_orders_zone_3
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Package
    Then set Order Details form Weight to 3 lb 0 oz
    Then expect Order Details form Service Cost is 7.38
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 7.38

  @rates_orders_zone_3
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Large Package
    Then set Order Details form Weight to 12 lb 0 oz
    Then expect Order Details form Service Cost is 17.17
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.17

  @rates_orders_zone_3
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Weight to 5 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95

  @rates_orders_zone_3
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 7 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50

  @rates_orders_zone_3
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 2 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25

  @rates_orders_zone_3
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Small Flat Rate Box
    Then set Order Details form Weight to 8 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45

  @rates_orders_zone_3
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then set Order Details form Weight to 13 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40

  @rates_orders_zone_3
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Large Flat Rate Box
    Then set Order Details form Weight to 15 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05

  @rates_orders_zone_3
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Regional Rate Box A
    Then set Order Details form Weight to 5 lb 0 oz
    Then expect Order Details form Service Cost is 6.60
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.60

  @rates_orders_zone_3
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PM Regional Rate Box B
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 8.01
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 8.01

  @rates_orders_zone_3
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PME Package
    Then set Order Details form Weight to 11 lb 0 oz
    Then expect Order Details form Service Cost is 48.54
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 48.54

  @rates_orders_zone_3
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PME Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.18

  @rates_orders_zone_3
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 14 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.64

  @rates_orders_zone_3
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 4 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.28

  @rates_orders_zone_3
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service MM Package
    Then set Order Details form Weight to 13 lb 0 oz
    Then expect Order Details form Service Cost is 8.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 8.45

  @rates_orders_zone_3
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PSG Package
    Then set Order Details form Weight to 23 lb 0 oz
    Then expect Order Details form Service Cost is 19.29
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 19.29

  @rates_orders_zone_3
  Scenario: Parcel Select Ground Large Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PSG Large Package
    Then set Order Details form Weight to 33 lb 0 oz
    Then expect Order Details form Service Cost is 26.46
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 26.46

  @rates_orders_zone_3
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to address in Zone 3
    Then on Order Details form, select service PSG Oversized Package
    Then set Order Details form Weight to 40 lb 0 oz
    Then expect Order Details form Service Cost is 67.94
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 70.39

    Then Sign out
