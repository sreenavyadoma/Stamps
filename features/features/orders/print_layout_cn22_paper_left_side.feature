Feature: Print 2 Intl CN22 labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_layouts_cn22_cp72
  Scenario: Print 2 Intl CN22 labels on 8.5x11 - left side
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Left Side | random           | random           | random | random  | random      | Germany | random  | random  |
    Then Order Details - Set Service to "Priority Mail International Padded Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    When Add New Order

    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side | random           | random           | random | random  | random      | Mexico | random  | random  |
    Then Order Details - Set Service to "Priority Mail International Legal Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form

    Then Orders Grid - Check row 1
    Then Orders Grid - Check row 2
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select left-side label
    And Expect Print Modal left-side label selected
    Then Print
    Then Sign out
