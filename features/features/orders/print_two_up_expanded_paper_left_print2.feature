Feature: Print 2 Domestic labels on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_paper_left_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out
