Feature: Print 1 Intl CP72 label with continuation on on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_roll_continuation
  Scenario: Print 1 Intl CP72 label with continuation on on 4x6 Roll
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name     | company   | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | PMI LFRB |  4x6 Roll | random           | random           | random | random  | random      | Italy   | random  | random  |
    Then On Order Details form, select service PMI Large Flat Rate Box
    Then On Order Details form, set Weight to 2 lb 0 oz
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 2, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 3, Description random, Qty 1, Price 3, Origin United States, Tariff 3
    Then On Customs form, add associated Item 4, Description random, Qty 1, Price 4, Origin United States, Tariff 4
    Then On Customs form, add associated Item 5, Description random, Qty 1, Price 5, Origin United States, Tariff 5
    Then On Customs form, add associated Item 6, Description random, Qty 1, Price 6, Origin United States, Tariff 6
    Then On Customs form, add associated Item 7, Description random, Qty 1, Price 7, Origin United States, Tariff 7
    Then On Customs form, add associated Item 8, Description random, Qty 1, Price 8, Origin United States, Tariff 8
    Then On Customs form, add associated Item 9, Description random, Qty 1, Price 9, Origin United States, Tariff 9
    Then On Customs form, add associated Item 10, Description random, Qty 1, Price 10, Origin United States, Tariff 10
    Then On Customs form, add associated Item 11, Description random, Qty 1, Price 11, Origin United States, Tariff 11
    Then On Customs form, add associated Item 12, Description random, Qty 1, Price 12, Origin United States, Tariff 12
    Then On Customs form, add associated Item 13, Description random, Qty 1, Price 13, Origin United States, Tariff 13
    Then On Customs form, add associated Item 14, Description random, Qty 1, Price 14, Origin United States, Tariff 14
    Then On Customs form, add associated Item 15, Description random, Qty 1, Price 15, Origin United States, Tariff 15
    Then On Customs form, add associated Item 16, Description random, Qty 1, Price 16, Origin United States, Tariff 16
    Then On Customs form, add associated Item 17, Description random, Qty 1, Price 17, Origin United States, Tariff 17
    Then On Customs form, add associated Item 18, Description random, Qty 1, Price 18, Origin United States, Tariff 18
    Then On Customs form, add associated Item 19, Description random, Qty 1, Price 19, Origin United States, Tariff 19
    Then On Customs form, add associated Item 20, Description random, Qty 1, Price 20, Origin United States, Tariff 20
    Then On Customs form, add associated Item 21, Description random, Qty 1, Price 21, Origin United States, Tariff 21
    Then On Customs form, add associated Item 22, Description random, Qty 1, Price 22, Origin United States, Tariff 22
    Then On Customs form, add associated Item 23, Description random, Qty 1, Price 23, Origin United States, Tariff 23
    Then On Customs form, add associated Item 24, Description random, Qty 1, Price 24, Origin United States, Tariff 24
    Then On Customs form, add associated Item 25, Description random, Qty 1, Price 25, Origin United States, Tariff 25
    Then On Customs form, add associated Item 26, Description random, Qty 1, Price 26, Origin United States, Tariff 26
    Then On Customs form, add associated Item 27, Description random, Qty 1, Price 27, Origin United States, Tariff 27
    Then On Customs form, add associated Item 28, Description random, Qty 1, Price 28, Origin United States, Tariff 28
    Then On Customs form, add associated Item 29, Description random, Qty 1, Price 29, Origin United States, Tariff 29
    Then On Customs form, add associated Item 30, Description random, Qty 1, Price 30, Origin United States, Tariff 30
    Then On Customs form, add associated Item 31, Description random, Qty 1, Price 30, Origin United States, Tariff 31
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then In Print modal, click Print button Sample
    Then In Print modal, click Print button
    Then Sign out
