Feature: Print 3 Domestic labels on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_5x8_left_print3
  Scenario: Print 3 Domestic labels on 5.5x8.5 - left side

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address FCM Lg Env-Flat, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Set Ounces to 1
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PM Lg-Thick Env, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Length to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address FCM Pkg-Thick Env, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Order Details: Select Service First-Class Mail Package/Thick Envelope
    Then Order Details: Set Ounces to 1
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Orders Grid: Check row 3
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select left-side label
    Then Print Modal: Expect left-side label selected
    Then Print Modal: Print
    Then Sign out
