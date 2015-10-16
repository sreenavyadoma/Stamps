

Feature:  As a batch shipper, I want to be able to print two labels on one sheet

  Background:
    Given I am signed in as a batch shipper ff/autosuggest/password1

  @two_up @regression
  Scenario: User Prints multiple Domestic labels, CN22 labels and CP72 labels

    # 3 Domestic labels

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"

    # 1 CN22 label
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address | city | state | zip         | country       | phone  |  email |
      | random | Domestic APO | Unit 15324     | APO  | AP    | 96205-5324  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form

    # 2 CP72 labels
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address | city | state | zip         | country       | phone  |  email |
      | random | Domestic APO | Unit 15324     | APO  | AP    | 96205-5324  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Pounds to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address | city | state | zip         | country       | phone  |  email |
      | random | Domestic APO | Unit 15324     | APO  | AP    | 96205-5324  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Pounds to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form

    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid
    Then Edit row 4 on the order grid
    Then Edit row 5 on the order grid
    Then Edit row 6 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 �" x 8 �""
    Then Select right side label
    And Expect right side label selected
    And Expect Print Window requires 7 label sheets
    Then Click Print Modal - Print button

    And Sign out









