Feature: Print 2 Domestic labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_paper_left_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - left side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Ounces to 1
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Set Ounces to 1
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Print: Print
    Then Sign out
