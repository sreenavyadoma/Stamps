# encoding: utf-8
Feature: 25 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_25 @jenkins_orders
  Scenario:  25 orders

    # International
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, set Pounds to 2
    Then on Order Details form, click Edit Form button
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 100.50, Origin United States, Tariff 100
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, set Pounds to 2
    Then on Order Details form, click Edit Form button
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 100.50, Origin United States, Tariff 100
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Insure-For to $15.00
    Then on Order Details form, set Tracking to "None"
    Then In Orders Grid, check row 1

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service First-Class Mail Package/Thick Envelope
    Then on Order Details form, set Insure-For to $45.00
    Then on Order Details form, set Tracking to USPS Tracking
    Then In Orders Grid, check row 1

    #Priority Mail
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then In Orders Grid, check row 1
    Then on Order Details form, set Ounces to 3
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Tracking to USPS Tracking

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 4
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 5
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Insure-For to $145.00
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 6
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 7
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, set Insure-For to $98.00
    Then on Order Details form, set Tracking to USPS Tracking

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 8
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 9
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, set Insure-For to $30.00
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 10
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, set Insure-For to $45.00
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 11
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, set Insure-For to $239.00
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 12
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Insure-For to $105.00
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 13
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, set Insure-For to $205.00
    Then on Order Details form, set Tracking to USPS Tracking

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 14
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, set Insure-For to $305.00
    Then on Order Details form, set Tracking to Signature Required

    # Priority Mail Express
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 15
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PME Package
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 16
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, set Tracking to USPS Tracking

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 17
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 18
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, set Tracking to USPS Tracking

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 19
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Tracking to Signature Required

    # Media Mail
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 20
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Insure-For to $56.00
    Then on Order Details form, set Tracking to Signature Required

    # Parcel Select
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 21
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Insure-For to $345.00
    Then on Order Details form, set Tracking to USPS Tracking

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 22
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Insure-For to $456.00
    Then on Order Details form, set Tracking to Signature Required

    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Order ID is truthy
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 23
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, select service PSG Oversized Package
    Then on Order Details form, set Insure-For to $567.00
    Then on Order Details form, set Tracking to Signature Required
    Then Sign out
