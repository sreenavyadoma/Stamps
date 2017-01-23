Feature: Print 2 Domestic labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_paper_left_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - left side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Ounces to 1
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Set Ounces to 1
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select left-side label
    Then Print Modal: Expect left-side label selected
    Then Print Modal: Print
    Then Sign out
