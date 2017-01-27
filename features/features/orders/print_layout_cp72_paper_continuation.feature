Feature: Print 1 Intl CP72 label with continuation on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_paper_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 8.5x11 - left side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then On Order Details form, select service PMI Flat Rate Envelope
    Then On Order Details form, set Weight to 1 lb 14 oz
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 1
    Then On Customs form, add associated Item 2, Description random, Qty 1, Price 1, Origin United States, Tariff 2
    Then On Customs form, add associated Item 3, Description random, Qty 1, Price 1, Origin United States, Tariff 3
    Then On Customs form, add associated Item 4, Description random, Qty 1, Price 1, Origin United States, Tariff 4
    Then On Customs form, add associated Item 5, Description random, Qty 1, Price 1, Origin United States, Tariff 5
    Then On Customs form, add associated Item 6, Description random, Qty 1, Price 1, Origin United States, Tariff 6
    Then On Customs form, add associated Item 7, Description random, Qty 1, Price 1, Origin United States, Tariff 7
    Then On Customs form, add associated Item 8, Description random, Qty 1, Price 1, Origin United States, Tariff 8
    Then On Customs form, add associated Item 9, Description random, Qty 1, Price 1, Origin United States, Tariff 9
    Then On Customs form, add associated Item 10, Description random, Qty 1, Price 1, Origin United States, Tariff 10
    Then On Customs form, add associated Item 11, Description random, Qty 1, Price 1, Origin United States, Tariff 11
    Then On Customs form, add associated Item 12, Description random, Qty 1, Price 1, Origin United States, Tariff 12
    Then On Customs form, add associated Item 13, Description random, Qty 1, Price 1, Origin United States, Tariff 13
    Then On Customs form, add associated Item 14, Description random, Qty 1, Price 1, Origin United States, Tariff 14
    Then On Customs form, add associated Item 15, Description random, Qty 1, Price 1, Origin United States, Tariff 15
    Then On Customs form, add associated Item 16, Description random, Qty 1, Price 1, Origin United States, Tariff 16
    Then On Customs form, add associated Item 17, Description random, Qty 1, Price 1, Origin United States, Tariff 17
    Then On Customs form, add associated Item 18, Description random, Qty 1, Price 1, Origin United States, Tariff 18
    Then On Customs form, add associated Item 19, Description random, Qty 1, Price 1, Origin United States, Tariff 19
    Then On Customs form, add associated Item 20, Description random, Qty 1, Price 1, Origin United States, Tariff 20
    Then On Customs form, add associated Item 21, Description random, Qty 1, Price 1, Origin United States, Tariff 21
    Then On Customs form, add associated Item 22, Description random, Qty 1, Price 1, Origin United States, Tariff 22
    Then On Customs form, add associated Item 23, Description random, Qty 1, Price 1, Origin United States, Tariff 23
    Then On Customs form, add associated Item 24, Description random, Qty 1, Price 1, Origin United States, Tariff 24
    Then On Customs form, add associated Item 25, Description random, Qty 1, Price 1, Origin United States, Tariff 25
    Then On Customs form, add associated Item 26, Description random, Qty 1, Price 1, Origin United States, Tariff 26
    Then On Customs form, add associated Item 27, Description random, Qty 1, Price 1, Origin United States, Tariff 27
    Then On Customs form, add associated Item 28, Description random, Qty 1, Price 1, Origin United States, Tariff 28
    Then On Customs form, add associated Item 29, Description random, Qty 1, Price 1, Origin United States, Tariff 29
    Then On Customs form, add associated Item 30, Description random, Qty 1, Price 1, Origin United States, Tariff 30
    Then Pause for 2 seconds
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then Pause for 2 seconds
    Then On Customs form, click Close button
    Then Pause for 2 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select left-side label
    Then In Print modal, expect left-side label selected
    Then In Print modal, click Print button Sample
    Then In Print modal, click Print button
    Then Sign out
