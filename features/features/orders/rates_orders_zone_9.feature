Feature: Local Rating test for Zone 9

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_zone_9
  Scenario: FCM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Weight to 0 lb 4 oz
    Then on Order Details form, expect Service Cost is $1.61
     Then on Order Details form, expect Total Ship Cost is $1.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: First-Class Mail Package/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then on Order Details form, set Weight to 0 lb 10 oz
    Then on Order Details form, expect Service Cost is $3.46
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $3.46
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Weight to 0 lb 8 oz
    Then on Order Details form, expect Service Cost is $9.89
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $9.89
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, expect Service Cost is $15.14
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Weight to 22 lb 0 oz
      Then on Order Details form, set Length to 30
    Then on Order Details form, set Width to 15
    Then on Order Details form, set Height to 15
    Then on Order Details form, expect Service Cost is $86.59
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $86.59
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Weight to 13 lb 3 oz
    Then on Order Details form, expect Service Cost is $5.95
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $5.95
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 3 lb 0 oz
    Then on Order Details form, expect Service Cost is $6.50
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.50
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect Service Cost is $6.25
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.25
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Small Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, expect Service Cost is $6.45
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $6.45
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Medium Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect Service Cost is $12.40
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $12.40
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Flat Rate Box
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, set Weight to 15 lb 0 oz
    Then on Order Details form, expect Service Cost is $17.05
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $17.05
    Then Sign out


  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Weight to 4 lb 0 oz
    Then on Order Details form, expect Service Cost is $15.14
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box B
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, set Weight to 12 lb 0 oz
    Then on Order Details form, expect Service Cost is $28.72
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $28.72

  @rates_orders_zone_9
  Scenario: Priority Mail Express Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Weight to 9 lb 0 oz
    Then on Order Details form, expect Service Cost is $90.96
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $90.96
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, set Weight to 7 lb 0 oz
    Then on Order Details form, expect Service Cost is $21.18
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $21.18
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Weight to 11 lb 0 oz
    Then on Order Details form, expect Service Cost is $21.64
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $21.64
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, set Weight to 16 lb 0 oz
    Then on Order Details form, expect Service Cost is $21.28
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $21.28
    Then Sign out

  @rates_orders_zone_9
  Scenario: MM Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Weight to 3 lb 0 oz
    Then on Order Details form, expect Service Cost is $3.61
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $3.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Weight to 6 lb 0 oz
    Then on Order Details form, expect Service Cost is $23.32
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $23.32
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Weight to 12 lb 0 oz
    Then on Order Details form, expect Service Cost is $57.74
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $57.74
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Oversized Package
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to address in Zone 9
    Then on Order Details form, select service PSG Oversized Package
    Then on Order Details form, set Weight to 50 lb 0 oz
    Then on Order Details form, expect Service Cost is $173.87
    Then on Order Details form, set Tracking to USPS Tracking
    Then on Order Details form, expect Total Ship Cost is $173.32
    Then Sign out
