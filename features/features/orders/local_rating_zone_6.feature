Feature: Local Rating test for zone 6

  Background:
    Given I am signed in to Orders

  @local_rating_zone_6
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 12 oz
    Then Details: Expect Service Cost is $3.25
    Then Details: Expect Total Ship Cost is $3.25
    Then Sign out

  @local_rating_zone_6
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Expect Service Cost is $2.60
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.60
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 34 lbs 0 oz
    Then Details: Expect Service Cost is $52.60
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $52.60
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 11 lbs 0 oz
    Then Details: Expect Service Cost is $26.21
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 10
    Then Details: Set Width to 10
    Then Details: Set Height to 10
    Then Details: Expect Total Ship Cost is $26.21
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 42 lbs 0 oz
    Then Details: Expect Service Cost is $62.85
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Length to 20
    Then Details: Set Width to 10
    Then Details: Set Height to 30
    Then Details: Expect Total Ship Cost is $62.85
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 32 lbs 3 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Expect Service Cost is $6.10
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 33 lbs 0 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 55 lbs 0 oz
    Then Details: Expect Service Cost is $6.10
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 46 lbs 0 oz
    Then Details: Expect Service Cost is $11.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $11.95
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 31 lbs 0 oz
    Then Details: Expect Service Cost is $16.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $16.35
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Expect Service Cost is $116.24
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $116.24
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 19 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 57 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @local_rating_zone_6
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 40 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66
    Then Sign out

  @local_rating_zone_6
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 66 lbs 0 oz
    Then Details: Expect Service Cost is $35.22
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $35.22
    Then Sign out

  @local_rating_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 38 lbs 0 oz
    Then Details: Expect Service Cost is $58.37
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $58.37
    Then Sign out

  @local_rating_zone_6
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 59 lbs 0 oz
    Then Details: Expect Service Cost is $75.58
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $75.58
    Then Sign out

  @local_rating_zone_6
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 6
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 48 lbs 0 oz
    Then Details: Expect Service Cost is $123.37
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $123.37
    Then Sign out
