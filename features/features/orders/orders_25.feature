# encoding: utf-8
Feature: 25 orders

  Background:
    Given I am signed in to Orders

  @orders_25 @jenkins_orders
  Scenario:  25 orders

    # International
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Open Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Details: Set Service to "First-Class Mail International Large Envelope/Flat"

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Open Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail
    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Details: Set Insure For to $15.00
    Then Details: Set Tracking to "None"
    Then Grid: Check row 1

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 2
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "First-Class Mail Package/Thick Envelope"
    Then Details: Set Insure For to $45.00
    Then Details: Set Tracking to "USPS Tracking"
    Then Grid: Check row 1

    #Priority Mail
    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Grid: Check row 1
    Then Details: Set Ounces to 3
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Details: Set Tracking to "USPS Tracking"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 4
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 5
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Large Package"
    Then Details: Set Insure For to $145.00
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 6
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 7
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Details: Set Insure For to $98.00
    Then Details: Set Tracking to "USPS Tracking"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 8
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 9
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Details: Set Insure For to $30.00
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 10
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Medium Flat Rate Box"
    Then Details: Set Insure For to $45.00
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 11
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Large Flat Rate Box"
    Then Details: Set Insure For to $239.00
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 12
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Details: Set Insure For to $105.00
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 13
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Regional Rate Box B"
    Then Details: Set Insure For to $205.00
    Then Details: Set Tracking to "USPS Tracking"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 14
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Insure For to $305.00
    Then Details: Set Tracking to "Signature Required"

    # Priority Mail Express
    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 15
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Express Package"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 16
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Details: Set Tracking to "USPS Tracking"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 17
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 18
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Details: Set Tracking to "USPS Tracking"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 19
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Tracking to "Signature Required"

    # Media Mail
    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 20
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Insure For to $56.00
    Then Details: Set Tracking to "Signature Required"

    # Parcel Select
    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 21
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Parcel Select Ground Package"
    Then Details: Set Insure For to $345.00
    Then Details: Set Tracking to "USPS Tracking"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 22
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Set Insure For to $456.00
    Then Details: Set Tracking to "Signature Required"

    Then Add New Order
    Then Expect new Order ID created
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Pounds to 23
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Details: Set Insure For to $567.00
    Then Details: Set Tracking to "Signature Required"
    Then Sign out
