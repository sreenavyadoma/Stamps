Feature: January 2017 Rates for SAS User in Zone 7

  Background:
    Given Login and add order domestic

  @rates_orders_sas_zone_7
  Scenario: FCM Package
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to FCM Large Envelope/Flat
    Then set Order Details Weight to 0 lb 11 oz
    Then expect Order Details Service Cost is 3.04
    Then expect Order Details Total Ship Cost is 3.04
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: First-Class Mail Package/Thick Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set Order Details Weight to 0 lb 8 oz
    Then expect Order Details Service Cost is 2.60
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 2.60
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large/Thick Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Large/Thick Envelope
    Then set Order Details Weight to 33 lb 1 oz
    Then expect Order Details Service Cost is 64.26
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 64.26
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Package
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Package
    Then set Order Details Weight to 10 lb 1 oz
    Then expect Order Details Service Cost is 31.92
    Then set Order Details Tracking to USPS Tracking
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then expect Order Details Total Ship Cost is 31.92
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large Package
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Large Package
    Then set Order Details Weight to 41 lb 1 oz
    Then expect Order Details Service Cost is 73.93
    Then set Order Details Tracking to USPS Tracking
    Then set Order Details Length to 7
    Then set Order Details Width to 25
    Then set Order Details Height to 25
    Then expect Order Details Total Ship Cost is 73.93
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Weight to 31 lb 1 oz
    Then expect Order Details Service Cost is 5.75
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set Order Details Weight to 22 lb 1 oz
    Then expect Order Details Service Cost is 6.10
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.10
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set Order Details Weight to 32 lb 1 oz
    Then expect Order Details Service Cost is 5.75
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Small Flat Rate Box
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Small Flat Rate Box
    Then set Order Details Weight to 54 lb 1 oz
    Then expect Order Details Service Cost is 6.10
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.10
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Medium Flat Rate Box
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Medium Flat Rate Box
    Then set Order Details Weight to 45 lb 1 oz
    Then expect Order Details Service Cost is 11.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 11.95
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large Flat Rate Box
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PM Large Flat Rate Box
    Then set Order Details Weight to 30 lb 1 oz
    Then expect Order Details Service Cost is 16.35
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 16.35
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: PME Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PME Package/Flat/Thick Envelope
    Then set Order Details Weight to 22 lb 1 oz
    Then expect Order Details Service Cost is 122.31
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 122.31
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: PME Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PME Flat Rate Envelope
    Then set Order Details Weight to 18 lb 1 oz
    Then expect Order Details Service Cost is 20.66
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: PME Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Weight to 56 lb 1 oz
    Then expect Order Details Service Cost is 20.66
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: PME Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set Order Details Weight to 39 lb 15 oz
    Then expect Order Details Service Cost is 20.66
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: MM Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set Order Details Weight to 65 lb 15 oz
    Then expect Order Details Service Cost is 35.22
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 35.22
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PSG Package/Flat/Thick Envelope
    Then set Order Details Weight to 37 lb 15 oz
    Then expect Order Details Service Cost is 68.02
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 68.02
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PSG Package/Flat/Thick Envelope
    Then set Order Details Weight to 58 lb 15 oz
    Then expect Order Details Service Cost is 91.52
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 91.52
    Then Sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Oversized Package
    Then set Order Details Ship-To to random address in zone 7
    Then set Order Details service to PSG Oversized Package
    Then set Order Details Weight to 47 lb 15 oz
    Then expect Order Details Service Cost is 141.62
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 141.62
    Then Sign out

