Feature: Print 1 Intl CP72 label on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_5x8_left
  Scenario: Print 1 Intl CP72 label on 5.5x8.5 - left side
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | Chile | random  | random  |
    Then set Order Details form service to PMI Package
    Then set Order Details form Ounces to 1

    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then in Print modal, click Print button

    Then Sign out