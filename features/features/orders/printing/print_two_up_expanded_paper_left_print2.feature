Feature: Print 2 Domestic labels on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_paper_left_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - left side
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to Domestic Address PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then on Order Details form, select service PM Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to Domestic Address PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then in Print modal, click Print button
    Then Sign out
