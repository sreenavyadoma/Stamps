# encoding: utf-8
Feature: Test Development

  Background:
    Given I am signed in to Orders as webpost_0009/pass111

  @ray_test
  Scenario: User Prints 2 Intl CN22 labels on 8.5x11 - left side
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Left Side | random           | random           | random | random  | random      | Germany | random  | random  |
    Then Set Order Details Service to "Priority Mail International Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side | random           | random           | random | random  | random      | Mexico | random  | random  |
    Then Set Order Details Service to "Priority Mail International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select Print Modal left-side label
    And Expect Print Modal left-side label selected
    And Expect Print Window requires 2 label sheets
    Then Print
    Then Sign out

  @ray_test_cp72_left
  Scenario: User Prints 1 Intl CP72 label on 5.5x8.5 - left side
    # 1 CP72 label 5 ½" x 8 ½"
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | China | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out

  @ray_test_cp72_right
  Scenario: User Prints 1 Intl CP72 label on 5.5x8.5 - right side
    # 1 CP72 label 5 ½" x 8 ½" right side
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFR Envelope |  5.5x8.5 Right Side 1  | random       | random           | random | random  | random      | Argentina | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Print
    Then Sign out

  @ray_test_roll_4x6_cp72
  Scenario: User Prints 1 Intl CP72 label on 4x6 Roll
    # 1 CP72 label 4" x 6" Roll
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Roll - 4" x 6" Shipping Label"
    Then Print
    Then Sign out

  @ray_test_roll_4x6_cp72
  Scenario: User Prints 1 Intl CP72 label on 4x6 Roll
    # 1 CP72 label 4" x 6" Roll
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Roll - 4" x 6" Shipping Label"
    Then Print
    Then Sign out

  @ray_test_fpo_cn22_left
  Scenario: User Prints 1 FPO CN22 Label on 8.5x11 - left side
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to United States
    Then Set Order Details Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1
    Then Set Order Details Length to 1
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Item - Quantity 1, ID random, Description random
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    And Expect Print Window requires 1 label sheets
    Then Print
    Then Sign out

  @ray_test_fpo_cn22_right
  Scenario: User Prints 1 FPO CN22 label on 8.5x11 - right side
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to United States
    Then Set Order Details Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box C | 8.5x11 Right Side 1 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set Order Details Ounces to 3
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    And Expect Print Window requires 1 label sheets
    Then Print Sample
    Then Print
    Then Sign out


