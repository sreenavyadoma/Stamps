Feature: January 2017 Rates for SAS User in Zone 5

  Background:
    Given Login and add order domestic

  @rates_orders_sas_zone_5
  Scenario: FCM Package
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to FCM Large Envelope/Flat
    Then set Order Details Weight to 0 lb 5 oz
    Then expect Order Details Service Cost is 1.82
    Then expect Order Details Total Ship Cost is 1.82
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: First-Class Mail Package/Thick Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set Order Details Weight to 0 lb 11 oz
    Then expect Order Details Service Cost is 3.60
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 3.60
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large/Thick Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Large/Thick Envelope
    Then set Order Details Weight to 1 lb 0 oz
    Then expect Order Details Service Cost is 6.73
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.73
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Package
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Package
    Then set Order Details Weight to 21 lb 0 oz
    Then set Order Details Length to 14
    Then set Order Details Width to 30
    Then set Order Details Height to 5
    Then expect Order Details Service Cost is 30.30
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 30.30
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large Package
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Large Package
    Then set Order Details Weight to 5 lb 0 oz
    Then set Order Details Length to 20
    Then set Order Details Width to 20
    Then set Order Details Height to 15
    Then expect Order Details Service Cost is 10.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 10.95
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Weight to 5 lb 3 oz
    Then expect Order Details Service Cost is 5.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set Order Details Weight to 7 lb 0 oz
    Then expect Order Details Service Cost is 6.50
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set Order Details Weight to 15 lb 0 oz
    Then expect Order Details Service Cost is 6.25
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Small Flat Rate Box
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Small Flat Rate Box
    Then set Order Details Weight to 2 lb 0 oz
    Then expect Order Details Service Cost is 6.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Medium Flat Rate Box
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Medium Flat Rate Box
    Then set Order Details Weight to 23 lb 0 oz
    Then expect Order Details Service Cost is 12.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Priority Mail Large Flat Rate Box
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Large Flat Rate Box
    Then set Order Details Weight to 37 lb 0 oz
    Then expect Order Details Service Cost is 17.05
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then Sign out


  @local_rating5
  Scenario: Priority Mail Regional Rate Box A
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Regional Rate Box A
    Then set Order Details Weight to 7 lb 0 oz
    Then expect Order Details Service Cost is 8.15
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 8.15
    Then Sign out

  @local_rating5
  Scenario: Priority Mail Regional Rate Box B
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PM Regional Rate Box B
    Then set Order Details Weight to 6 lb 0 oz
    Then expect Order Details Service Cost is 10.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 10.95
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: PME Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PME Package/Flat/Thick Envelope
    Then set Order Details Weight to 6 lb 0 oz
    Then expect Order Details Service Cost is 51.38
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 51.38
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: PME Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PME Flat Rate Envelope
    Then set Order Details Weight to 10 lb 0 oz
    Then expect Order Details Service Cost is 21.18
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: PME Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Weight to 4 lb 0 oz
    Then expect Order Details Service Cost is 21.64
    Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.64
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: PME Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set Order Details Weight to 28 lb 0 oz
    Then expect Order Details Service Cost is 21.28
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.28
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: MM Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set Order Details Weight to 13 lb 0 oz
    Then expect Order Details Service Cost is 8.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 8.45
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PSG Package/Flat/Thick Envelope
    Then set Order Details Weight to 6 lb 0 oz
    Then expect Order Details Service Cost is 13.59
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 13.59
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Large Package
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PSG Large Package
    Then set Order Details Weight to 17 lb 0 oz
    Then expect Order Details Service Cost is 29.42
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 29.42
    Then Sign out

  @rates_orders_sas_zone_5
  Scenario: Parcel Select Ground Oversized Package
    Then set Order Details Ship-To to random address in zone 5
    Then set Order Details service to PSG Oversized Package
    Then set Order Details Weight to 56 lb 0 oz
    Then expect Order Details Service Cost is 106.11
    Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 108.56
    Then Sign out
