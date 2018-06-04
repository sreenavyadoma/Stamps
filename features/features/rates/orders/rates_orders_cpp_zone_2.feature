Feature: January 2017 Rates for CPP User in Zone 2

  Background:
    Given Login and add order domestic

  @rates_orders_cpp_zone_2
  Scenario: FCM Package
    Then set order details ship-to to random address in zone 2
    Then set order details service to FCM Large Envelope/Flat
    Then set order details weight to 0 lb 4 oz
    Then expect order details service cost is 1.61
    Then expect Order Details Total Ship Cost is 1.61
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: First-Class Mail Package/Thick Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to First-Class Mail Package/Thick Envelope
    Then set order details weight to 0 lb 10 oz
    Then expect order details service cost is 3.46
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 3.46
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Large/Thick Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Large/Thick Envelope
    Then set order details weight to 0 lb 8 oz
    Then expect order details service cost is 5.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Package
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Package
    Then set order details weight to 2 lb 0 oz
    Then expect order details service cost is 6.52
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.52
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Large Package
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Large Package
    Then set order details weight to 22 lb 0 oz
    Then expect order details service cost is 15.54
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 17.99
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Flat Rate Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Flat Rate Envelope
    Then set order details weight to 13 lb 3 oz
    Then expect order details service cost is 5.95
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 5.95
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details weight to 3 lb 0 oz
    Then expect order details service cost is 6.50
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.50
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 6.25
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.25
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Small Flat Rate Box
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Small Flat Rate Box
    Then set order details weight to 2 lb 0 oz
    Then expect order details service cost is 6.45
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.45
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Medium Flat Rate Box
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Medium Flat Rate Box
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 12.40
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 12.40
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Large Flat Rate Box
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Large Flat Rate Box
    Then set order details weight to 15 lb 0 oz
    Then expect order details service cost is 17.05
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 17.05
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Regional Rate Box A
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Regional Rate Box A
    Then set order details weight to 4 lb 0 oz
    Then expect order details service cost is 6.52
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 6.52
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: Priority Mail Regional Rate Box B
    Then set order details ship-to to random address in zone 2
    Then set order details service to PM Regional Rate Box B
    Then set order details weight to 12 lb 0 oz
    Then expect order details service cost is 7.17
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 7.17
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: PME Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details weight to 9 lb 0 oz
    Then expect order details service cost is 31.69
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 31.69
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: PME Flat Rate Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PME Flat Rate Envelope
    Then set order details weight to 7 lb 0 oz
    Then expect order details service cost is 21.18
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.18
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: PME Padded Flat Rate Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details weight to 11 lb 0 oz
    Then expect order details service cost is 21.64
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 21.64
    Then sign out


  @rates_orders_cpp_zone_2
  Scenario: PME Legal Flat Rate Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details weight to 16 lb 0 oz
    Then expect order details service cost is 21.28
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 21.28
    Then sign out

  @rates_orders_cpp_zone_2
  Scenario: MM Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details weight to 3 lb 0 oz
    Then expect order details service cost is 3.61
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 3.61
    Then sign out

  @rates_orders_cpp_zone_2
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then set order details ship-to to random address in zone 2
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details weight to 6 lb 0 oz
    Then expect order details service cost is 7.52
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 7.52
    Then sign out

  @rates_orders_cpp_zone_2
  Scenario: Parcel Select Ground Large Package
    Then set order details ship-to to random address in zone 2
    Then set order details service to PSG Large Package
    Then set order details weight to 12 lb 0 oz
    Then expect order details service cost is 14.02
    Then set Order Details Tracking to USPS Tracking
    Then expect Order Details Total Ship Cost is 14.02
    Then sign out

  @rates_orders_cpp_zone_2
  Scenario: Parcel Select Ground Oversized Package
    Then set order details ship-to to random address in zone 2
    Then set order details service to PSG Oversized Package
    Then set order details weight to 50 lb 0 oz
    Then expect order details service cost is 63.99
    # Then set Order Details Tracking to Signature Required
    Then expect Order Details Total Ship Cost is 66.44
    Then sign out
