# encoding: utf-8
Feature: I want to be able to print to 5.5 x 8.5 labels (single or multi) B-01667

  Background:
  Given I am signed in to Orders

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    #Then View Print On option Shipping Label 5.5 x 8.5 tooltip
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode."
   # Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination."
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783"
    Then Toolbar: Print
    Then Sign out


  @label_5x8_printing
  Scenario: Print - Shipping Label: 8 ½" x 11" Paper
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Toolbar: Print

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4" x 6" Shipping Label"
    Then Toolbar: Print


    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Toolbar: Print

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Toolbar: Print
    Then Sign out

  Scenario: Print - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Toolbar: Print
    Then Sign out

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Toolbar: Print
    Then Sign out

  Scenario: Print - Roll - 4" x 6" Shipping Label
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4" x 6" Shipping Label"
    Then Toolbar: Print
    Then Sign out

  Scenario: Print - Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Toolbar: Print
    Then Sign out

  Scenario: Multi Order Printing - Shipping Label: 5 ½" x 8 ½"
    #Create order 1
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Orders Grid: Check row 1

    #Create order 2
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Orders Grid: Check row 1

    #Create order 3
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Orders Grid: Check row 1

    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Orders Grid: Check row 3

    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Print Sample
    Then Expect system will only print first order
    Then Sign out

  Scenario:  User prints postage for CN22 Shipping Label 5.5 x 8.5
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to
      | name            | company                 | street_address      | city          | state | zip        | country       | phone  |  email |
      | Jessie Joe      | The CN 22 House         | PSC 819 BOX 1       | FPO           | AE    | 09645-0001 | United States |        |        |
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Ounces to 5
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Customs Form
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 20, Lbs 0, Oz 5 Origin United States, Tariff 10
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Toolbar: Print
    Then Sign out

  Scenario:  User prints postage for CP72 Shipping Label 5.5 x 8.5
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to
      | name            | company                 | street_address      | city          | state | zip        | country       | phone  |  email |
      | Tammmy Moo      | The CP72 House          | Unit 15324          | APO           | AP    | 96205-5324 | United States |        |        |
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Pounds to 3
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Customs Form
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 20, Lbs 1, Oz 0 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Toolbar: Print
    Then Sign out
