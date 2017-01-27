Feature: Print 1 single ply Intl CP72 label on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_paper_single_ply
  Scenario: Print 1 single ply Intl CP72 label on 8.5x11 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFRE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then on Order Details form, select service PMI Package
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Document
    Then on Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Sign out
