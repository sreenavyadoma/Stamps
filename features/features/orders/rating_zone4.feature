Feature: Local Rating test for zone 4

  Background:
    Given I am signed in to Orders

  @local_rating4
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 1 oz
    Then Details: Expect Service Cost is $0.98
    Then Details: Expect Total Ship Cost is $0.98


  @local_rating4
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Expect Service Cost is $2.61
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.61


  @local_rating4
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 2 lbs 8 oz
    Then Details: Expect Service Cost is $8.17
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $8.17


  @local_rating4
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 13 lbs 0 oz
    Then Details: Expect Service Cost is $10.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $10.35


  @local_rating4
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 32 lbs 0 oz
    Then Details: Expect Service Cost is $33.63
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $33.63


  @local_rating4
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 2 lbs 3 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75


  @local_rating4
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Expect Service Cost is $6.10
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10


  @local_rating4
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 5 lbs 0 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75


  @local_rating4
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 23 lbs 0 oz
    Then Details: Expect Service Cost is $6.10
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10


  @local_rating4
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 14 lbs 0 oz
    Then Details: Expect Service Cost is $11.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $11.95


  @local_rating4
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 3 lbs 0 oz
    Then Details: Expect Service Cost is $16.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $16.35


  @local_rating4
  Scenario: Priority Mail Regional Rate Box A
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Expect Service Cost is $6.60
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.60


  @local_rating4
  Scenario: Priority Mail Regional Rate Box B
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Set Weight to 18 lbs 0 oz
    Then Details: Expect Service Cost is $8.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $8.75


  @local_rating4
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 26 lbs 0 oz
    Then Details: Expect Service Cost is $110.25
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $110.25


  @local_rating4
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 1 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66


  @local_rating4
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 15 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66


  @local_rating4
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66


  @local_rating4
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 30 lbs 0 oz
    Then Details: Expect Service Cost is $16.53
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $16.53


  @local_rating4
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 45 lbs 0 oz
    Then Details: Expect Service Cost is $40.28
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $40.28


  @local_rating4
  Scenario: Parcel Select Ground Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Parcel Select Ground Large Package
    Then Details: Set Weight to 21 lbs 0 oz
    Then Details: Expect Service Cost is $13.32
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $13.32


  @local_rating4
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 4
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 13 lbs 0 oz
    Then Details: Expect Service Cost is $86.89
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $86.89

    Then Sign out

