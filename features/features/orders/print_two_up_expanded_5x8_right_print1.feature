Feature: User Prints 1 Domestic label on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_5x8_right_print1
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - right side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Print: Print
    Then Sign out


