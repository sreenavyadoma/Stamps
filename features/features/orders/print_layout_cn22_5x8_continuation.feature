Feature: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_layout_cn22_5x8_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To International Adress;
      | name      | company            | street_address_1 | street_address_2 | city   | province| postal_code | country     | phone   |  email  |
      | PMEI PFTE |  5.5x8.5 Left Side | random           | random           | random | random  | random      | Philippines | random  | random  |
    Then Details: Set Service to "Priority Mail Express International Package"
    Then Details: Set Weight to 2 lbs 0 oz
    Then Open Customs Form
    Then Customs: Set Package Contents to "Gift"
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 1
    Then Customs: Add Item 2, Description random, Qty 1, Price 2, Lbs 0, Oz 1 Origin United States, Tariff 2
    Then Customs: Add Item 3, Description random, Qty 1, Price 3, Lbs 0, Oz 1 Origin United States, Tariff 3
    Then Customs: Add Item 4, Description random, Qty 1, Price 4, Lbs 0, Oz 1 Origin United States, Tariff 4
    Then Customs: Add Item 5, Description random, Qty 1, Price 5, Lbs 0, Oz 1 Origin United States, Tariff 5
    Then Customs: Add Item 6, Description random, Qty 1, Price 6, Lbs 0, Oz 1 Origin United States, Tariff 6
    Then Customs: Add Item 7, Description random, Qty 1, Price 7, Lbs 0, Oz 1 Origin United States, Tariff 7
    Then Customs: Add Item 8, Description random, Qty 1, Price 8, Lbs 0, Oz 1 Origin United States, Tariff 8
    Then Customs: Add Item 9, Description random, Qty 1, Price 9, Lbs 0, Oz 1 Origin United States, Tariff 9
    Then Customs: Add Item 10, Description random, Qty 1, Price 10, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Add Item 11, Description random, Qty 1, Price 11, Lbs 0, Oz 1 Origin United States, Tariff 11
    Then Customs: Add Item 12, Description random, Qty 1, Price 12, Lbs 0, Oz 1 Origin United States, Tariff 12
    Then Customs: Add Item 13, Description random, Qty 1, Price 13, Lbs 0, Oz 1 Origin United States, Tariff 13
    Then Customs: Add Item 14, Description random, Qty 1, Price 14, Lbs 0, Oz 1 Origin United States, Tariff 14
    Then Customs: Add Item 15, Description random, Qty 1, Price 15, Lbs 0, Oz 1 Origin United States, Tariff 15
    Then Customs: Add Item 16, Description random, Qty 1, Price 16, Lbs 0, Oz 1 Origin United States, Tariff 16
    Then Customs: Add Item 17, Description random, Qty 1, Price 17, Lbs 0, Oz 1 Origin United States, Tariff 17
    Then Customs: Add Item 18, Description random, Qty 1, Price 18, Lbs 0, Oz 1 Origin United States, Tariff 18
    Then Customs: Add Item 19, Description random, Qty 1, Price 19, Lbs 0, Oz 1 Origin United States, Tariff 19
    Then Customs: Add Item 20, Description random, Qty 1, Price 20, Lbs 0, Oz 1 Origin United States, Tariff 20
    Then Customs: Add Item 21, Description random, Qty 1, Price 21, Lbs 0, Oz 1 Origin United States, Tariff 21
    Then Customs: Add Item 22, Description random, Qty 1, Price 22, Lbs 0, Oz 1 Origin United States, Tariff 22
    Then Customs: Add Item 23, Description random, Qty 1, Price 23, Lbs 0, Oz 1 Origin United States, Tariff 23
    Then Customs: Add Item 24, Description random, Qty 1, Price 24, Lbs 0, Oz 1 Origin United States, Tariff 24
    Then Customs: Add Item 25, Description random, Qty 1, Price 25, Lbs 0, Oz 1 Origin United States, Tariff 25
    Then Customs: Add Item 26, Description random, Qty 1, Price 26, Lbs 0, Oz 1 Origin United States, Tariff 26
    Then Customs: Add Item 27, Description random, Qty 1, Price 27, Lbs 0, Oz 1 Origin United States, Tariff 27
    Then Customs: Add Item 28, Description random, Qty 1, Price 28, Lbs 0, Oz 1 Origin United States, Tariff 28
    Then Customs: Add Item 29, Description random, Qty 1, Price 29, Lbs 0, Oz 1 Origin United States, Tariff 29
    Then Customs: Add Item 30, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 30
    Then Customs: Add Item 31, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 31
    Then Customs: Add Item 32, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 32
    Then Customs: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print
    Then Sign out
