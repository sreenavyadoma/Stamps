Feature: January 2017 Rates for CPP User in Zone 5

  Background:
    Given Login and add order domestic

  @rates_orders_cpp_zone_5
  Scenario: FCM Package
    Then set order details ship-to to random address in zone 5
    Then set order details service to FCM Large Envelope/Flat
    Then set order details weight to 0 lb 5 oz
    Then expect order details service cost is 1.82
    Then expect Order Details Total Ship Cost is 1.82
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: First-Class Mail Package/Thick Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 11 oz
    Then expect order details service cost is 3.60
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 3.60
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Large/Thick Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 1 lb 0 oz
    Then expect order details service cost is 6.73
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.73
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Package
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Package
    Then set order details weight to 21 lb 0 oz
    Then set order details length to 14
    Then set order details width to 30
    Then set order details height to 5
    Then expect order details service cost is 30.30
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 30.30
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Large Package
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Large Package
    Then set order details weight to 5 lb 0 oz
    Then set order details length to 20
    Then set order details width to 20
    Then set order details height to 15
    Then expect order details service cost is 10.95
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 10.95
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Flat Rate Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 5 lb 3 oz
    Then expect order details service cost is 5.95
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 7 lb 0 oz
    Then expect order details service cost is 6.50
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 15 lb 0 oz
    Then expect order details service cost is 6.25
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Small Flat Rate Box
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 2 lb 0 oz
    Then expect order details service cost is 6.45
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Medium Flat Rate Box
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 23 lb 0 oz
    Then expect order details service cost is 12.40
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Large Flat Rate Box
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 37 lb 0 oz
    Then expect order details service cost is 17.05
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then sign out


  @local_rating5
  Scenario: Priority Mail Regional Rate Box A
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Regional Rate Box A
    Then set order details weight to 7 lb 0 oz
    Then expect order details service cost is 8.15
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 8.15
    Then sign out

  @local_rating5
  Scenario: Priority Mail Regional Rate Box B
    Then set order details ship-to to random address in zone 5
    Then set order details service to PM Regional Rate Box B
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 10.95
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 10.95
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: PME Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 51.38
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 51.38
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: PME Flat Rate Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 10 lb 0 oz
    Then expect order details service cost is 21.18
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: PME Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 4 lb 0 oz
    Then expect order details service cost is 21.64
    # Then set order details tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.64
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: PME Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 28 lb 0 oz
    Then expect order details service cost is 21.28
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.28
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: MM Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 13 lb 0 oz
    Then expect order details service cost is 8.45
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 8.45
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 5
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 13.59
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 13.59
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Parcel Select Ground Large Package
    Then set order details ship-to to random address in zone 5
    Then set order details service to PSG Large Package
    Then set order details weight to 17 lb 0 oz
    Then expect order details service cost is 29.42
    Then set order details tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 29.42
    Then sign out

  @rates_orders_cpp_zone_5
  Scenario: Parcel Select Ground Oversized Package
    Then set order details ship-to to random address in zone 5
    Then set order details service to PSG Oversized Package
    Then set order details weight to 56 lb 0 oz
    Then expect order details service cost is 106.11
    # Then set order details tracking to Signature Required
    Then expect Order Details Total Ship Cost is 108.56
    Then sign out
