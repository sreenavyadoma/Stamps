Feature: 10 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Insure-For to $15.00

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Insure-For to $45.00
    Then set Order Details form Tracking to USPS Tracking

    #Priority Mail

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Large Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Insure-For to $105.00
    Then set Order Details form Tracking to Signature Required

    # Priority Mail Express

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PME Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 11
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Tracking to Signature Required

    # Media Mail

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 3
    Then set Order Details form service to MM Package
    Then set Order Details form Insure-For to $56.00
    Then set Order Details form Tracking to Signature Required

    # Parcel Select

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 10
    Then set Order Details form service to PSG Package
    Then set Order Details form Insure-For to $235.00
    Then set Order Details form Tracking to USPS Tracking

    Then Sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Insure-For to $15.00

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Insure-For to $45.00
    Then set Order Details form Tracking to USPS Tracking

    #Priority Mail

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Large Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Insure-For to $105.00
    Then set Order Details form Tracking to Signature Required

    # Priority Mail Express

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PME Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 11
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Tracking to Signature Required

    # Media Mail

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 3
    Then set Order Details form service to MM Package
    Then set Order Details form Insure-For to $56.00
    Then set Order Details form Tracking to Signature Required

    # Parcel Select

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 10
    Then set Order Details form service to PSG Package
    Then set Order Details form Insure-For to $235.00
    Then set Order Details form Tracking to USPS Tracking


    # First Class Mail

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Insure-For to $15.00

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Insure-For to $45.00
    Then set Order Details form Tracking to USPS Tracking

    #Priority Mail

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Large Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Insure-For to $105.00
    Then set Order Details form Tracking to Signature Required

    # Priority Mail Express

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PME Package
    Then set Order Details form Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 11
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then set Order Details form Tracking to Signature Required

    # Media Mail

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 3
    Then set Order Details form service to MM Package
    Then set Order Details form Insure-For to $56.00
    Then set Order Details form Tracking to Signature Required

    # Parcel Select

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 10
    Then set Order Details form service to PSG Package
    Then set Order Details form Insure-For to $235.00
    Then set Order Details form Tracking to USPS Tracking


