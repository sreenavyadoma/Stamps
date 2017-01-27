Feature: Print 1 Intl CN22 label on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cn22_roll
  Scenario: Print 1 Intl CN22 label on 4x6 Roll
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | FCMI PTE | 4x6 Roll  | random           | random           | random | random  | random      | Norway | random  | random  |
    Then On Order Details form, select service FCMI Package
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then In Print modal, click Print button
    Then Sign out


