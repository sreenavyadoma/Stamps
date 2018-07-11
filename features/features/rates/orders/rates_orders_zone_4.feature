Feature: January 2017 Rates for Core User in Zone 4

  Background:
    Given Login and add order domestic

  @rates_orders_zone_4
  Scenario: FCM Package
    Then set order details ship-to to random address in zone 4
    Then set order details service to FCM Large Envelope/Flat
    Then set order details weight to 0 lb 1 oz
    Then expect order details service cost is 0.98
    Then expect Order Details Total Ship Cost is 0.98
    Then sign out


  @rates_orders_zone_4
  Scenario: First-Class Mail Package/Thick Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 5 oz
    Then expect order details service cost is 2.77
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 2.77
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Large/Thick Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 2 lb 8 oz
    Then expect order details service cost is 7.86
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 7.86
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Package
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Package
    Then set order details weight to 13 lb 0 oz
    Then expect order details service cost is 15.11
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 15.11
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Large Package
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Large Package
    Then set order details weight to 32 lb 0 oz
    Then expect order details service cost is 34.64
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 34.64
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Flat Rate Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 2 lb 3 oz
    Then expect order details service cost is 5.95
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 12 lb 0 oz
    Then expect order details service cost is 6.50
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 5 lb 0 oz
    Then expect order details service cost is 6.25
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Small Flat Rate Box
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 23 lb 0 oz
    Then expect order details service cost is 6.45
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Medium Flat Rate Box
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 14 lb 0 oz
    Then expect order details service cost is 12.40
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Large Flat Rate Box
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 3 lb 0 oz
    Then expect order details service cost is 17.05
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Regional Rate Box A
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Regional Rate Box A
    Then set order details weight to 7 lb 0 oz
    Then expect order details service cost is 6.83
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.83
    Then sign out


  @rates_orders_zone_4
  Scenario: Priority Mail Regional Rate Box B
    Then set order details ship-to to random address in zone 4
    Then set order details service to PM Regional Rate Box B
    Then set order details weight to 18 lb 0 oz
    Then expect order details service cost is 9.19
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 9.19
    Then sign out


  @rates_orders_zone_4
  Scenario: PME Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 26 lb 0 oz
    Then expect order details service cost is 111.35
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 111.35
    Then sign out


  @rates_orders_zone_4
  Scenario: PME Flat Rate Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 1 lb 0 oz
    Then expect order details service cost is 21.18
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then sign out


  @rates_orders_zone_4
  Scenario: PME Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 15 lb 0 oz
    Then expect order details service cost is 21.64
    # Then set order details tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.64
    Then sign out


  @rates_orders_zone_4
  Scenario: PME Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 21.28
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.28
    Then sign out


  @rates_orders_zone_4
  Scenario: MM Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 30 lb 0 oz
    Then expect order details service cost is 16.61
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 16.61
    Then sign out


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 4
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 45 lb 0 oz
    Then expect order details service cost is 41.49
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 41.49
    Then sign out


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Large Package
    Then set order details ship-to to random address in zone 4
    Then set order details service to PSG Large Package
    Then set order details weight to 21 lb 0 oz
    Then expect order details service cost is 20.35
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.35
    Then sign out


  @rates_orders_zone_4
  Scenario: Parcel Select Ground Oversized Package
    Then set order details ship-to to random address in zone 4
    Then set order details service to PSG Oversized Package
    Then set order details weight to 13 lb 0 oz
    Then expect order details service cost is 86.89
    # Then set order details tracking to Signature Required
    Then expect Order Details Total Ship Cost is 89.34
    Then sign out

