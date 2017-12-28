Feature: 10 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Package
    Then set Order Details Insure-For to $15.00

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Package
    Then set Order Details Insure-For to $45.00
    Then set Order Details Tracking to USPS Tracking

    #Priority Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Large Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Regional Rate Box A
    Then set Order Details Insure-For to $105.00
    Then set Order Details Tracking to Signature Required

    # Priority Mail Express

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PME Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 11
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Tracking to Signature Required

    # Media Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 3
    Then set Order Details service to MM Package
    Then set Order Details Insure-For to $56.00
    Then set Order Details Tracking to Signature Required

    # Parcel Select

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 10
    Then set Order Details service to PSG Package
    Then set Order Details Insure-For to $235.00
    Then set Order Details Tracking to USPS Tracking

    Then Sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Package
    Then set Order Details Insure-For to $15.00

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Package
    Then set Order Details Insure-For to $45.00
    Then set Order Details Tracking to USPS Tracking

    #Priority Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Large Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Regional Rate Box A
    Then set Order Details Insure-For to $105.00
    Then set Order Details Tracking to Signature Required

    # Priority Mail Express

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PME Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 11
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Tracking to Signature Required

    # Media Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 3
    Then set Order Details service to MM Package
    Then set Order Details Insure-For to $56.00
    Then set Order Details Tracking to Signature Required

    # Parcel Select

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 10
    Then set Order Details service to PSG Package
    Then set Order Details Insure-For to $235.00
    Then set Order Details Tracking to USPS Tracking


    # First Class Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Package
    Then set Order Details Insure-For to $15.00

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Package
    Then set Order Details Insure-For to $45.00
    Then set Order Details Tracking to USPS Tracking

    #Priority Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Large Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Regional Rate Box A
    Then set Order Details Insure-For to $105.00
    Then set Order Details Tracking to Signature Required

    # Priority Mail Express

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PME Package
    Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 11
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set Order Details Tracking to Signature Required

    # Media Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 3
    Then set Order Details service to MM Package
    Then set Order Details Insure-For to $56.00
    Then set Order Details Tracking to Signature Required

    # Parcel Select

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 10
    Then set Order Details service to PSG Package
    Then set Order Details Insure-For to $235.00
    Then set Order Details Tracking to USPS Tracking


