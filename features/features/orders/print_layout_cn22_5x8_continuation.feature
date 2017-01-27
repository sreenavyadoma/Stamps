Feature: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cn22_5x8_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name      | company            | street_address_1 | street_address_2 | city   | province| postal_code | country     | phone   |  email  |
      | PMEI PFTE |  5.5x8.5 Left Side | random           | random           | random | random  | random      | Philippines | random  | random  |
    Then On Order Details form, select service PMEI Package
    Then On Order Details form, set Weight to 2 lb 0 oz

    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Gift
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 2, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 3, Description random, Qty 1, Price 1, Origin United States, Tariff 3
    Then On Customs form, add associated Item 4, Description random, Qty 1, Price 2, Origin United States, Tariff 4
    Then On Customs form, add associated Item 5, Description random, Qty 1, Price 3, Origin United States, Tariff 5
    Then On Customs form, add associated Item 6, Description random, Qty 1, Price 1, Origin United States, Tariff 6
    Then On Customs form, add associated Item 7, Description random, Qty 1, Price 2, Origin United States, Tariff 7
    Then On Customs form, add associated Item 8, Description random, Qty 1, Price 1, Origin United States, Tariff 8
    Then On Customs form, add associated Item 9, Description random, Qty 1, Price 1, Origin United States, Tariff 9
    Then On Customs form, add associated Item 10, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 11, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 12, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 13, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 14, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 15, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 16, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 17, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 18, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 19, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 20, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 21, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 22, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 23, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 24, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 25, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 26, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 27, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 28, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 29, Description random, Qty 1, Price 2, Origin United States, Tariff 2
    Then On Customs form, add associated Item 30, Description random, Qty 1, Price 3, Origin United States, Tariff 3
    Then On Customs form, add associated Item 31, Description random, Qty 1, Price 3, Origin United States, Tariff 3
    Then On Customs form, add associated Item 32, Description random, Qty 1, Price 3, Origin United States, Tariff 3
    Then Pause for 4 seconds
    Then On Customs form, set ITN Number to "random"
    Then Pause for 4 seconds
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then Pause for 2 seconds
    Then On Customs form, click Close button

    Then Pause for 2 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select left-side label
    Then In Print modal, expect left-side label selected
    Then In Print modal, click Print button

    Then Sign out
