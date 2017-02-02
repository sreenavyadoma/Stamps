Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_cp72_paper_left_print3
  Scenario: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PME FR Envelope, 5.5x8.5, 26930 NE 152nd St., Duvall WA 98019-8316
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PME LFR Envelope, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PME PFR Envelope, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Box | 5.5x8.5  | random           | random           | random | random  | random      | Spain | random  | random  |
    Then on Order Details form, select service PMI Large Flat Rate Box
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI Pkg-Flat-Env | 5.5x8.5 | random           | random           | random | random  | random      | Turkey | random  | random  |
    Then on Order Details form, select service PMEI Package
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI FR Envelope | 5.5x8.5 | random           | random           | random | random  | random      | Argentina | random  | random  |
    Then on Order Details form, select service PMEI Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Grid, check row 3
    Then In Orders Grid, check row 4
    Then In Orders Grid, check row 5
    Then In Orders Grid, check row 6
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out
