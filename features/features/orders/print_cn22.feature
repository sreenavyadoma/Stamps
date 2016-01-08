# encoding: utf-8
  @print_cn22_cp72_layouts
  @cn22_cp72
Feature: Print CN22

  Background:
    Given I am signed in to Orders

  @cn22_8_5x11 @new_customs_forms_dev_1 @cn22_cp72
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
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    And I Add a new order

    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side | random           | random           | random | random  | random      | Mexico | random  | random  |
    Then Set Order Details Service to "Priority Mail International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form

    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    And Expect Print Modal left-side label selected
    And Expect Print Window requires 1 label sheets
    Then Print
    Then Sign out

  @roll_4x6_cn22 @new_customs_forms @cn22_cp72
  Scenario: User Prints 1 Intl CN22 label on 4x6 Roll
    # 1 CN22 label 4" x 6" Roll
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | Norway | random  | random  |
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Roll - 4" x 6" Shipping Label"
    Then Print
    Then Sign out