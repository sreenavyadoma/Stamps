Feature: 10 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details insure-for to $15.00

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details insure-for to $45.00
    Then set Order Details Tracking to USPS Tracking

    #Priority Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Package
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Large Package
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Legal Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    # Then set Order Details Tracking to Signature Required

    # Priority Mail Express

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PME Package/Flat/Thick Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 11
    Then set order details service to PME Padded Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    # Media Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 3
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    # Then set Order Details Tracking to Signature Required

    # Parcel Select

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 10
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $235.00
    Then set Order Details Tracking to USPS Tracking

    Then sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details insure-for to $15.00

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details insure-for to $45.00
    Then set Order Details Tracking to USPS Tracking

    #Priority Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Package
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Large Package
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Legal Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    # Then set Order Details Tracking to Signature Required

    # Priority Mail Express

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PME Package/Flat/Thick Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 11
    Then set order details service to PME Padded Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    # Media Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 3
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    # Then set Order Details Tracking to Signature Required

    # Parcel Select

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 10
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $235.00
    Then set Order Details Tracking to USPS Tracking


    # First Class Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details insure-for to $15.00

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details insure-for to $45.00
    Then set Order Details Tracking to USPS Tracking

    #Priority Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Package
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Large Package
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Legal Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    # Then set Order Details Tracking to Signature Required

    # Priority Mail Express

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PME Package/Flat/Thick Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 11
    Then set order details service to PME Padded Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    # Media Mail

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details ounces to 3
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    # Then set Order Details Tracking to Signature Required

    # Parcel Select

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details pounds to 10
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $235.00
    Then set Order Details Tracking to USPS Tracking


