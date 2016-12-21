Feature: Local Rating test for zone 1

  Background:
    Given I am signed in to Orders

  @local_rating1
  Scenario:  First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Expect Service Cost is $55.2
    Then Details: Set Weight to 0 lbs 1 oz
    Then Details: Expect Service Cost is $0.98
    Then Details: Expect Total Ship Cost is $0.98

  @local_rating1
  Scenario:  First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Expect Service Cost is $2.77
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.77

  @local_rating1
  Scenario:  Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 1 lbs 0 oz
    Then Details: Expect Service Cost is $5.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.95


    Then Sign out
