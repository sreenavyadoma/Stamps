# encoding: utf-8
Feature: Print 1 Intl CN22 label on 5.5x8.5 for EDD country - left side

  Background:
    Given I am signed in to Orders as webpost_0007/pass111

  @print_layouts_cn22_edd
  Scenario: Print 1 Intl CN22 label for EDD country on 5.5 x 8.5 label
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI SFRB | 5.5x8.5  | random           | random           | random | random  | random      | Netherlands | random  | random  |
    Then Order Details - Set Service to "Priority Mail International Small Flat Rate Box"
    Then Order Details - Set Ounces to 1
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar - Print
    Then Sign out
