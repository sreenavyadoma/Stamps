Feature: January 2017 Rates for SAS User in Zone 9

  Background:
    Given I am signed in to Orders

  @rates_orders_sas_zone_9
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Expect Service Cost is $3.62
    Then Details: Set Weight to 0 lbs 13 oz
    Then Details: Expect Total Ship Cost is $3.62
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 10 oz
    Then Details: Expect Service Cost is $3.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $3.35
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 26 lbs 0 oz
    Then Details: Expect Service Cost is $63.49
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $63.49
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 18 lbs 0 oz
    Then Details: Expect Service Cost is $52.31
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 8
    Then Details: Set Width to 16
    Then Details: Set Height to 9
    Then Details: Expect Total Ship Cost is $52.31
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 32 lbs 0 oz
    Then Details: Expect Service Cost is $78.80
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 30
    Then Details: Set Width to 15
    Then Details: Set Height to 15
    Then Details: Expect Total Ship Cost is $78.80
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 53 lbs 3 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 25 lbs 0 oz
    Then Details: Expect Service Cost is $6.10
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 37 lbs 0 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 61 lbs 0 oz
    Then Details: Expect Service Cost is $6.10
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 40 lbs 0 oz
    Then Details: Expect Service Cost is $11.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $11.95
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 35 lbs 0 oz
    Then Details: Expect Service Cost is $16.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $16.35
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 56 lbs 0 oz
    Then Details: Expect Service Cost is $274.05
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $274.05
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 21 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 70 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 39 lbs 0 oz
    Then Details: Expect Service Cost is $21.72
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.72
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Expect Service Cost is $40.14
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $40.14
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 24 lbs 0 oz
    Then Details: Expect Service Cost is $60.47
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $60.47
    Then Sign out

  @rates_orders_sas_zone_9
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Expect Service Cost is $169.87
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $169.87
    Then Sign out
