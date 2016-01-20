# encoding: utf-8
Feature: 25 orders

  Background:
    Given I am signed in to Orders

  @orders_25 @jenkins_orders
  Scenario:  25 orders

    # International
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Order Details - Add Item 1 - Qty 1, ID random, Description random
    Then Order Details - Set Ounces to 2
    And Order Details - Set Pounds to 2
    And Open Customs Form
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Order Details - Set Service to "First-Class Mail International Large Envelope/Flat"

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then Order Details - Add Item 1 - Qty 1, ID random, Description random
    And Order Details - Set Ounces to 2
    And Order Details - Set Pounds to 2
    And Open Customs Form
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Order Details - Set Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail
    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 1
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "First-Class Mail Large Envelope/Flat"
    And Order Details - Set Insure For to $15.00
    And Order Details - Set Tracking to "None"
    Then UnOrders Grid - Check row 1

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 2
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "First-Class Mail Package/Thick Envelope"
    And Order Details - Set Insure For to $45.00
    And Order Details - Set Tracking to "USPS Tracking"
    Then UnOrders Grid - Check row 1

    #Priority Mail
    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then UnOrders Grid - Check row 1
    And Order Details - Set Ounces to 3
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Large/Thick Envelope"
    And Order Details - Set Tracking to "USPS Tracking"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 4
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Package"
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 5
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Large Package"
    And Order Details - Set Insure For to $145.00
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 6
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 7
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Padded Flat Rate Envelope"
    And Order Details - Set Insure For to $98.00
    And Order Details - Set Tracking to "USPS Tracking"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 8
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Legal Flat Rate Envelope"
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 9
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Small Flat Rate Box"
    And Order Details - Set Insure For to $30.00
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 10
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Medium Flat Rate Box"
    And Order Details - Set Insure For to $45.00
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 11
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Large Flat Rate Box"
    And Order Details - Set Insure For to $239.00
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 12
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Regional Rate Box A"
    And Order Details - Set Insure For to $105.00
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 13
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Regional Rate Box B"
    And Order Details - Set Insure For to $205.00
    And Order Details - Set Tracking to "USPS Tracking"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 14
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Insure For to $305.00
    And Order Details - Set Tracking to "Signature Required"

    # Priority Mail Express
    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Ounces to 15
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Express Package"
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 16
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Express Flat Rate Envelope"
    And Order Details - Set Tracking to "USPS Tracking"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 17
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 18
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    And Order Details - Set Tracking to "USPS Tracking"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 19
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    And Order Details - Set Tracking to "Signature Required"

    # Media Mail
    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 20
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Media Mail Package"
    And Order Details - Set Insure For to $56.00
    And Order Details - Set Tracking to "Signature Required"

    # Parcel Select
    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 21
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Parcel Select Ground Package"
    And Order Details - Set Insure For to $345.00
    And Order Details - Set Tracking to "USPS Tracking"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 22
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Parcel Select Ground Large Package"
    And Order Details - Set Insure For to $456.00
    And Order Details - Set Tracking to "Signature Required"

    When Add New Order
    And Expect new Order ID created
    And Order Details - Set Ship-From to default
    And Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Order Details - Set Pounds to 23
    And Order Details - Set Length to 1
    And Order Details - Set Width to 1
    And Order Details - Set Height to 1
    And Order Details - Set Service to "Parcel Select Ground Oversized Package"
    And Order Details - Set Insure For to $567.00
    And Order Details - Set Tracking to "Signature Required"
    And Sign out
