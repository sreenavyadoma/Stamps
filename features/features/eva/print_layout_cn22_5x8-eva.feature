# encoding: utf-8
Feature: Print 1 Intl CN22 label on 5.5x8.5 for EDD country - left side

  Background:
    Given I am signed in to Orders

  @print_layout_cn22_5x8_eva
  Scenario: Print 1 Intl CN22 label for EDD country on 5.5 x 8.5 label
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI SFRB | 5.5x8.5  | random           | random           | random | random  | random      | Netherlands | random  | random  |
    Then Details: Select Service PM International Small Flat Rate Box
    Then Details: Set Ounces to 1

    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Print: Expect left-side label selected
    Then Print: Print
    Then Sign out
