Feature: Local Rating test for zone 1 for SAS user

  Background:
    Given I am signed in to Orders

  @local_rating1_sas
  Scenario: First-Class Mail Large Envelope/Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Weight to 0 lbs 1 oz
    Then Details: Expect Service Cost is $0.94
    Then Details: Expect Total Ship Cost is $0.94

  @local_rating1_sas
  Scenario: First-Class Mail Package/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Weight to 0 lbs 5 oz
    Then Details: Expect Service Cost is $2.60
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $2.60

  @local_rating1_sas
  Scenario: Priority Mail Large/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Weight to 1 lbs 0 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

  @local_rating1_sas
  Scenario: Priority Mail Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Expect Service Cost is $6.01
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.01

  @local_rating1_sas
  Scenario: Priority Mail Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Weight to 8 lbs 0 oz
    Then Details: Expect Service Cost is $10.77
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $10.77

  @local_rating1_sas
  Scenario: Priority Mail Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Weight to 0 lbs 3 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

  @local_rating1_sas
  Scenario: Priority Mail Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Weight to 5 lbs 0 oz
    Then Details: Expect Service Cost is $6.10
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10

  @local_rating1_sas
  Scenario: Priority Mail Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Weight to 10 lbs 0 oz
    Then Details: Expect Service Cost is $5.75
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $5.75

  @local_rating1_sas
  Scenario: Priority Mail Small Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Weight to 2 lbs 0 oz
    Then Details: Expect Service Cost is $6.10
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.10

  @local_rating1_sas
  Scenario: Priority Mail Medium Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Set Weight to 6 lbs 0 oz
    Then Details: Expect Service Cost is $11.95
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $11.95

  @local_rating1_sas
  Scenario: Priority Mail Large Flat Rate Box
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Set Weight to 15 lbs 0 oz
    Then Details: Expect Service Cost is $16.35
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $16.35

  @local_rating1_sas
  Scenario: Priority Mail Regional Rate Box A
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Weight to 4 lbs 0 oz
    Then Details: Expect Service Cost is $6.01
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.01

  @local_rating1_sas
  Scenario: Priority Mail Regional Rate Box B
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Set Weight to 12 lbs 0 oz
    Then Details: Expect Service Cost is $6.71
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $6.71

  @local_rating1_sas
  Scenario: Priority Mail Express Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Express Package
    Then Details: Set Weight to 13 lbs 0 oz
    Then Details: Expect Service Cost is $38.34
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $38.34

  @local_rating1_sas
  Scenario: Priority Mail Express Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Set Weight to 7 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to Signature Required
    Then Details: Expect Total Ship Cost is $20.66

  @local_rating1_sas
  Scenario: Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Weight to 11 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

  @local_rating1_sas
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Set Weight to 16 lbs 0 oz
    Then Details: Expect Service Cost is $20.66
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $20.66

  @local_rating1_sas
  Scenario: Media Mail Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Weight to 17 lbs 0 oz
    Then Details: Expect Service Cost is $10.29
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $10.29

  @local_rating1_sas
  Scenario: Parcel Select Ground Package/Flat/Thick Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Weight to 25 lbs 0 oz
    Then Details: Expect Service Cost is $17.76
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $17.76

  @local_rating1_sas
  Scenario: Parcel Select Ground Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Parcel Select Ground Large Package
    Then Details: Set Weight to 35 lbs 0 oz
    Then Details: Expect Service Cost is $22.77
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $22.77

  @local_rating1_sas
  Scenario: Parcel Select Ground Oversized Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Weight to 40 lbs 0 oz
    Then Details: Expect Service Cost is $62.99
    Then Details: Set Tracking to USPS Tracking
    Then Details: Expect Total Ship Cost is $62.99

    Then Sign out