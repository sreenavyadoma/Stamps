Feature: Local Rating test for Zone 9

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_zone_9
  Scenario: FCM Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to FCM Large Envelope
    Then set Order Details form Weight to 0 lb 4 oz
    Then expect Order Details form Service Cost is 1.61
     Then expect Order Details form Total Ship Cost is 1.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: First-Class Mail Package/Thick Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 10 oz
    Then expect Order Details form Service Cost is 3.46
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 3.46
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large/Thick Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Weight to 0 lb 8 oz
    Then expect Order Details form Service Cost is 9.89
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 9.89
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Package
    Then set Order Details form Weight to 2 lb 0 oz
    Then expect Order Details form Service Cost is 15.14
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Large Package
    Then set Order Details form Weight to 22 lb 0 oz
      Then set Order Details form Length to 30
    Then set Order Details form Width to 15
    Then set Order Details form Height to 15
    Then expect Order Details form Service Cost is 86.59
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 86.59
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 13 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 3 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Small Flat Rate Box
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Small Flat Rate Box
    Then set Order Details form Weight to 2 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Medium Flat Rate Box
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Medium Flat Rate Box
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Flat Rate Box
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Large Flat Rate Box
    Then set Order Details form Weight to 15 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05
    Then Sign out


  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box A
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Weight to 4 lb 0 oz
    Then expect Order Details form Service Cost is 15.14
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box B
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PM Regional Rate Box B
    Then set Order Details form Weight to 12 lb 0 oz
    Then expect Order Details form Service Cost is 28.72
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 28.72

  @rates_orders_zone_9
  Scenario: PME Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PME Package
    Then set Order Details form Weight to 9 lb 0 oz
    Then expect Order Details form Service Cost is 90.96
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 90.96
    Then Sign out

  @rates_orders_zone_9
  Scenario: PME Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PME Flat Rate Envelope
    Then set Order Details form Weight to 7 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.18
    Then Sign out

  @rates_orders_zone_9
  Scenario: PME Padded Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 11 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.64
    Then Sign out

  @rates_orders_zone_9
  Scenario: PME Legal Flat Rate Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 16 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.28
    Then Sign out

  @rates_orders_zone_9
  Scenario: MM Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to MM Package
    Then set Order Details form Weight to 3 lb 0 oz
    Then expect Order Details form Service Cost is 3.61
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 3.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PSG Package
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 23.32
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 23.32
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PSG Package
    Then set Order Details form Weight to 12 lb 0 oz
    Then expect Order Details form Service Cost is 57.74
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 57.74
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Oversized Package
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 9
    Then set Order Details form service to PSG Oversized Package
    Then set Order Details form Weight to 50 lb 0 oz
    Then expect Order Details form Service Cost is 173.87
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 173.32
    Then Sign out
