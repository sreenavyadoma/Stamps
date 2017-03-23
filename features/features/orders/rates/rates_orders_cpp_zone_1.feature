Feature: January 2017 Rates for CPP User in Zone 1

  Background:
    Given a valid user is signed in to Web Apps

  @rates_orders_cpp_zone_1
  Scenario:  FCM Package
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to FCM Large Envelope
    Then set Order Details form Weight to 0 lb 1 oz
    Then expect Order Details form Service Cost is 0.98
    Then expect Order Details form Total Ship Cost is 0.98
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario:  First-Class Mail Package/Thick Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to First-Class Mail Package/Thick Envelope
    Then set Order Details form Weight to 0 lb 5 oz
    Then expect Order Details form Service Cost is 2.77
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 2.77
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario:  Priority Mail Large/Thick Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Weight to 1 lb 0 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario:  service Priority Mail Package
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Package
    Then set Order Details form Weight to 2 lb 0 oz
    Then expect Order Details form Service Cost is 6.52
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.52
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario:  Priority Mail Large Package
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Large Package
    Then set Order Details form Weight to 8 lb 0 oz
    Then expect Order Details form Service Cost is 14.02
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 14.02
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario:  Priority Mail Flat Rate Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Weight to 0 lb 3 oz
    Then expect Order Details form Service Cost is 5.95
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 5.95
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario:  Priority Mail Padded Flat Rate Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then set Order Details form Weight to 5 lb 0 oz
    Then expect Order Details form Service Cost is 6.50
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.50
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario:  service Priority Mail Legal Flat Rate Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Weight to 10 lb 0 oz
    Then expect Order Details form Service Cost is 6.25
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.25
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario:  Priority Mail Small Flat Rate Box
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Small Flat Rate Box
    Then set Order Details form Weight to 2 lb 0 oz
    Then expect Order Details form Service Cost is 6.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.45
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: Priority Mail Medium Flat Rate Box
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Medium Flat Rate Box
    Then set Order Details form Weight to 6 lb 0 oz
    Then expect Order Details form Service Cost is 12.40
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 12.40
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: Priority Mail Large Flat Rate Box
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Large Flat Rate Box
    Then set Order Details form Weight to 15 lb 0 oz
    Then expect Order Details form Service Cost is 17.05
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 17.05
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: Priority Mail Regional Rate Box A
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Weight to 4 lb 0 oz
    Then expect Order Details form Service Cost is 6.52
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 6.52
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: Priority Mail Regional Rate Box B
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Regional Rate Box B
    Then set Order Details form Weight to 12 lb 0 oz
    Then expect Order Details form Service Cost is 7.17
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 7.17
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: PME Package
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PME Package
    Then set Order Details form Weight to 13 lb 0 oz
    Then expect Order Details form Service Cost is 38.72
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 38.72
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: PME Flat Rate Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PME Flat Rate Envelope
    Then set Order Details form Weight to 7 lb 0 oz
    Then expect Order Details form Service Cost is 21.18
    Then set Order Details form Tracking to Signature Required
    Then expect Order Details form Total Ship Cost is 21.18
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: PME Padded Flat Rate Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Weight to 11 lb 0 oz
    Then expect Order Details form Service Cost is 21.64
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.64
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: PME Legal Flat Rate Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PME Legal Flat Rate Envelope
    Then set Order Details form Weight to 16 lb 0 oz
    Then expect Order Details form Service Cost is 21.28
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 21.28
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: MM Package
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to MM Package
    Then set Order Details form Weight to 17 lb 0 oz
    Then expect Order Details form Service Cost is 10.37
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 10.37
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PSG Package
    Then set Order Details form Weight to 25 lb 0 oz
    Then expect Order Details form Service Cost is 18.11
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 18.11
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: Parcel Select Ground Large Package
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PSG Large Package
    Then set Order Details form Weight to 35 lb 0 oz
    Then expect Order Details form Service Cost is 23.45
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 23.45
    Then Sign out

  @rates_orders_cpp_zone_1
  Scenario: Parcel Select Ground Oversized Package
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PSG Oversized Package
    Then set Order Details form Weight to 40 lb 0 oz
    Then expect Order Details form Service Cost is 63.99
    Then set Order Details form Tracking to USPS Tracking
    Then expect Order Details form Total Ship Cost is 63.99
    Then Sign out

    Then Sign out
