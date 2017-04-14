Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_paper
  Scenario: User Prints 1 Domestic label on 8.5x11

    #print_two_up_expanded_paper_left_print1
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then in Print modal, click Print button

   #print_two_up_expanded_paper_left_print2
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then in Print modal, click Print button

   #print_two_up_expanded_paper_right_print2
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM LFR Envelope, 8.5x11 Right Side 2, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM SFR Box, 8.5x11 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then set Order Details form service to PM Small Flat Rate Box
    Then set Order Details form Ounces to 3
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then in Print modal, click Print button

    Then Sign out
