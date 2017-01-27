Feature: 10 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Insure-For to $15.00

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Insure-For to $45.00
    Then on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Insure-For to $105.00
    Then on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 11
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    # Media Mail

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 3
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Insure-For to $56.00
    Then on Order Details form, set Tracking to Signature Required

    # Parcel Select

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 10
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Insure-For to $235.00
    Then on Order Details form, set Tracking to USPS Tracking

    Then Sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Insure-For to $15.00

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Insure-For to $45.00
    Then on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Insure-For to $105.00
    Then on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 11
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    # Media Mail

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 3
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Insure-For to $56.00
    Then on Order Details form, set Tracking to Signature Required

    # Parcel Select

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 10
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Insure-For to $235.00
    Then on Order Details form, set Tracking to USPS Tracking


    # First Class Mail

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Insure-For to $15.00

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Insure-For to $45.00
    Then on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Insure-For to $105.00
    Then on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 11
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    # Media Mail

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 3
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Insure-For to $56.00
    Then on Order Details form, set Tracking to Signature Required

    # Parcel Select

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 10
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Insure-For to $235.00
    Then on Order Details form, set Tracking to USPS Tracking


