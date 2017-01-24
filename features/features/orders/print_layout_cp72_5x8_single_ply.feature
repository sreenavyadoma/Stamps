Feature: Print 1 Intl CP72 label on 5.5x8.5 - left side

  Background:
    Given A user is signed in to Orders

  @print_layout_cp72_5x8_single_ply
  Scenario: Print 1 single ply Intl CP72 label on 5.5x8.5 - left side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFRB |  5.5x8.5 Left Side | random       | random           | random | random  | random      | Australia | random  | random  |
    Then On Order Details form, select service PMI Large Flat Rate Box
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Gift
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select left-side label
    Then In Print modal, expect left-side label selected
    Then In Print modal, click Print button
    Then Sign out
