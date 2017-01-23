Feature: January 2017 Rates for CPP User in Zone 3

  Background:
    Given I am signed in to Orders

  @rates_orders_cpp_zone_3
  Scenario: FCM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Set Weight to 0 lb 2 oz
    Then Order Details: Expect Service Cost is $1.19
    Then Order Details: Expect Total Ship Cost is $1.19

  @rates_orders_cpp_zone_3
  Scenario: First-Class Mail Package/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service First-Class Mail Package/Thick Envelope
    Then Order Details: Set Weight to 0 lb 15 oz
    Then Order Details: Expect Service Cost is $4.16
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $4.16

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Large/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Weight to 1 lb 5 oz
    Then Order Details: Expect Service Cost is $6.60
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.60

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 3 lb 0 oz
    Then Order Details: Expect Service Cost is $7.38
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $7.38

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Weight to 12 lb 0 oz
    Then Order Details: Expect Service Cost is $17.17
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $17.17

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 5 lb 3 oz
    Then Order Details: Expect Service Cost is $5.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.95

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Set Weight to 7 lb 0 oz
    Then Order Details: Expect Service Cost is $6.50
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.50

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Weight to 2 lb 0 oz
    Then Order Details: Expect Service Cost is $6.25
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.25

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Small Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Set Weight to 8 lb 0 oz
    Then Order Details: Expect Service Cost is $6.45
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.45

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Medium Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Set Weight to 13 lb 0 oz
    Then Order Details: Expect Service Cost is $12.40
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $12.40

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Large Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Set Weight to 15 lb 0 oz
    Then Order Details: Expect Service Cost is $17.05
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $17.05

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Regional Rate Box A
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Weight to 5 lb 0 oz
    Then Order Details: Expect Service Cost is $6.60
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.60

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Regional Rate Box B
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Set Weight to 6 lb 0 oz
    Then Order Details: Expect Service Cost is $8.01
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $8.01

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Express Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PME Package
    Then Order Details: Set Weight to 11 lb 0 oz
    Then Order Details: Expect Service Cost is $48.54
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $48.54

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Set Weight to 1 lb 0 oz
    Then Order Details: Expect Service Cost is $21.18
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.18

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Weight to 14 lb 0 oz
    Then Order Details: Expect Service Cost is $21.64
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $21.64

  @rates_orders_cpp_zone_3
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Set Weight to 4 lb 0 oz
    Then Order Details: Expect Service Cost is $21.28
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.28

  @rates_orders_cpp_zone_3
  Scenario: MM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service MM Package
    Then Order Details: Set Weight to 13 lb 0 oz
    Then Order Details: Expect Service Cost is $8.45
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $8.45

  @rates_orders_cpp_zone_3
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 23 lb 0 oz
    Then Order Details: Expect Service Cost is $19.29
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $19.29

  @rates_orders_cpp_zone_3
  Scenario: Parcel Select Ground Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PSG Large Package
    Then Order Details: Set Weight to 33 lb 0 oz
    Then Order Details: Expect Service Cost is $26.46
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $26.46

  @rates_orders_cpp_zone_3
  Scenario: Parcel Select Ground Oversized Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 3
    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Set Weight to 40 lb 0 oz
    Then Order Details: Expect Service Cost is $67.94
    Then Order Details: Set Tracking to Signature Required
    Then Order Details: Expect Total Ship Cost is $70.39

    Then Sign out
