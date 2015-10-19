

Feature:  As a batch shipper, I want to be able to print two labels on one sheet

  Background:
    Given I am signed in as a batch shipper ff/autosuggest/password1

  @two_up_expanded @regression

  Scenario: User Prints multiple Domestic and CN22 labels

    # 1 Domestic label 8 ½" x 11"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 1 Domestic label 8 ½" x 11 right side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select right side label
    Then Expect right side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 2 Domestic labels 8 ½" x 11"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 2 Domestic labels 8 ½" x 11" right side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select right side label
    And Expect right side label selected
    And Expect Print Window requires 2 label sheets
    Then Click Print Modal - Print button

    # 3 Domestic labels 8 ½" x 11"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 2 label sheets
    Then Click Print Modal - Print button

    # 1 CN22 label 8 ½" x 11"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    #Then Select left side label
    #Then Expect left side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 1 CN22 label 8 ½" x 11" right side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    #Then Select right side label
    #Then Expect right side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 2 CN22 labels 8 ½" x 11"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 2 CN22 labels 8 ½" x 11" right side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select right side label
    And Expect right side label selected
    And Expect Print Window requires 2 label sheets
    Then Click Print Modal - Print button

    # 3 CN22 labels 8 ½" x 11"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid
    Then Open Print Modal

    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 2 label sheets
    Then Click Print Modal - Print button

    # 3 Domestic and 3 CN22 labels 8 ½" x 11"

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
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
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 3 label sheets
    Then Click Print Modal - Print button

    # 1 Domestic label 5 ½" x 8 ½"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 1 Domestic label 5 ½" x 8 ½" right side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select right side label
    Then Expect right side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 2 Domestic labels 5 ½" x 8 ½"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 2 Domestic labels 5 ½" x 8 ½" right side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select right side label
    And Expect right side label selected
    And Expect Print Window requires 2 label sheets
    Then Click Print Modal - Print button

    # 3 Domestic labels 5 ½" x 8 ½"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 2 label sheets
    Then Click Print Modal - Print button

    # 1 CN22 label 5 ½" x 8 ½"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    #Then Select left side label
    #Then Expect left side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 1 CN22 label 5 ½" x 8 ½" right side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    #Then Select right side label
    #Then Expect right side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 2 CN22 labels 5 ½" x 8 ½"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 1 label sheets
    Then Click Print Modal - Print button

    # 2 CN22 labels 5 ½" x 8 ½" right side
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select right side label
    And Expect right side label selected
    And Expect Print Window requires 2 label sheets
    Then Click Print Modal - Print button

    # 3 CN22 labels 5 ½" x 8 ½"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 2 label sheets
    Then Click Print Modal - Print button

    # 3 Domestic and 3 CN22 labels 5 ½" x 8 ½"

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Ounces to 1
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
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""
    Then Select left side label
    Then Expect left side label selected
    And Expect Print Window requires 3 label sheets
    Then Click Print Modal - Print button

    Then Sign out


######################################################################################################################

