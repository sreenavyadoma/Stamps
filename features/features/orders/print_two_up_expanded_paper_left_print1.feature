Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_paper_left_print1
  Scenario: User Prints 1 Domestic label on 8.5x11 - left side

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address text area to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Print: Expect left-side label selected
    Then Print: Print
    Then Sign out
