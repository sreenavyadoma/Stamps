Feature: Print 1 single ply Intl CP72 label on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_layout_cp72_paper_single_ply
  Scenario: Print 1 single ply Intl CP72 label on 8.5x11 - left side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFRE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then Details: Select Service PMI Package
    Then Details: Set Ounces to 1
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to Document
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Print: Expect left-side label selected
    Then Print: Print Sample
    Then Print: Print
    Then Sign out
