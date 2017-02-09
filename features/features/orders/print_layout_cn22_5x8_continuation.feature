Feature: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cn22_5x8_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name      | company            | street_address_1 | street_address_2 | city   | province| postal_code | country     | phone   |  email  |
      | PMEI PFTE |  5.5x8.5 Left Side | random           | random           | random | random  | random      | Philippines | random  | random  |
    Then on Order Details form, select service PMEI Package
    Then on Order Details form, set Weight to 2 lb 0 oz

    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Gift
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 2, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 3, Description random, Qty 1, Price 1, Made In United States, Tariff 3
    Then on Customs form, add Associated Item 4, Description random, Qty 1, Price 2, Made In United States, Tariff 4
    Then on Customs form, add Associated Item 5, Description random, Qty 1, Price 3, Made In United States, Tariff 5
    Then on Customs form, add Associated Item 6, Description random, Qty 1, Price 1, Made In United States, Tariff 6
    Then on Customs form, add Associated Item 7, Description random, Qty 1, Price 2, Made In United States, Tariff 7
    Then on Customs form, add Associated Item 8, Description random, Qty 1, Price 1, Made In United States, Tariff 8
    Then on Customs form, add Associated Item 9, Description random, Qty 1, Price 1, Made In United States, Tariff 9
    Then on Customs form, add Associated Item 10, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 11, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 12, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 13, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 14, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 15, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 16, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 17, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 18, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 19, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 20, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 21, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 22, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 23, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 24, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 25, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 26, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 27, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 28, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 29, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 30, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then on Customs form, add Associated Item 31, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then on Customs form, add Associated Item 32, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then Pause for 4 seconds
    Then on Customs form, set ITN Number to "random"
    Then Pause for 4 seconds
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then Pause for 2 seconds
    Then on Customs form, click Close button

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button

    Then Sign out
