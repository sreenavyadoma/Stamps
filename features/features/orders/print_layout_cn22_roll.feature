Feature: Print 1 Intl CN22 label on 4x6 Roll

  Background:
    Given I am signed in to Orders

  @print_layouts_cn22_cp72 @cn22_raytest3
  Scenario: Print 1 Intl CN22 label on 4x6 Roll
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | FCMI PTE | 4x6 Roll  | random           | random           | random | random  | random      | Norway | random  | random  |
    Then Order Details - Set Service to "First-Class Mail International Package/Thick Envelope"
    Then Order Details - Set Ounces to 1
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    And Customs Form - Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal - Set Media "Roll - 4" x 6" Shipping Label"
    Then Toolbar - Print
    Then Sign out
