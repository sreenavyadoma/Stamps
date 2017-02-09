Feature: Print 1 Intl CP72 label with continuation on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_paper_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 8.5x11 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then on Order Details form, select service PMI Flat Rate Envelope
    Then on Order Details form, set Weight to 1 lb 14 oz
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then on Customs form, add Associated Item 2, Description random, Qty 1, Price 1, Made In United States, Tariff 2
    Then on Customs form, add Associated Item 3, Description random, Qty 1, Price 1, Made In United States, Tariff 3
    Then on Customs form, add Associated Item 4, Description random, Qty 1, Price 1, Made In United States, Tariff 4
    Then on Customs form, add Associated Item 5, Description random, Qty 1, Price 1, Made In United States, Tariff 5
    Then on Customs form, add Associated Item 6, Description random, Qty 1, Price 1, Made In United States, Tariff 6
    Then on Customs form, add Associated Item 7, Description random, Qty 1, Price 1, Made In United States, Tariff 7
    Then on Customs form, add Associated Item 8, Description random, Qty 1, Price 1, Made In United States, Tariff 8
    Then on Customs form, add Associated Item 9, Description random, Qty 1, Price 1, Made In United States, Tariff 9
    Then on Customs form, add Associated Item 10, Description random, Qty 1, Price 1, Made In United States, Tariff 10
    Then on Customs form, add Associated Item 11, Description random, Qty 1, Price 1, Made In United States, Tariff 11
    Then on Customs form, add Associated Item 12, Description random, Qty 1, Price 1, Made In United States, Tariff 12
    Then on Customs form, add Associated Item 13, Description random, Qty 1, Price 1, Made In United States, Tariff 13
    Then on Customs form, add Associated Item 14, Description random, Qty 1, Price 1, Made In United States, Tariff 14
    Then on Customs form, add Associated Item 15, Description random, Qty 1, Price 1, Made In United States, Tariff 15
    Then on Customs form, add Associated Item 16, Description random, Qty 1, Price 1, Made In United States, Tariff 16
    Then on Customs form, add Associated Item 17, Description random, Qty 1, Price 1, Made In United States, Tariff 17
    Then on Customs form, add Associated Item 18, Description random, Qty 1, Price 1, Made In United States, Tariff 18
    Then on Customs form, add Associated Item 19, Description random, Qty 1, Price 1, Made In United States, Tariff 19
    Then on Customs form, add Associated Item 20, Description random, Qty 1, Price 1, Made In United States, Tariff 20
    Then on Customs form, add Associated Item 21, Description random, Qty 1, Price 1, Made In United States, Tariff 21
    Then on Customs form, add Associated Item 22, Description random, Qty 1, Price 1, Made In United States, Tariff 22
    Then on Customs form, add Associated Item 23, Description random, Qty 1, Price 1, Made In United States, Tariff 23
    Then on Customs form, add Associated Item 24, Description random, Qty 1, Price 1, Made In United States, Tariff 24
    Then on Customs form, add Associated Item 25, Description random, Qty 1, Price 1, Made In United States, Tariff 25
    Then on Customs form, add Associated Item 26, Description random, Qty 1, Price 1, Made In United States, Tariff 26
    Then on Customs form, add Associated Item 27, Description random, Qty 1, Price 1, Made In United States, Tariff 27
    Then on Customs form, add Associated Item 28, Description random, Qty 1, Price 1, Made In United States, Tariff 28
    Then on Customs form, add Associated Item 29, Description random, Qty 1, Price 1, Made In United States, Tariff 29
    Then on Customs form, add Associated Item 30, Description random, Qty 1, Price 1, Made In United States, Tariff 30
    Then Pause for 2 seconds
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then Pause for 2 seconds
    Then on Customs form, click Close button
    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Sign out
