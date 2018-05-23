Feature: January 2017 Rates for CPP User in Zone 3

  Background:
    Given Login and add order domestic

  @rates_orders_cpp_zone_3
  Scenario: FCM Package
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to FCM Large Envelope/Flat
    Then set order details weight to 0 lb 2 oz
    Then expect order details service cost is 1.19
    Then expect Order Details Total Ship Cost is 1.19
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: First-Class Mail Package/Thick Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 15 oz
    Then expect order details service cost is 4.16
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 4.16
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Large/Thick Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 1 lb 5 oz
    Then expect order details service cost is 6.60
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.60
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Package
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Package
    Then set order details weight to 3 lb 0 oz
    Then expect order details service cost is 7.38
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 7.38
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Large Package
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Large Package
    Then set order details weight to 12 lb 0 oz
    Then expect order details service cost is 17.17
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.17
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 5 lb 3 oz
    Then expect order details service cost is 5.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 7 lb 0 oz
    Then expect order details service cost is 6.50
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 2 lb 0 oz
    Then expect order details service cost is 6.25
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Small Flat Rate Box
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 8 lb 0 oz
    Then expect order details service cost is 6.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Medium Flat Rate Box
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 13 lb 0 oz
    Then expect order details service cost is 12.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Large Flat Rate Box
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 15 lb 0 oz
    Then expect order details service cost is 17.05
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Regional Rate Box A
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Regional Rate Box A
    Then set order details weight to 5 lb 0 oz
    Then expect order details service cost is 6.60
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.60
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Regional Rate Box B
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PM Regional Rate Box B
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 8.01
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 8.01
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: PME Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 11 lb 0 oz
    Then expect order details service cost is 48.54
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 48.54
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: PME Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 1 lb 0 oz
    Then expect order details service cost is 21.18
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: PME Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 14 lb 0 oz
    Then expect order details service cost is 21.64
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.64
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: PME Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 4 lb 0 oz
    Then expect order details service cost is 21.28
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.28
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: MM Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 13 lb 0 oz
    Then expect order details service cost is 8.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 8.45
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 23 lb 0 oz
    Then expect order details service cost is 19.29
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 19.29
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Parcel Select Ground Large Package
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PSG Large Package
    Then set order details weight to 33 lb 0 oz
    Then expect order details service cost is 26.46
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 26.46
    Then sign out

  @rates_orders_cpp_zone_3
  Scenario: Parcel Select Ground Oversized Package
    Then set Order Details Ship-To to random address in zone 3
    Then set order details service to PSG Oversized Package
    Then set order details weight to 40 lb 0 oz
    Then expect order details service cost is 67.94
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 70.39
    Then sign out
