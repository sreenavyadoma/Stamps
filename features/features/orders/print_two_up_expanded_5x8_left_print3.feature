Feature: Print 3 Domestic labels on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_5x8_left_print3
  Scenario: Print 3 Domestic labels on 5.5x8.5 - left side

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address text area to FCM Lg Env-Flat, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Set Ounces to 1
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address text area to PM Lg-Thick Env, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Ounces to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address text area to FCM Pkg-Thick Env, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Details: Select Service First-Class Mail Package/Thick Envelope
    Then Details: Set Ounces to 1
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Print: Expect left-side label selected
    Then Print: Print
    Then Sign out
