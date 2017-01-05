Feature: 10 orders

  Background:
    Given I am signed in to Orders

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Insure-For to $15.00

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Insure-For to $45.00
    Then Details: Set Tracking to USPS Tracking

    #Priority Mail

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Insure-For to $105.00
    Then Details: Set Tracking to Signature Required

    # Priority Mail Express

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service PME Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 11
    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    # Media Mail

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 3
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Insure-For to $56.00
    Then Details: Set Tracking to Signature Required

    # Parcel Select

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 10
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Insure-For to $235.00
    Then Details: Set Tracking to USPS Tracking

    Then Sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Insure-For to $15.00

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Insure-For to $45.00
    Then Details: Set Tracking to USPS Tracking

    #Priority Mail

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Insure-For to $105.00
    Then Details: Set Tracking to Signature Required

    # Priority Mail Express

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service PME Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 11
    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    # Media Mail

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 3
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Insure-For to $56.00
    Then Details: Set Tracking to Signature Required

    # Parcel Select

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 10
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Insure-For to $235.00
    Then Details: Set Tracking to USPS Tracking


    # First Class Mail

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Insure-For to $15.00

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Insure-For to $45.00
    Then Details: Set Tracking to USPS Tracking

    #Priority Mail

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Set Insure-For to $105.00
    Then Details: Set Tracking to Signature Required

    # Priority Mail Express

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service PME Package
    Then Details: Set Tracking to Signature Required

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 11
    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Set Tracking to Signature Required

    # Media Mail

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Ounces to 3
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Set Insure-For to $56.00
    Then Details: Set Tracking to Signature Required

    # Parcel Select

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 10
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Insure-For to $235.00
    Then Details: Set Tracking to USPS Tracking


