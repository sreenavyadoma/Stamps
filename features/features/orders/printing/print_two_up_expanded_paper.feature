
@print_two_up_expanded_paper
Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_paper_left_print1
  Scenario: User Prints 1 Domestic label left

    #print_two_up_expanded_paper_left_print1
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details service to PM Flat Rate Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

  @print_two_up_expanded_paper_left_print2
  Scenario: User Prints 2 Domestic label left

   #print_two_up_expanded_paper_left_print2
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then set order details service to PM Flat Rate Envelope
    Then set order details ounces to 1
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then set order details service to PM Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then check row 1
    Then check row 2
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

  @print_two_up_expanded_paper_left_print2
  Scenario: User Prints 2 Domestic label right

   #print_two_up_expanded_paper_right_print2
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM LFR Envelope, 8.5x11 Right Side 2, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then set order details service to PM Legal Flat Rate Envelope
    Then set order details ounces to 1
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM SFR Box, 8.5x11 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then set order details service to PM Small Flat Rate Box
    Then set order details ounces to 3
    Then check row 1
    Then check row 2
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    Then sign out
