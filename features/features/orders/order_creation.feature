Feature: 10 orders

  Background:
    Given I am signed in to Orders

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Insure-For to $15.00

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Insure-For to $45.00
    Then Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Insure-For to $105.00
    Then Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PME Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 11
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Tracking to Signature Required

    # Media Mail

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 3
    Then Order Details: Select Service MM Package
    Then Order Details: Set Insure-For to $56.00
    Then Order Details: Set Tracking to Signature Required

    # Parcel Select

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 10
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Insure-For to $235.00
    Then Order Details: Set Tracking to USPS Tracking

    Then Sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Insure-For to $15.00

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Insure-For to $45.00
    Then Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Insure-For to $105.00
    Then Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PME Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 11
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Tracking to Signature Required

    # Media Mail

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 3
    Then Order Details: Select Service MM Package
    Then Order Details: Set Insure-For to $56.00
    Then Order Details: Set Tracking to Signature Required

    # Parcel Select

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 10
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Insure-For to $235.00
    Then Order Details: Set Tracking to USPS Tracking


    # First Class Mail

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Insure-For to $15.00

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Insure-For to $45.00
    Then Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Insure-For to $105.00
    Then Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PME Package
    Then Order Details: Set Tracking to Signature Required

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 11
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Tracking to Signature Required

    # Media Mail

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 3
    Then Order Details: Select Service MM Package
    Then Order Details: Set Insure-For to $56.00
    Then Order Details: Set Tracking to Signature Required

    # Parcel Select

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 10
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Insure-For to $235.00
    Then Order Details: Set Tracking to USPS Tracking


