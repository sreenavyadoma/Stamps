Feature: Print 2 Intl CN22 labels on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 2 Intl CN22 labels on 8.5x11 - right side
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Right Side 2 | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Order Details - Set Service to "Priority Mail International Padded Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side 1 | random           | random           | random | random  | random      | Japan | random  | random  |
    Then Order Details - Set Service to "Priority Mail International Legal Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Orders Grid - Check row 1
    Then Orders Grid - Check row 2
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select right-side label
    Then Expect Print Modal right-side label selected
    Then Toolbar - Print
    Then Sign out
