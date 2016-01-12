Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PME FR Envelope, 5.5x8.5, 26930 NE 152nd St., Duvall WA 98019-8316
    Then Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PME LFR Envelope, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PME PFR Envelope, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Box | 5.5x8.5  | random           | random           | random | random  | random      | Spain | random  | random  |
    Then Set Order Details Service to "Priority Mail International Large Flat Rate Box"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI Pkg-Flat-Env | 5.5x8.5 | random           | random           | random | random  | random      | Turkey | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Package"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI FR Envelope | 5.5x8.5 | random           | random           | random | random  | random      | Argentina | random  | random  |
    Then Set Order Details Service to "Priority Mail Express International Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Check Orders Grid row 3
    Then Check Orders Grid row 4
    Then Check Orders Grid row 5
    Then Check Orders Grid row 6
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out
