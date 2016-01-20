Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Prints 1 Domestic label on 8.5x11 - left side

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details - Set Ounces to 1
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out
