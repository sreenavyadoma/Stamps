Feature: Print 1 Intl CP72 label with continuation on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 8.5x11 - left side
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then Order Details - Set Service to "Priority Mail Express International Package/Flat/Thick Envelope"
    Then Order Details - Set Weight to 1 lbs 14 oz
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Customs Form - Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 1
    And Customs Form - Add Item 2, Description random, Qty 1, Price 2, Lbs 0, Oz 1 Origin United States, Tariff 2
    And Customs Form - Add Item 3, Description random, Qty 1, Price 3, Lbs 0, Oz 1 Origin United States, Tariff 3
    And Customs Form - Add Item 4, Description random, Qty 1, Price 4, Lbs 0, Oz 1 Origin United States, Tariff 4
    And Customs Form - Add Item 5, Description random, Qty 1, Price 5, Lbs 0, Oz 1 Origin United States, Tariff 5
    And Customs Form - Add Item 6, Description random, Qty 1, Price 6, Lbs 0, Oz 1 Origin United States, Tariff 6
    And Customs Form - Add Item 7, Description random, Qty 1, Price 7, Lbs 0, Oz 1 Origin United States, Tariff 7
    And Customs Form - Add Item 8, Description random, Qty 1, Price 8, Lbs 0, Oz 1 Origin United States, Tariff 8
    And Customs Form - Add Item 9, Description random, Qty 1, Price 9, Lbs 0, Oz 1 Origin United States, Tariff 9
    And Customs Form - Add Item 10, Description random, Qty 1, Price 10, Lbs 0, Oz 1 Origin United States, Tariff 10
    And Customs Form - Add Item 11, Description random, Qty 1, Price 11, Lbs 0, Oz 1 Origin United States, Tariff 11
    And Customs Form - Add Item 12, Description random, Qty 1, Price 12, Lbs 0, Oz 1 Origin United States, Tariff 12
    And Customs Form - Add Item 13, Description random, Qty 1, Price 13, Lbs 0, Oz 1 Origin United States, Tariff 13
    And Customs Form - Add Item 14, Description random, Qty 1, Price 14, Lbs 0, Oz 1 Origin United States, Tariff 14
    And Customs Form - Add Item 15, Description random, Qty 1, Price 15, Lbs 0, Oz 1 Origin United States, Tariff 15
    And Customs Form - Add Item 16, Description random, Qty 1, Price 16, Lbs 0, Oz 1 Origin United States, Tariff 16
    And Customs Form - Add Item 17, Description random, Qty 1, Price 17, Lbs 0, Oz 1 Origin United States, Tariff 17
    And Customs Form - Add Item 18, Description random, Qty 1, Price 18, Lbs 0, Oz 1 Origin United States, Tariff 18
    And Customs Form - Add Item 19, Description random, Qty 1, Price 19, Lbs 0, Oz 1 Origin United States, Tariff 19
    And Customs Form - Add Item 20, Description random, Qty 1, Price 20, Lbs 0, Oz 1 Origin United States, Tariff 20
    And Customs Form - Add Item 21, Description random, Qty 1, Price 21, Lbs 0, Oz 1 Origin United States, Tariff 21
    And Customs Form - Add Item 22, Description random, Qty 1, Price 22, Lbs 0, Oz 1 Origin United States, Tariff 22
    And Customs Form - Add Item 23, Description random, Qty 1, Price 23, Lbs 0, Oz 1 Origin United States, Tariff 23
    And Customs Form - Add Item 24, Description random, Qty 1, Price 24, Lbs 0, Oz 1 Origin United States, Tariff 24
    And Customs Form - Add Item 25, Description random, Qty 1, Price 25, Lbs 0, Oz 1 Origin United States, Tariff 25
    And Customs Form - Add Item 26, Description random, Qty 1, Price 26, Lbs 0, Oz 1 Origin United States, Tariff 26
    And Customs Form - Add Item 27, Description random, Qty 1, Price 27, Lbs 0, Oz 1 Origin United States, Tariff 27
    And Customs Form - Add Item 28, Description random, Qty 1, Price 28, Lbs 0, Oz 1 Origin United States, Tariff 28
    And Customs Form - Add Item 29, Description random, Qty 1, Price 29, Lbs 0, Oz 1 Origin United States, Tariff 29
    And Customs Form - Add Item 30, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 30
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
