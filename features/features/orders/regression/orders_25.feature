# encoding: utf-8
Feature: 25 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_25 @jenkins_orders
  Scenario:  25 orders

    # International
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then set Order Details Ounces to 2
    Then set Order Details Pounds to 2
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 100.50, Made In United States, Tariff 100
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set Order Details service to FCMI Large Envelope/Flat

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then set Order Details Ounces to 2
    Then set Order Details Pounds to 2
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 100.50, Made In United States, Tariff 100
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set Order Details service to PMI Flat Rate Envelope

    # First Class Mail
    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to FCM Large Envelope/Flat
    Then set Order Details Insure-For to $15.00
    Then set Order Details Tracking to "None"
    Then check Orders Grid row 1

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 2
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set Order Details Insure-For to $45.00
    Then set Order Details Tracking to USPS Tracking
    Then check Orders Grid row 1

    #Priority Mail
    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then check Orders Grid row 1
    Then set Order Details Ounces to 3
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Large/Thick Envelope
    Then set Order Details Tracking to USPS Tracking

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 4
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Package
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 5
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Large Package
    Then set Order Details Insure-For to $145.00
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 6
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 7
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set Order Details Insure-For to $98.00
    Then set Order Details Tracking to USPS Tracking

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 8
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Legal Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 9
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Small Flat Rate Box
    Then set Order Details Insure-For to $30.00
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 10
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Medium Flat Rate Box
    Then set Order Details Insure-For to $45.00
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 11
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Large Flat Rate Box
    Then set Order Details Insure-For to $239.00
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 12
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Regional Rate Box A
    Then set Order Details Insure-For to $105.00
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 13
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PM Regional Rate Box B
    Then set Order Details Insure-For to $205.00
    Then set Order Details Tracking to USPS Tracking

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 14
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details Insure-For to $305.00
    # Then set Order Details Tracking to Signature Required

    # Priority Mail Express
    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 15
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PME Package/Flat/Thick Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 16
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PME Flat Rate Envelope
    Then set Order Details Tracking to USPS Tracking

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 17
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PME Padded Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 18
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set Order Details Tracking to USPS Tracking

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 19
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PME Padded Flat Rate Envelope
    # Then set Order Details Tracking to Signature Required

    # Media Mail
    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 20
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set Order Details Insure-For to $56.00
    # Then set Order Details Tracking to Signature Required

    # Parcel Select
    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 21
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PSG Package/Flat/Thick Envelope
    Then set Order Details Insure-For to $345.00
    Then set Order Details Tracking to USPS Tracking

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 22
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PSG Package/Flat/Thick Envelope
    Then set Order Details Insure-For to $456.00
    # Then set Order Details Tracking to Signature Required

    Then add new order
    Then expect Order Details Order ID is truthy
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 23
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details service to PSG Oversized Package
    Then set Order Details Insure-For to $567.00
    # Then set Order Details Tracking to Signature Required
    Then Sign out
