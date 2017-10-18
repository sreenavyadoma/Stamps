Feature: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cn22_5x8_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name      | company            | street_address_1 | street_address_2 | city   | province| postal_code | country     | phone   |  email  |
      | PMEI PFTE |  5.5x8.5 Left Side | random           | random           | random | random  | random      | Philippines | random  | random  |
    Then set Order Details form service to PMEI Package
    Then set Order Details form Weight to 2 lb 0 oz

    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Gift
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 2, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 3, Description random, Qty 1, Price 1, Made In United States, Tariff 3
    Then add Customs form Associated Item 4, Description random, Qty 1, Price 2, Made In United States, Tariff 4
    Then add Customs form Associated Item 5, Description random, Qty 1, Price 3, Made In United States, Tariff 5
    Then add Customs form Associated Item 6, Description random, Qty 1, Price 1, Made In United States, Tariff 6
    Then add Customs form Associated Item 7, Description random, Qty 1, Price 2, Made In United States, Tariff 7
    Then add Customs form Associated Item 8, Description random, Qty 1, Price 1, Made In United States, Tariff 8
    Then add Customs form Associated Item 9, Description random, Qty 1, Price 1, Made In United States, Tariff 9
    Then add Customs form Associated Item 10, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 11, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 12, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 13, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 14, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 15, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 16, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 17, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 18, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 19, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 20, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 21, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 22, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 23, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 24, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 25, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 26, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 27, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 28, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 29, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 30, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then add Customs form Associated Item 31, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then add Customs form Associated Item 32, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then Pause for 4 seconds
    Then set Customs form ITN Number to random
    Then Pause for 4 seconds
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then Pause for 2 seconds
    Then close Customs Information form

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

    Then Sign out
