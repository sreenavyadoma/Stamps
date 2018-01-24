Feature: January 2017 Rates for Core User in Zone 4

  Background:
    Given Login and add order domestic

  @rates_orders_zone_4
  Scenario: FCM Package
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to FCM Large Envelope/Flat
    Then set Order Details Weight to 0 lb 1 oz
    Then expect Order Details Service Cost is 0.98
    Then expect Order Details Total Ship Cost is 0.98
    Then Sign out


  @rates_orders_zone_4
  Scenario: First-Class Mail Package/Thick Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set Order Details Weight to 0 lb 5 oz
    Then expect Order Details Service Cost is 2.77
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 2.77
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Large/Thick Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Large/Thick Envelope
    Then set Order Details Weight to 2 lb 8 oz
    Then expect Order Details Service Cost is 7.86
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 7.86
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Package
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Package
    Then set Order Details Weight to 13 lb 0 oz
    Then expect Order Details Service Cost is 15.11
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 15.11
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Large Package
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Large Package
    Then set Order Details Weight to 32 lb 0 oz
    Then expect Order Details Service Cost is 34.64
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 34.64
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Weight to 2 lb 3 oz
    Then expect Order Details Service Cost is 5.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set Order Details Weight to 12 lb 0 oz
    Then expect Order Details Service Cost is 6.50
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set Order Details Weight to 5 lb 0 oz
    Then expect Order Details Service Cost is 6.25
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Small Flat Rate Box
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Small Flat Rate Box
    Then set Order Details Weight to 23 lb 0 oz
    Then expect Order Details Service Cost is 6.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Medium Flat Rate Box
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Medium Flat Rate Box
    Then set Order Details Weight to 14 lb 0 oz
    Then expect Order Details Service Cost is 12.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Large Flat Rate Box
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Large Flat Rate Box
    Then set Order Details Weight to 3 lb 0 oz
    Then expect Order Details Service Cost is 17.05
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Regional Rate Box A
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Regional Rate Box A
    Then set Order Details Weight to 7 lb 0 oz
    Then expect Order Details Service Cost is 6.83
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.83
    Then Sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Regional Rate Box B
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PM Regional Rate Box B
    Then set Order Details Weight to 18 lb 0 oz
    Then expect Order Details Service Cost is 9.19
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 9.19
    Then Sign out


  @rates_orders_zone_4
  Scenario: PME Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PME Package/Flat/Thick Envelope
    Then set Order Details Weight to 26 lb 0 oz
    Then expect Order Details Service Cost is 111.35
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 111.35
    Then Sign out


  @rates_orders_zone_4
  Scenario: PME Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PME Flat Rate Envelope
    Then set Order Details Weight to 1 lb 0 oz
    Then expect Order Details Service Cost is 21.18
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then Sign out


  @rates_orders_zone_4
  Scenario: PME Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Weight to 15 lb 0 oz
    Then expect Order Details Service Cost is 21.64
    Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.64
    Then Sign out


  @rates_orders_zone_4
  Scenario: PME Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set Order Details Weight to 6 lb 0 oz
    Then expect Order Details Service Cost is 21.28
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.28
    Then Sign out


  @rates_orders_zone_4
  Scenario: MM Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set Order Details Weight to 30 lb 0 oz
    Then expect Order Details Service Cost is 16.61
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 16.61
    Then Sign out


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PSG Package/Flat/Thick Envelope
    Then set Order Details Weight to 45 lb 0 oz
    Then expect Order Details Service Cost is 41.49
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 41.49
    Then Sign out


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Large Package
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PSG Large Package
    Then set Order Details Weight to 21 lb 0 oz
    Then expect Order Details Service Cost is 20.35
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.35
    Then Sign out


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Oversized Package
    Then set Order Details Ship-To to random address in zone 4
    Then set Order Details service to PSG Oversized Package
    Then set Order Details Weight to 13 lb 0 oz
    Then expect Order Details Service Cost is 86.89
    Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 89.34
    Then Sign out

