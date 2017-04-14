Feature: January 2017 Rates for SAS User in Zone 6

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_sas_zone_6
  Scenario: FCM Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to FCM Large Envelope
    Then set Order Details form Weight to 0 lb 12 oz
    Then expect Order Details form Service Cost is 3.29
    Then expect Order Details form Total Ship Cost is 3.29

  @rates_orders_sas_zone_6
  Scenario: First-Class Mail Package/Thick Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 5 oz
    Then expect Order Details form Service Cost is 2.77
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 2.77

  @rates_orders_sas_zone_6
  Scenario: Priority Mail Large/Thick Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Weight to 34 lb 0 oz
    Then expect Order Details form Service Cost is 54.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 54.18


  @rates_orders_sas_zone_6
  Scenario: Priority Mail Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Package
    Then set Order Details form Weight to 11 lb 0 oz
    Then set Order Details form Length to 10
    Then set Order Details form Width to 10
    Then set Order Details form Height to 10
    Then expect Order Details form Service Cost is 27.00
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 27.00


  @rates_orders_sas_zone_6
  Scenario: Priority Mail Large Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Large Package
    Then set Order Details form Weight to 42 lb 0 oz
    Then set Order Details form Length to 20
    Then set Order Details form Width to 10
    Then set Order Details form Height to 30
    Then expect Order Details form Service Cost is 64.74
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 64.74


  @rates_orders_sas_zone_6
  Scenario: Priority Mail Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 32 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95


  @rates_orders_sas_zone_6
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 23 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50


  @rates_orders_sas_zone_6
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 33 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25


  @rates_orders_sas_zone_6
  Scenario: Priority Mail Small Flat Rate Box
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Small Flat Rate Box
    Then set Order Details form Weight to 55 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45


  @rates_orders_sas_zone_6
  Scenario: Priority Mail Medium Flat Rate Box
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Medium Flat Rate Box
    Then set Order Details form Weight to 46 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40


  @rates_orders_sas_zone_6
  Scenario: Priority Mail Large Flat Rate Box
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PM Large Flat Rate Box
    Then set Order Details form Weight to 31 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05

  @local_rating6
  Scenario: Priority Mail Regional Rate Box A
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 3
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Weight to 3 lb 0 oz
    Then expect Order Details form Service Cost is 9.19
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 9.19

  @local_rating6
  Scenario: Priority Mail Regional Rate Box B
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 3
    Then set Order Details form service to PM Regional Rate Box B
    Then set Order Details form Weight to 1 lb 0 oz
    Then expect Order Details form Service Cost is 15.68
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 15.68


  @rates_orders_sas_zone_6
  Scenario: PME Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PME Package
    Then set Order Details form Weight to 23 lb 0 oz
    Then expect Order Details form Service Cost is 117.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 117.40


  @rates_orders_sas_zone_6
  Scenario: PME Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PME Flat Rate Envelope
    Then set Order Details form Weight to 19 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.18


  @rates_orders_sas_zone_6
  Scenario: PME Padded Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 57 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.64


  @rates_orders_sas_zone_6
  Scenario: PME Legal Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 40 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.28


  @rates_orders_sas_zone_6
  Scenario: MM Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to MM Package
    Then set Order Details form Weight to 66 lb 0 oz
    Then expect Order Details form Service Cost is 33.89
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 33.89


  @rates_orders_sas_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PSG Package
    Then set Order Details form Weight to 38 lb 0 oz
    Then expect Order Details form Service Cost is 59.04
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 59.04


  @rates_orders_sas_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PSG Large Package
    Then set Order Details form Weight to 59 lb 0 oz
    Then expect Order Details form Service Cost is 77.60
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 77.60


  @rates_orders_sas_zone_6
  Scenario: Parcel Select Ground Oversized Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 6
    Then set Order Details form service to PSG Oversized Package
    Then set Order Details form Weight to 48 lb 0 oz
    Then expect Order Details form Service Cost is 123.37
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 125.82

    Then Sign out
