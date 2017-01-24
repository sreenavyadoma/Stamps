Feature: Print 2 Domestic labels on 8.5x11 - left side

  Background:
    Given A user is signed in to Orders

  @print_two_up_expanded_paper_left_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - left side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Ounces to 1
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then On Order Details form, select service PM Padded Flat Rate Envelope
    Then On Order Details form, set Ounces to 1
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select left-side label
    Then In Print modal, expect left-side label selected
    Then In Print modal, click Print button
    Then Sign out
