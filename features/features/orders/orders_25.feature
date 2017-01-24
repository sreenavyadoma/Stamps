# encoding: utf-8
Feature: 25 orders

  Background:
    Given A user is signed in to Orders

  @orders_25 @jenkins_orders
  Scenario:  25 orders

    # International
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then On Order Details form, set Ounces to 2
    Then On Order Details form, set Pounds to 2
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 100.50, Origin United States, Tariff 100
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service FCMI Large Envelope

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then On Order Details form, set Ounces to 2
    Then On Order Details form, set Pounds to 2
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 100.50, Origin United States, Tariff 100
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service FCM Large Envelope
    Then On Order Details form, set Insure-For to $15.00
    Then On Order Details form, set Tracking to "None"
    Then In Orders Grid, check row 1

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 2
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service First-Class Mail Package/Thick Envelope
    Then On Order Details form, set Insure-For to $45.00
    Then On Order Details form, set Tracking to USPS Tracking
    Then In Orders Grid, check row 1

    #Priority Mail
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then In Orders Grid, check row 1
    Then On Order Details form, set Ounces to 3
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, set Tracking to USPS Tracking

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 4
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 5
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Insure-For to $145.00
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 6
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 7
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Padded Flat Rate Envelope
    Then On Order Details form, set Insure-For to $98.00
    Then On Order Details form, set Tracking to USPS Tracking

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 8
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 9
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Small Flat Rate Box
    Then On Order Details form, set Insure-For to $30.00
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 10
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Medium Flat Rate Box
    Then On Order Details form, set Insure-For to $45.00
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 11
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Large Flat Rate Box
    Then On Order Details form, set Insure-For to $239.00
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 12
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Regional Rate Box A
    Then On Order Details form, set Insure-For to $105.00
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 13
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PM Regional Rate Box B
    Then On Order Details form, set Insure-For to $205.00
    Then On Order Details form, set Tracking to USPS Tracking

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 14
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, set Insure-For to $305.00
    Then On Order Details form, set Tracking to Signature Required

    # Priority Mail Express
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 15
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PME Package
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 16
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PME Flat Rate Envelope
    Then On Order Details form, set Tracking to USPS Tracking

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 17
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 18
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PME Legal Flat Rate Envelope
    Then On Order Details form, set Tracking to USPS Tracking

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 19
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Tracking to Signature Required

    # Media Mail
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 20
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Insure-For to $56.00
    Then On Order Details form, set Tracking to Signature Required

    # Parcel Select
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 21
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Insure-For to $345.00
    Then On Order Details form, set Tracking to USPS Tracking

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 22
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Insure-For to $456.00
    Then On Order Details form, set Tracking to Signature Required

    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Order ID is truthy
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 23
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, select service PSG Oversized Package
    Then On Order Details form, set Insure-For to $567.00
    Then On Order Details form, set Tracking to Signature Required
    Then Sign out
