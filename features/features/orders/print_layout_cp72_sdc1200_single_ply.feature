Feature: Print 1 Intl CP72 label on sdc1200 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_sdc1200_single_ply
  Scenario: Print 1 Intl CP72 label on sdc1200 - right side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  sdc1200 Right Side 1  | random       | random           | random | random  | random      | Costa Rica | random  | random  |
    Then On Order Details form, select service PMEI Package
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select right-side label
    Then In Print modal, expect right-side label selected
    Then In Print modal, click Print button
    Then Sign out
