Feature: January 2017 Rates for SAS User in Zone 1

  Background:
    Given Login and add order domestic

  @rates_orders_sas_zone_1
  Scenario: FCM Package
    Then set order details ship-to to random address in zone 1
    Then set order details service to FCM Large Envelope/Flat
    Then set order details weight to 0 lb 1 oz
    Then expect order details service cost is 0.94
    Then expect Order Details Total Ship Cost is 0.94
    Then sign out


  @rates_orders_sas_zone_1
  Scenario: First-Class Mail Package/Thick Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 5 oz
    Then expect order details service cost is 2.60
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 2.60
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large/Thick Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 1 lb 0 oz
    Then expect order details service cost is 5.75
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Package
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Package
    Then set order details weight to 2 lb 0 oz
    Then expect order details service cost is 6.01
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.01
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large Package
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Large Package
    Then set order details weight to 8 lb 0 oz
    Then expect order details service cost is 10.77
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 10.77
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Flat Rate Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 0 lb 3 oz
    Then expect order details service cost is 5.75
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 5 lb 0 oz
    Then expect order details service cost is 6.10
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.10
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 10 lb 0 oz
    Then expect order details service cost is 5.75
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.75
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Small Flat Rate Box
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 2 lb 0 oz
    Then expect order details service cost is 6.10
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.10
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Medium Flat Rate Box
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 11.95
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 11.95
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Large Flat Rate Box
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 15 lb 0 oz
    Then expect order details service cost is 16.35
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 16.35
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Regional Rate Box A
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Regional Rate Box A
    Then set order details weight to 4 lb 0 oz
    Then expect order details service cost is 6.01
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.01
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Priority Mail Regional Rate Box B
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Regional Rate Box B
    Then set order details weight to 12 lb 0 oz
    Then expect order details service cost is 6.71
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.71
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: PME Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 13 lb 0 oz
    Then expect order details service cost is 38.34
    # Then set order details tracking to Signature Required
    Then expect Order Details Total Ship Cost is 38.34
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: PME Flat Rate Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 7 lb 0 oz
    Then expect order details service cost is 20.66
    # Then set order details tracking to Signature Required
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: PME Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 11 lb 0 oz
    Then expect order details service cost is 20.66
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: PME Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 16 lb 0 oz
    Then expect order details service cost is 20.66
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.66
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: MM Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 17 lb 0 oz
    Then expect order details service cost is 10.29
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 10.29
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 1
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 25 lb 0 oz
    Then expect order details service cost is 17.76
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.76
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Large Package
    Then set order details ship-to to random address in zone 1
    Then set order details service to PSG Large Package
    Then set order details weight to 35 lb 0 oz
    Then expect order details service cost is 22.77
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 22.77
    Then sign out

  @rates_orders_sas_zone_1
  Scenario: Parcel Select Ground Oversized Package
    Then set order details ship-to to random address in zone 1
    Then set order details service to PSG Oversized Package
    Then set order details weight to 40 lb 0 oz
    Then expect order details service cost is 62.99
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 62.99
    Then sign out