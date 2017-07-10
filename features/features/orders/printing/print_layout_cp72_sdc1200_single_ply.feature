Feature: Print 1 Intl CP72 label on sdc1200 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_sdc1200_single_ply
  Scenario: Print 1 Intl CP72 label on sdc1200 - right side
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  sdc1200 Right Side 1  | random       | random           | random | random  | random      | Costa Rica | random  | random  |
    Then set Order Details form service to PMEI Package
    Then set Order Details form Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then set Print modal Printer to "factory"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button
    Then Sign out
