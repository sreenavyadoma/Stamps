Feature: 10 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Insure-For to $15.00

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Insure-For to $45.00
    Then On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Regional Rate Box A
    Then On Order Details form, set Insure-For to $105.00
    Then On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PME Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 11
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    # Media Mail

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 3
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Insure-For to $56.00
    Then On Order Details form, set Tracking to Signature Required

    # Parcel Select

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 10
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Insure-For to $235.00
    Then On Order Details form, set Tracking to USPS Tracking

    Then Sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Insure-For to $15.00

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Insure-For to $45.00
    Then On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Regional Rate Box A
    Then On Order Details form, set Insure-For to $105.00
    Then On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PME Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 11
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    # Media Mail

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 3
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Insure-For to $56.00
    Then On Order Details form, set Tracking to Signature Required

    # Parcel Select

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 10
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Insure-For to $235.00
    Then On Order Details form, set Tracking to USPS Tracking


    # First Class Mail

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Insure-For to $15.00

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Insure-For to $45.00
    Then On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Regional Rate Box A
    Then On Order Details form, set Insure-For to $105.00
    Then On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PME Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 11
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    # Media Mail

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 3
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Insure-For to $56.00
    Then On Order Details form, set Tracking to Signature Required

    # Parcel Select

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 10
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Insure-For to $235.00
    Then On Order Details form, set Tracking to USPS Tracking


