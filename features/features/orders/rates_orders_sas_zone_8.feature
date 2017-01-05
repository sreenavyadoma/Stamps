Feature: January 2017 Rates for SAS User in Zone 8

  Background:
    Given I am signed in to Orders

  @rates_orders_sas_zone_8
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lb 13 oz
    Then Details: Expect Service Cost is $3.50
    Then Details: Expect Total Ship Cost is $3.50

  @rates_orders_sas_zone_8
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lb 10 oz
    Then Details: Expect Service Cost is $3.46
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $3.46

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 26 lb 0 oz
    Then Details: Expect Service Cost is $65.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $65.40

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 18 lb 0 oz
    Then Details: Set Length to 8
    Then Details: Set Width to 16
    Then Details: Set Height to 9
    Then Details: Expect Service Cost is $53.88
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $53.88

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 32 lb 0 oz
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 30
    Then Details: Set Width to 15
    Then Details: Set Height to 15
    Then Details: Expect Service Cost is $76.91
    Then Details: Expect Total Ship Cost is $76.91

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 53 lb 3 oz
    Then Details: Expect Service Cost is $5.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.95

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 25 lb 0 oz
    Then Details: Expect Service Cost is $6.50
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.50

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 37 lb 0 oz
    Then Details: Expect Service Cost is $6.25
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.25

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 61 lb 0 oz
    Then Details: Expect Service Cost is $6.45
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.45

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 40 lb 0 oz
    Then Details: Expect Service Cost is $12.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $12.40

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 35 lb 0 oz
    Then Details: Expect Service Cost is $17.05
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $17.05

  @local_rating8
  Scenario: Priority Mail Regional Rate Box A
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Weight to 5 lb 0 oz
    Then Details: Expect Service Cost is $10.28
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $10.28

  @local_rating8
  Scenario: Priority Mail Regional Rate Box B
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 3
    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Set Weight to 2 lb 0 oz
    Then Details: Expect Service Cost is $20.41
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.41

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service PME Package
    Then Details: Set Weight to 56 lb 0 oz
    Then Details: Expect Service Cost is $276.79
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $276.79

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service PME Flat Rate Envelope
    Then Details: Set Weight to 4 lb 0 oz
    Then Details: Expect Service Cost is $21.18
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.18

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Set Weight to 21 lb 0 oz
    Then Details: Expect Service Cost is $21.64
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $21.64

  @rates_orders_sas_zone_8
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service PME Legal Flat Rate Envelope
    Then Details: Set Weight to 70 lb 0 oz
    Then Details: Expect Service Cost is $21.28
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $21.28

  @rates_orders_sas_zone_8
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 39 lb 0 oz
    Then Details: Expect Service Cost is $20.93
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.93

  @rates_orders_sas_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 12 lb 0 oz
    Then Details: Expect Service Cost is $41.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $41.35

  @rates_orders_sas_zone_8
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Parcel Select Ground Large Package
    Then Details: Set Weight to 24 lb 0 oz
    Then Details: Expect Service Cost is $62.29
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $62.29

  @rates_orders_sas_zone_8
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 8
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 7 lb 0 oz
    Then Details: Expect Service Cost is $173.87
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $176.32


    Then Sign out
