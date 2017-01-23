# encoding: utf-8
Feature: I want is able to print to 5.5 x 8.5 labels (single or multi) B-01667

  Background:
  Given I am signed in to Orders

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    #Then View Print On option Shipping Label 5.5 x 8.5 tooltip
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode."
   # Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination."
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783"
    Then Print Modal: Print
    Then Sign out

  @print_labels_5x8
  Scenario: Print - Shipping Label: 8 ½" x 11" Paper
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print Modal: Print

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print Modal: Print


    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print Modal: Print

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Print
    Then Sign out

  Scenario: Print - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print Modal: Print
    Then Sign out

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Print
    Then Sign out

  Scenario: Print - Roll - 4" x 6" Shipping Label
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print Modal: Print
    Then Sign out

  Scenario: Print - Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print Modal: Print
    Then Sign out

  Scenario: Multi Order Printing - Shipping Label: 5 ½" x 8 ½"
    #Create order 1
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Orders Grid: Check row 1

    #Create order 2
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Orders Grid: Check row 1

    #Create order 3
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Ounces to 2
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Orders Grid: Check row 1

    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Orders Grid: Check row 3

    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Print Sample
    Then Expect system will only print first order
    Then Sign out

  Scenario:  User prints postage for CN22 Shipping Label 5.5 x 8.5
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name            | company                 | street_address      | street_address_2 |  city          | state | zip        | country       | phone  |  email |
      | Jessie Joe      | The CN 22 House         | PSC 819 BOX 1       |                  | FPO           | AE    | 09645-0001 | United States |        |        |
    Then Order Details: Select Service PM Package
    Then Order Details: Set Ounces to 5
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Order Details: Edit Customs Form
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 20, Origin United States, Tariff 10
    Then Customs Form: Close Customs Form
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Print
    Then Sign out

  Scenario:  User prints postage for CP72 Shipping Label 5.5 x 8.5
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name            | company                 | street_address      | street_address_2| city          | state | zip        | country       | phone  |  email |
      | Tammmy Moo      | The CP72 House          | Unit 15324          |                 | APO           | AP    | 96205-5324 | United States |        |        |
    Then Order Details: Select Service PM Package
    Then Order Details: Set Pounds to 3
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Order Details: Edit Customs Form
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 20, Origin United States, Tariff 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Print
    Then Sign out
