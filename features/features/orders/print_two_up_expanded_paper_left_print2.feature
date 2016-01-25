Feature: Print 2 Domestic labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 2 Domestic labels on 8.5x11 - left side
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Ounces to 1
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Set Ounces to 1
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print
    Then Sign out
