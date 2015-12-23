# encoding: utf-8
Feature: I want to be able to print to 5.5 x 8.5 labels (single or multi) B-01667

  Background:
  Given I am signed in to Orders

  Scenario: Print - Shipping Label - 5 ½" x 8 ½"
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    #Then View Print On option Shipping Label 5.5 x 8.5 tooltip
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode."
   # Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination."
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783"
    Then Print
    And Sign out


  @label_5x8_printing
  Scenario: Print - Shipping Label - 8 ½" x 11" Paper
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Roll - 4" x 6" Shipping Label"
    Then Print


    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Print
    And Sign out

  Scenario: Print - Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print
    And Sign out

  Scenario: Print - Shipping Label - 5 ½" x 8 ½"
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Print
    And Sign out

  Scenario: Print - Roll - 4" x 6" Shipping Label
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Roll - 4" x 6" Shipping Label"
    Then Print
    And Sign out

  Scenario: Print - Roll - 4 ⅛" x 6 ¼" Shipping Label
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print
    And Sign out

  Scenario: Multi Order Printing - Shipping Label - 5 ½" x 8 ½"
    #Create order 1
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Uncheck row 1 on the order grid

    #Create order 2
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Uncheck row 1 on the order grid

    #Create order 3
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 2
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Uncheck row 1 on the order grid

    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid

    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Sample
    Then Expect system will only print first order
    And Sign out

  Scenario:  User prints postage for CN22 Shipping Label 5.5 x 8.5
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to
      | name            | company                 | street_address      | city          | state | zip        | country       | phone  |  email |
      | Jessie Joe      | The CN 22 House         | PSC 819 BOX 1       | FPO           | AE    | 09645-0001 | United States |        |        |
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 5
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 20, Weight(lbs) 0, Weight(oz) 5 Origin United States, Tariff 10
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Print
    And Sign out

  Scenario:  User prints postage for CP72 Shipping Label 5.5 x 8.5
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to
      | name            | company                 | street_address      | city          | state | zip        | country       | phone  |  email |
      | Tammmy Moo      | The CP72 House          | Unit 15324          | APO           | AP    | 96205-5324 | United States |        |        |
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Pounds to 3
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 20, Weight(lbs) 1, Weight(oz) 0 Origin United States, Tariff 10
    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Print
    And Sign out
