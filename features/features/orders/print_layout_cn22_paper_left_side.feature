Feature: Print 2 Intl CN22 labels on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cn22_paper_left_side
  Scenario: Print 2 Intl CN22 labels on 8.5x11 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Left Side | random           | random           | random | random  | random      | Germany | random  | random  |
    Then on Order Details form, select service PMI Padded Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 2, Made In United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Add button

    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side | random           | random           | random | random  | random      | Mexico | random  | random  |
    Then on Order Details form, select service PMI Legal Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 2, Made In United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button

    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out
