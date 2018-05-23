Feature: January 2017 Rates for CPP User in Zone 6

  Background:
    Given Login and add order domestic

  @rates_orders_cpp_zone_6
  Scenario: FCM Package
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to FCM Large Envelope/Flat
    Then set order details weight to 0 lb 12 oz
    Then expect order details service cost is 3.29
    Then expect Order Details Total Ship Cost is 3.29

  @rates_orders_cpp_zone_6
  Scenario: First-Class Mail Package/Thick Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 5 oz
    Then expect order details service cost is 2.77
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 2.77

  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Large/Thick Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 34 lb 0 oz
    Then expect order details service cost is 54.18
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 54.18


  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Package
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Package
    Then set order details weight to 11 lb 0 oz
    Then set order details length to 10
    Then set order details width to 10
    Then set order details height to 10
    Then expect order details service cost is 27.00
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 27.00
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Large Package
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Large Package
    Then set order details weight to 42 lb 0 oz
    Then set order details length to 20
    Then set order details width to 10
    Then set order details height to 30
    Then expect order details service cost is 64.74
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 64.74
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 32 lb 3 oz
    Then expect order details service cost is 5.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 23 lb 0 oz
    Then expect order details service cost is 6.50
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 33 lb 0 oz
    Then expect order details service cost is 6.25
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Small Flat Rate Box
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 55 lb 0 oz
    Then expect order details service cost is 6.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Medium Flat Rate Box
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 46 lb 0 oz
    Then expect order details service cost is 12.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Priority Mail Large Flat Rate Box
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 31 lb 0 oz
    Then expect order details service cost is 17.05
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then sign out

  @local_rating6
  Scenario: Priority Mail Regional Rate Box A
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Regional Rate Box A
    Then set order details weight to 3 lb 0 oz
    Then expect order details service cost is 9.19
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 9.19
    Then sign out

  @local_rating6
  Scenario: Priority Mail Regional Rate Box B
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PM Regional Rate Box B
    Then set order details weight to 1 lb 0 oz
    Then expect order details service cost is 15.68
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 15.68
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: PME Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 23 lb 0 oz
    Then expect order details service cost is 117.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 117.40
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: PME Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 19 lb 0 oz
    Then expect order details service cost is 21.18
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: PME Padded Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 57 lb 0 oz
    Then expect order details service cost is 21.64
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.64
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: PME Legal Flat Rate Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 40 lb 0 oz
    Then expect order details service cost is 21.28
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.28
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: MM Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 66 lb 0 oz
    Then expect order details service cost is 33.89
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 33.89
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 38 lb 0 oz
    Then expect order details service cost is 59.04
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 59.04
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PSG Large Package
    Then set order details weight to 59 lb 0 oz
    Then expect order details service cost is 77.60
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 77.60
    Then sign out


  @rates_orders_cpp_zone_6
  Scenario: Parcel Select Ground Oversized Package
    Then set Order Details Ship-To to random address in zone 6
    Then set order details service to PSG Oversized Package
    Then set order details weight to 48 lb 0 oz
    Then expect order details service cost is 123.37
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 125.82
    Then sign out
