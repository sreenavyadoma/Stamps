# encoding: utf-8
Feature: Test Development

  Background:
    Given I am signed in to Orders as webpost_0007/pass111

  @cn22_raytest4
  Scenario: Print 1 Intl CN22 label on 5 ½" x 8 ½ label
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | FCMI PTE | 4x6 Roll  | random           | random           | random | random  | random      | Norway | random  | random  |
    Then Order Details - Set Service to "First-Class Mail International Package/Thick Envelope"
    Then Order Details - Set Weight to 1 lbs 1 oz
    Then Order Details - Add Item 1, Qty 1, ID random, Description random
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    And Customs Form - Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar - Print
    Then Sign out
