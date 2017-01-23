Feature: January 2017 Rates for CPP User in Zone 5

  Background:
    Given I am signed in to Orders

  @rates_orders_cpp_zone_5
  Scenario: FCM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Set Weight to 0 lb 5 oz
    Then Order Details: Expect Service Cost is $1.82
    Then Order Details: Expect Total Ship Cost is $1.82

  @rates_orders_cpp_zone_5
  Scenario: First-Class Mail Package/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service First-Class Mail Package/Thick Envelope
    Then Order Details: Set Weight to 0 lb 11 oz
    Then Order Details: Expect Service Cost is $3.60
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $3.60

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Large/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Weight to 1 lb 0 oz
    Then Order Details: Expect Service Cost is $6.73
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.73

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 21 lb 0 oz
    Then Order Details: Set Length to 14
    Then Order Details: Set Width to 30
    Then Order Details: Set Height to 5
    Then Order Details: Expect Service Cost is $30.30
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $30.30

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Weight to 5 lb 0 oz
    Then Order Details: Set Length to 20
    Then Order Details: Set Width to 20
    Then Order Details: Set Height to 15
    Then Order Details: Expect Service Cost is $10.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $10.95

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 5 lb 3 oz
    Then Order Details: Expect Service Cost is $5.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.95

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Set Weight to 7 lb 0 oz
    Then Order Details: Expect Service Cost is $6.50
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.50

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Weight to 15 lb 0 oz
    Then Order Details: Expect Service Cost is $6.25
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.25

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Small Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Set Weight to 2 lb 0 oz
    Then Order Details: Expect Service Cost is $6.45
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.45

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Medium Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Set Weight to 23 lb 0 oz
    Then Order Details: Expect Service Cost is $12.40
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $12.40

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Large Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Set Weight to 37 lb 0 oz
    Then Order Details: Expect Service Cost is $17.05
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $17.05


  @local_rating5
  Scenario: Priority Mail Regional Rate Box A
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Weight to 7 lb 0 oz
    Then Order Details: Expect Service Cost is $8.15
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $8.15

  @local_rating5
  Scenario: Priority Mail Regional Rate Box B
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Set Weight to 6 lb 0 oz
    Then Order Details: Expect Service Cost is $10.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $10.95

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Express Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PME Package
    Then Order Details: Set Weight to 6 lb 0 oz
    Then Order Details: Expect Service Cost is $51.38
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $51.38

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Set Weight to 10 lb 0 oz
    Then Order Details: Expect Service Cost is $21.18
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.18

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Weight to 4 lb 0 oz
    Then Order Details: Expect Service Cost is $21.64
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $21.64

  @rates_orders_cpp_zone_5
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Set Weight to 28 lb 0 oz
    Then Order Details: Expect Service Cost is $21.28
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.28

  @rates_orders_cpp_zone_5
  Scenario: MM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service MM Package
    Then Order Details: Set Weight to 13 lb 0 oz
    Then Order Details: Expect Service Cost is $8.45
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $8.45

  @rates_orders_cpp_zone_5
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 6 lb 0 oz
    Then Order Details: Expect Service Cost is $13.59
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $13.59

  @rates_orders_cpp_zone_5
  Scenario: Parcel Select Ground Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PSG Large Package
    Then Order Details: Set Weight to 17 lb 0 oz
    Then Order Details: Expect Service Cost is $29.42
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $29.42

  @rates_orders_cpp_zone_5
  Scenario: Parcel Select Ground Oversized Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 5
    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Set Weight to 56 lb 0 oz
    Then Order Details: Expect Service Cost is $106.11
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $108.56

    Then Sign out
