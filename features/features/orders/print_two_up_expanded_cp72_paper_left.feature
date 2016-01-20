Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PME FR Envelope, 5.5x8.5, 26930 NE 152nd St., Duvall WA 98019-8316
    Then Order Details - Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PME LFR Envelope, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Order Details - Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PME PFR Envelope, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then Order Details - Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Box | 5.5x8.5  | random           | random           | random | random  | random      | Spain | random  | random  |
    Then Order Details - Set Service to "Priority Mail International Large Flat Rate Box"
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
      | PMEI Pkg-Flat-Env | 5.5x8.5 | random           | random           | random | random  | random      | Turkey | random  | random  |
    Then Order Details - Set Service to "Priority Mail Express International Package"
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
      | PMEI FR Envelope | 5.5x8.5 | random           | random           | random | random  | random      | Argentina | random  | random  |
    Then Order Details - Set Service to "Priority Mail Express International Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Orders Grid - Check row 1
    Then Orders Grid - Check row 2
    Then Orders Grid - Check row 3
    Then Orders Grid - Check row 4
    Then Orders Grid - Check row 5
    Then Orders Grid - Check row 6
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar - Print
    Then Sign out
