Feature: Print 1 Intl CP72 label with continuation on on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_roll_continuation
  Scenario: Print 1 Intl CP72 label with continuation on on 4x6 Roll
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | name     | company   | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | PMI LFRB |  4x6 Roll | random           | random           | random | random  | random      | Italy   | random  | random  |
    Then set Order Details form service to PMI Large Flat Rate Box
    Then set Order Details form Weight to 2 lb 0 oz
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 2, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 3, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then add Customs form Associated Item 4, Description random, Qty 1, Price 4, Made In United States, Tariff 4
    Then add Customs form Associated Item 5, Description random, Qty 1, Price 5, Made In United States, Tariff 5
    Then add Customs form Associated Item 6, Description random, Qty 1, Price 6, Made In United States, Tariff 6
    Then add Customs form Associated Item 7, Description random, Qty 1, Price 7, Made In United States, Tariff 7
    Then add Customs form Associated Item 8, Description random, Qty 1, Price 8, Made In United States, Tariff 8
    Then add Customs form Associated Item 9, Description random, Qty 1, Price 9, Made In United States, Tariff 9
    Then add Customs form Associated Item 10, Description random, Qty 1, Price 10, Made In United States, Tariff 10
    Then add Customs form Associated Item 11, Description random, Qty 1, Price 11, Made In United States, Tariff 11
    Then add Customs form Associated Item 12, Description random, Qty 1, Price 12, Made In United States, Tariff 12
    Then add Customs form Associated Item 13, Description random, Qty 1, Price 13, Made In United States, Tariff 13
    Then add Customs form Associated Item 14, Description random, Qty 1, Price 14, Made In United States, Tariff 14
    Then add Customs form Associated Item 15, Description random, Qty 1, Price 15, Made In United States, Tariff 15
    Then add Customs form Associated Item 16, Description random, Qty 1, Price 16, Made In United States, Tariff 16
    Then add Customs form Associated Item 17, Description random, Qty 1, Price 17, Made In United States, Tariff 17
    Then add Customs form Associated Item 18, Description random, Qty 1, Price 18, Made In United States, Tariff 18
    Then add Customs form Associated Item 19, Description random, Qty 1, Price 19, Made In United States, Tariff 19
    Then add Customs form Associated Item 20, Description random, Qty 1, Price 20, Made In United States, Tariff 20
    Then add Customs form Associated Item 21, Description random, Qty 1, Price 21, Made In United States, Tariff 21
    Then add Customs form Associated Item 22, Description random, Qty 1, Price 22, Made In United States, Tariff 22
    Then add Customs form Associated Item 23, Description random, Qty 1, Price 23, Made In United States, Tariff 23
    Then add Customs form Associated Item 24, Description random, Qty 1, Price 24, Made In United States, Tariff 24
    Then add Customs form Associated Item 25, Description random, Qty 1, Price 25, Made In United States, Tariff 25
    Then add Customs form Associated Item 26, Description random, Qty 1, Price 26, Made In United States, Tariff 26
    Then add Customs form Associated Item 27, Description random, Qty 1, Price 27, Made In United States, Tariff 27
    Then add Customs form Associated Item 28, Description random, Qty 1, Price 28, Made In United States, Tariff 28
    Then add Customs form Associated Item 29, Description random, Qty 1, Price 29, Made In United States, Tariff 29
    Then add Customs form Associated Item 30, Description random, Qty 1, Price 30, Made In United States, Tariff 30
    Then add Customs form Associated Item 31, Description random, Qty 1, Price 30, Made In United States, Tariff 31
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4" x 6" Shipping Label"
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Sign out
