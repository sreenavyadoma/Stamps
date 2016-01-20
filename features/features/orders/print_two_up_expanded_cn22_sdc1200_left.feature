Feature:  As a batch shipper, I want to be able to print multiple labels

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Prints 1 Intl CP72, 1 Intl CN22 label on SDC-1200 - left side
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI Pkg-Flat-Env | SDC-1200  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Order Details - Set Service to "Priority Mail International Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Customs Form - Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | PMI FR Envelope | SDC-1200  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Order Details - Set Service to "Priority Mail International Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Customs Form - Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Orders Grid - Check row 1
    Then Orders Grid - Check row 2
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar - Print
    Then Sign out
