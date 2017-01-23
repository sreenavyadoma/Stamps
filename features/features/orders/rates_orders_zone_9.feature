Feature: Local Rating test for Zone 9

  Background:
    Given I am signed in to Orders

  @rates_orders_zone_9
  Scenario: FCM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Set Weight to 0 lb 4 oz
    Then Order Details: Expect Service Cost is $1.61
     Then Order Details: Expect Total Ship Cost is $1.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: First-Class Mail Package/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service First-Class Mail Package/Thick Envelope
    Then Order Details: Set Weight to 0 lb 10 oz
    Then Order Details: Expect Service Cost is $3.46
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $3.46
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Weight to 0 lb 8 oz
    Then Order Details: Expect Service Cost is $9.89
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $9.89
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 2 lb 0 oz
    Then Order Details: Expect Service Cost is $15.14
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Weight to 22 lb 0 oz
      Then Order Details: Set Length to 30
    Then Order Details: Set Width to 15
    Then Order Details: Set Height to 15
    Then Order Details: Expect Service Cost is $86.59
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $86.59
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Weight to 13 lb 3 oz
    Then Order Details: Expect Service Cost is $5.95
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $5.95
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Set Weight to 3 lb 0 oz
    Then Order Details: Expect Service Cost is $6.50
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.50
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Weight to 6 lb 0 oz
    Then Order Details: Expect Service Cost is $6.25
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.25
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Small Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Set Weight to 2 lb 0 oz
    Then Order Details: Expect Service Cost is $6.45
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $6.45
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Medium Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Set Weight to 6 lb 0 oz
    Then Order Details: Expect Service Cost is $12.40
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $12.40
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Flat Rate Box
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Set Weight to 15 lb 0 oz
    Then Order Details: Expect Service Cost is $17.05
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $17.05
    Then Sign out


  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box A
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Weight to 4 lb 0 oz
    Then Order Details: Expect Service Cost is $15.14
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box B
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Set Weight to 12 lb 0 oz
    Then Order Details: Expect Service Cost is $28.72
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $28.72

  @rates_orders_zone_9
  Scenario: Priority Mail Express Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PME Package
    Then Order Details: Set Weight to 9 lb 0 oz
    Then Order Details: Expect Service Cost is $90.96
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $90.96
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Set Weight to 7 lb 0 oz
    Then Order Details: Expect Service Cost is $21.18
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.18
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Weight to 11 lb 0 oz
    Then Order Details: Expect Service Cost is $21.64
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.64
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Set Weight to 16 lb 0 oz
    Then Order Details: Expect Service Cost is $21.28
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $21.28
    Then Sign out

  @rates_orders_zone_9
  Scenario: MM Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service MM Package
    Then Order Details: Set Weight to 3 lb 0 oz
    Then Order Details: Expect Service Cost is $3.61
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $3.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 6 lb 0 oz
    Then Order Details: Expect Service Cost is $23.32
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $23.32
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Weight to 12 lb 0 oz
    Then Order Details: Expect Service Cost is $57.74
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $57.74
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Oversized Package
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to address in Zone 9
    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Set Weight to 50 lb 0 oz
    Then Order Details: Expect Service Cost is $173.87
    Then Order Details: Set Tracking to USPS Tracking
    Then Order Details: Expect Total Ship Cost is $173.32
    Then Sign out
