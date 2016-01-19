# encoding: utf-8
Feature: Test Development

  Background:
    Given I am signed in to Orders as webpost_0007/pass111

  @cn22_raytest4
  Scenario: Print 1 Intl CN22 label on 5 ½" x 8 ½ label
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | FCMI PTE | 4x6 Roll  | random           | random           | random | random  | random      | Norway | random  | random  |
    Then Set Order Details Service to "First-Class Mail International Package/Thick Envelope"
    Then Set Order Details Weight to 1 lbs 1 oz
    Then Add Order Details Item 1 - Qty 1, ID random, Description random
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out
