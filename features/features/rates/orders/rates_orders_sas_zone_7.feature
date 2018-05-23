Feature: January 2017 Rates for SAS User in Zone 7

  Background:
    Given Login and add order domestic

  @rates_orders_sas_zone_7
  Scenario: FCM Package
    Then set order details ship-to to random address in zone 7
    Then set order details service to FCM Large Envelope/Flat
    Then set order details weight to 0 lb 11 oz
    Then expect order details service cost is 3.04
    Then expect Order Details Total Ship Cost is 3.04
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: First-Class Mail Package/Thick Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 8 oz
    Then expect order details service cost is 2.60
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 2.60
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large/Thick Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 33 lb 1 oz
    Then expect order details service cost is 64.26
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 64.26
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Package
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Package
    Then set order details weight to 10 lb 1 oz
    Then expect order details service cost is 31.92
    Then set Order Details Tracking to USPS Tracking
    Then set order details length to 1
    Then set order details width to 1
    Then set order details height to 1
    Then expect Order Details Total Ship Cost is 31.92
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large Package
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Large Package
    Then set order details weight to 41 lb 1 oz
    Then expect order details service cost is 73.93
    Then set Order Details Tracking to USPS Tracking
    Then set order details length to 7
    Then set order details width to 25
    Then set order details height to 25
    Then expect Order Details Total Ship Cost is 73.93
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Flat Rate Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 31 lb 1 oz
    Then expect order details service cost is 5.75
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 22 lb 1 oz
    Then expect order details service cost is 6.10
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.10
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 32 lb 1 oz
    Then expect order details service cost is 5.75
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Small Flat Rate Box
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 54 lb 1 oz
    Then expect order details service cost is 6.10
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.10
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Medium Flat Rate Box
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 45 lb 1 oz
    Then expect order details service cost is 11.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 11.95
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Priority Mail Large Flat Rate Box
    Then set order details ship-to to random address in zone 7
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 30 lb 1 oz
    Then expect order details service cost is 16.35
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 16.35
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: PME Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 22 lb 1 oz
    Then expect order details service cost is 122.31
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 122.31
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: PME Flat Rate Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 18 lb 1 oz
    Then expect order details service cost is 20.66
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: PME Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 56 lb 1 oz
    Then expect order details service cost is 20.66
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: PME Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 39 lb 15 oz
    Then expect order details service cost is 20.66
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: MM Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 65 lb 15 oz
    Then expect order details service cost is 35.22
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 35.22
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 37 lb 15 oz
    Then expect order details service cost is 68.02
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 68.02
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 7
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 58 lb 15 oz
    Then expect order details service cost is 91.52
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 91.52
    Then sign out

  @rates_orders_sas_zone_7
  Scenario: Parcel Select Ground Oversized Package
    Then set order details ship-to to random address in zone 7
    Then set order details service to PSG Oversized Package
    Then set order details weight to 47 lb 15 oz
    Then expect order details service cost is 141.62
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 141.62
    Then sign out

