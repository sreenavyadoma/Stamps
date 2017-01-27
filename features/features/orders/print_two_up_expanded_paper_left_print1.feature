Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_paper_left_print1
  Scenario: User Prints 1 Domestic label on 8.5x11 - left side

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out
