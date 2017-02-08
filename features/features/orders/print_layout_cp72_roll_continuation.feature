Feature: Print 1 Intl CP72 label with continuation on on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_roll_continuation
  Scenario: Print 1 Intl CP72 label with continuation on on 4x6 Roll
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name     | company   | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | PMI LFRB |  4x6 Roll | random           | random           | random | random  | random      | Italy   | random  | random  |
    Then on Order Details form, select service PMI Large Flat Rate Box
    Then on Order Details form, set Weight to 2 lb 0 oz
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 2, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 3, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then on Customs form, add Associated Item 4, Description random, Qty 1, Price 4, Made In United States, Tariff 4
    Then on Customs form, add Associated Item 5, Description random, Qty 1, Price 5, Made In United States, Tariff 5
    Then on Customs form, add Associated Item 6, Description random, Qty 1, Price 6, Made In United States, Tariff 6
    Then on Customs form, add Associated Item 7, Description random, Qty 1, Price 7, Made In United States, Tariff 7
    Then on Customs form, add Associated Item 8, Description random, Qty 1, Price 8, Made In United States, Tariff 8
    Then on Customs form, add Associated Item 9, Description random, Qty 1, Price 9, Made In United States, Tariff 9
    Then on Customs form, add Associated Item 10, Description random, Qty 1, Price 10, Made In United States, Tariff 10
    Then on Customs form, add Associated Item 11, Description random, Qty 1, Price 11, Made In United States, Tariff 11
    Then on Customs form, add Associated Item 12, Description random, Qty 1, Price 12, Made In United States, Tariff 12
    Then on Customs form, add Associated Item 13, Description random, Qty 1, Price 13, Made In United States, Tariff 13
    Then on Customs form, add Associated Item 14, Description random, Qty 1, Price 14, Made In United States, Tariff 14
    Then on Customs form, add Associated Item 15, Description random, Qty 1, Price 15, Made In United States, Tariff 15
    Then on Customs form, add Associated Item 16, Description random, Qty 1, Price 16, Made In United States, Tariff 16
    Then on Customs form, add Associated Item 17, Description random, Qty 1, Price 17, Made In United States, Tariff 17
    Then on Customs form, add Associated Item 18, Description random, Qty 1, Price 18, Made In United States, Tariff 18
    Then on Customs form, add Associated Item 19, Description random, Qty 1, Price 19, Made In United States, Tariff 19
    Then on Customs form, add Associated Item 20, Description random, Qty 1, Price 20, Made In United States, Tariff 20
    Then on Customs form, add Associated Item 21, Description random, Qty 1, Price 21, Made In United States, Tariff 21
    Then on Customs form, add Associated Item 22, Description random, Qty 1, Price 22, Made In United States, Tariff 22
    Then on Customs form, add Associated Item 23, Description random, Qty 1, Price 23, Made In United States, Tariff 23
    Then on Customs form, add Associated Item 24, Description random, Qty 1, Price 24, Made In United States, Tariff 24
    Then on Customs form, add Associated Item 25, Description random, Qty 1, Price 25, Made In United States, Tariff 25
    Then on Customs form, add Associated Item 26, Description random, Qty 1, Price 26, Made In United States, Tariff 26
    Then on Customs form, add Associated Item 27, Description random, Qty 1, Price 27, Made In United States, Tariff 27
    Then on Customs form, add Associated Item 28, Description random, Qty 1, Price 28, Made In United States, Tariff 28
    Then on Customs form, add Associated Item 29, Description random, Qty 1, Price 29, Made In United States, Tariff 29
    Then on Customs form, add Associated Item 30, Description random, Qty 1, Price 30, Made In United States, Tariff 30
    Then on Customs form, add Associated Item 31, Description random, Qty 1, Price 30, Made In United States, Tariff 31
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Sign out
