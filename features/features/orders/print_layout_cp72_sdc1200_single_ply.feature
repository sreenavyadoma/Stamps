Feature: Print 1 Intl CP72 label on sdc1200 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_sdc1200_single_ply
  Scenario: Print 1 Intl CP72 label on sdc1200 - right side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  sdc1200 Right Side 1  | random       | random           | random | random  | random      | Costa Rica | random  | random  |
    Then on Order Details form, select service PMEI Package
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select right-side label
    Then in Print modal, expect right-side label selected
    Then in Print modal, click Print button
    Then Sign out
