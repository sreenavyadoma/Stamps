Feature: Local Rating test for Zone 9

  Background:
    Given I am signed in to Orders

  @rates_orders_zone_9
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 4 oz
    Then Details: Expect Service Cost is $1.61
     Then Details: Expect Total Ship Cost is $1.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 10 oz
    Then Details: Expect Service Cost is $3.46
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $3.46
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 0 lbs 8 oz
    Then Details: Expect Service Cost is $9.89
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $9.89
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Expect Service Cost is $15.14
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 22 lbs 0 oz
      Then Details: Set Length to 30
    Then Details: Set Width to 15
    Then Details: Set Height to 15
    Then Details: Expect Service Cost is $86.59
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $86.59
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 13 lbs 3 oz
    Then Details: Expect Service Cost is $5.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.95
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 3 lbs 0 oz
    Then Details: Expect Service Cost is $6.50
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.50
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Expect Service Cost is $6.25
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.25
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Expect Service Cost is $6.25
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.25
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Expect Service Cost is $12.40
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $12.40
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 15 lbs 0 oz
    Then Details: Expect Service Cost is $17.05
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $17.05
    Then Sign out


  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box A
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Expect Service Cost is $15.14
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $15.14
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Regional Rate Box B
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Expect Service Cost is $28.72
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $28.72

  @rates_orders_zone_9
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 9 lbs 0 oz
    Then Details: Expect Service Cost is $90.96
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $90.96
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Expect Service Cost is $21.18
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.18
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 11 lbs 0 oz
    Then Details: Expect Service Cost is $21.64
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.64
    Then Sign out

  @rates_orders_zone_9
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 16 lbs 0 oz
    Then Details: Expect Service Cost is $21.28
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $21.28
    Then Sign out

  @rates_orders_zone_9
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 3 lbs 0 oz
    Then Details: Expect Service Cost is $3.61
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $3.61
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Expect Service Cost is $23.32
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $23.32
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Expect Service Cost is $57.74
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $57.74
    Then Sign out

  @rates_orders_zone_9
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 9
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 50 lbs 0 oz
    Then Details: Expect Service Cost is $173.87
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $176.32
    Then Sign out
