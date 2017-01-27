Feature: January 2017 Rates for SAS User in Zone 5

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_sas_zone_5
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Weight to 0 lb 5 oz
    Then on Order Details form, expect service Cost is $1.82
    Then on Order Details form, expect Total Ship Cost is $1.82

  @rates_orders_sas_zone_5
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then on Order Details form, set Weight to 0 lb 11 oz
    Then on Order Details form, expect service Cost is $3.60
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $3.60

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Weight to 1 lb 0 oz
    Then on Order Details form, expect service Cost is $6.73
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.73

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Weight to 21 lb 0 oz
    Then on Order Details form, set Length to 14
    Then on Order Details form, set Width to 30
    Then on Order Details form, set Height to 5
    Then on Order Details form, expect service Cost is $30.30
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $30.30

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Weight to 5 lb 0 oz
    Then on Order Details form, set Length to 20
    Then on Order Details form, set Width to 20
    Then on Order Details form, set Height to 15
    Then on Order Details form, expect service Cost is $10.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $10.95

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 5 lb 3 oz
    Then on Order Details form, expect service Cost is $5.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.95

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 7 lb 0 oz
    Then on Order Details form, expect service Cost is $6.50
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.50

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 15 lb 0 oz
    Then on Order Details form, expect service Cost is $6.25
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.25

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, expect service Cost is $6.45
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.45

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, set Weight to 23 lb 0 oz
    Then on Order Details form, expect service Cost is $12.40
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $12.40

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, set Weight to 37 lb 0 oz
    Then on Order Details form, expect service Cost is $17.05
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $17.05


  @local_rating5
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 3
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Weight to 7 lb 0 oz
    Then on Order Details form, expect service Cost is $8.15
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $8.15

  @local_rating5
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 3
    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect service Cost is $10.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $10.95

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect service Cost is $51.38
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $51.38

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, set Weight to 10 lb 0 oz
    Then on Order Details form, expect service Cost is $21.18
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $21.18

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 4 lb 0 oz
    Then on Order Details form, expect service Cost is $21.64
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $21.64

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 28 lb 0 oz
    Then on Order Details form, expect service Cost is $21.28
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $21.28

  @rates_orders_sas_zone_5
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Weight to 13 lb 0 oz
    Then on Order Details form, expect service Cost is $8.45
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $8.45

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect service Cost is $13.59
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $13.59

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PSG Large Package
    Then on Order Details form, set Weight to 17 lb 0 oz
    Then on Order Details form, expect service Cost is $29.42
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $29.42

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 5
    Then on Order Details form, select service PSG Oversized Package
    Then on Order Details form, set Weight to 56 lb 0 oz
    Then on Order Details form, expect service Cost is $106.11
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, expect Total Ship Cost is $108.56

    Then Sign out
