Feature: Print 1 Intl CP72 label on sdc1200 - right side

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply
  Scenario: Print 1 Intl CP72 label on sdc1200 - right side
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  sdc1200 Right Side 1  | random       | random           | random | random  | random      | Costa Rica | random  | random  |
    Then Order Details - Set Service to "Priority Mail Express International Package/Flat/Thick Envelope"
    Then Order Details - Set Ounces to 1
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select right-side label
    Then Expect Print Modal right-side label selected
    Then Print
    Then Sign out
