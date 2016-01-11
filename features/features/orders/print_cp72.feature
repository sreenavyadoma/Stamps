# encoding: utf-8
  @print_cn22_cp72_layouts
@cn22_cp72
Feature: Print CP72 Layouts

  Background:
    Given I am signed in to Orders

  @cp72_left @new_customs_forms @cn22_cp72
  Scenario: User Prints 1 Intl CP72 label on 5.5x8.5 - left side
     # 1 CP72 label 5 ½" x 8 ½"
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | China | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out

  @cp72_right @new_customs_forms @cn22_cp72
  Scenario: User Prints 1 Intl CP72 label on 5.5x8.5 - right side
    # 1 CP72 label 5 ½" x 8 ½" right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFR Envelope |  5.5x8.5 Right Side 1  | random       | random           | random | random  | random      | Argentina | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Print
    Then Sign out

  @roll_4x6_cp72 @new_customs_forms @cn22_cp72
  Scenario: User Prints 1 Intl CP72 label on 4x6 Roll
# 1 CP72 label 4" x 6" Roll
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Roll - 4" x 6" Shipping Label"
    Then Print
    Then Sign out
