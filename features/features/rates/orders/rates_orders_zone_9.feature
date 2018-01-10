Feature: Local Rating test for Zone 9

  Background:
    Given Login and add order domestic

  @rates_orders_zone_9
  Scenario: FCM Package
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to FCM Large Envelope
    Then set Order Details Weight to 0 lb 4 oz
    Then expect Order Details Service Cost is 1.61
    Then expect Order Details Total Ship Cost is 1.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: First-Class Mail Package/Thick Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set Order Details Weight to 0 lb 10 oz
    Then expect Order Details Service Cost is 3.46
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 3.46
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large/Thick Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Large/Thick Envelope
    Then set Order Details Weight to 0 lb 8 oz
    Then expect Order Details Service Cost is 9.89
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 9.89
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Package
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Package
    Then set Order Details Weight to 2 lb 0 oz
    Then expect Order Details Service Cost is 15.14
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Package
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Large Package
    Then set Order Details Weight to 22 lb 0 oz
    Then set Order Details Length to 30
    Then set Order Details Width to 15
    Then set Order Details Height to 15
    Then expect Order Details Service Cost is 86.59
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 86.59
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Weight to 13 lb 3 oz
    Then expect Order Details Service Cost is 5.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set Order Details Weight to 3 lb 0 oz
    Then expect Order Details Service Cost is 6.50
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set Order Details Weight to 6 lb 0 oz
    Then expect Order Details Service Cost is 6.25
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Small Flat Rate Box
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Small Flat Rate Box
    Then set Order Details Weight to 2 lb 0 oz
    Then expect Order Details Service Cost is 6.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Medium Flat Rate Box
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Medium Flat Rate Box
    Then set Order Details Weight to 6 lb 0 oz
    Then expect Order Details Service Cost is 12.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Flat Rate Box
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Large Flat Rate Box
    Then set Order Details Weight to 15 lb 0 oz
    Then expect Order Details Service Cost is 17.05
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then Sign out


  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box A
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Regional Rate Box A
    Then set Order Details Weight to 4 lb 0 oz
    Then expect Order Details Service Cost is 15.14
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box B
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PM Regional Rate Box B
    Then set Order Details Weight to 12 lb 0 oz
    Then expect Order Details Service Cost is 28.72
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 28.72

  @rates_orders_zone_9
  Scenario: PME Package
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PME Package
    Then set Order Details Weight to 9 lb 0 oz
    Then expect Order Details Service Cost is 90.96
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 90.96
    Then Sign out

  @rates_orders_zone_9
  Scenario: PME Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PME Flat Rate Envelope
    Then set Order Details Weight to 7 lb 0 oz
    Then expect Order Details Service Cost is 21.18
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then Sign out

  @rates_orders_zone_9
  Scenario: PME Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Weight to 11 lb 0 oz
    Then expect Order Details Service Cost is 21.64
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.64
    Then Sign out

  @rates_orders_zone_9
  Scenario: PME Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set Order Details Weight to 16 lb 0 oz
    Then expect Order Details Service Cost is 21.28
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.28
    Then Sign out

  @rates_orders_zone_9
  Scenario: MM Package
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to MM Package
    Then set Order Details Weight to 3 lb 0 oz
    Then expect Order Details Service Cost is 3.61
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 3.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PSG Package
    Then set Order Details Weight to 6 lb 0 oz
    Then expect Order Details Service Cost is 23.32
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 23.32
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PSG Package
    Then set Order Details Weight to 12 lb 0 oz
    Then expect Order Details Service Cost is 57.74
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 57.74
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Oversized Package
    Then set Order Details Ship-To to random address in zone 9
    Then set Order Details service to PSG Oversized Package
    Then set Order Details Weight to 50 lb 0 oz
    Then expect Order Details Service Cost is 173.87
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 173.32
    Then Sign out
