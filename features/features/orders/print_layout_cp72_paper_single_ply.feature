Feature: Print 1 single ply Intl CP72 label on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply
  Scenario: Print 1 single ply Intl CP72 label on 8.5x11 - left side
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFRE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then Order Details - Set Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Document"
    And Customs Form - Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select left-side label
    And Expect Print Modal left-side label selected
    Then Print Modal - Print Sample
    Then Toolbar - Print
    Then Sign out
