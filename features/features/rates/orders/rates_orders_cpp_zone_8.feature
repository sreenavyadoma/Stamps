Feature: January 2017 Rates for CPP User in Zone 8

  Background:
    Given Login and add order domestic

  @rates_orders_cpp_zone_8
  Scenario: FCM Package
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to FCM Large Envelope/Flat
    Then set order details weight to 0 lb 13 oz
    Then expect order details service cost is 3.50
    Then expect Order Details Total Ship Cost is 3.50
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: First-Class Mail Package/Thick Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 10 oz
    Then expect order details service cost is 3.46
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 3.46
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Large/Thick Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 26 lb 0 oz
    Then expect order details service cost is 65.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 65.40
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Package
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Package
    Then set order details weight to 18 lb 0 oz
    Then set order details length to 8
    Then set order details width to 16
    Then set order details height to 9
    Then expect order details service cost is 53.88
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 53.88
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Large Package
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Large Package
    Then set order details weight to 32 lb 0 oz
    Then set Order Details Tracking to USPS Tracking
    Then set order details length to 30
    Then set order details width to 15
    Then set order details height to 15
    Then expect order details service cost is 76.91
    Then expect Order Details Total Ship Cost is 76.91
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 53 lb 3 oz
    Then expect order details service cost is 5.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 25 lb 0 oz
    Then expect order details service cost is 6.50
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 37 lb 0 oz
    Then expect order details service cost is 6.25
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Small Flat Rate Box
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 61 lb 0 oz
    Then expect order details service cost is 6.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Medium Flat Rate Box
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 40 lb 0 oz
    Then expect order details service cost is 12.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Priority Mail Large Flat Rate Box
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 35 lb 0 oz
    Then expect order details service cost is 17.05
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then sign out

  @local_rating8
  Scenario: Priority Mail Regional Rate Box A
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Regional Rate Box A
    Then set order details weight to 5 lb 0 oz
    Then expect order details service cost is 10.28
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 10.28
    Then sign out

  @local_rating8
  Scenario: Priority Mail Regional Rate Box B
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PM Regional Rate Box B
    Then set order details weight to 2 lb 0 oz
    Then expect order details service cost is 20.41
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.41
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: PME Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 56 lb 0 oz
    Then expect order details service cost is 276.79
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 276.79
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: PME Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 4 lb 0 oz
    Then expect order details service cost is 21.18
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: PME Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 21 lb 0 oz
    Then expect order details service cost is 21.64
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.64
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: PME Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 70 lb 0 oz
    Then expect order details service cost is 21.28
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.28
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: MM Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 39 lb 0 oz
    Then expect order details service cost is 20.93
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 20.93
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 12 lb 0 oz
    Then expect order details service cost is 41.35
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 41.35
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PSG Large Package
    Then set order details weight to 24 lb 0 oz
    Then expect order details service cost is 62.29
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 62.29
    Then sign out

  @rates_orders_cpp_zone_8
  Scenario: Parcel Select Ground Oversized Package
    Then set Order Details Ship-To to random address in zone 8
    Then set order details service to PSG Oversized Package
    Then set order details weight to 7 lb 0 oz
    Then expect order details service cost is 173.87
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 176.32
    Then sign out
