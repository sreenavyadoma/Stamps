Feature: User Prints 1 Domestic label on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - right side
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then Order Details - Set Service to "Parcel Select Ground Package"
    Then Order Details - Set Ounces to 1
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Select right-side label
    Then Expect Print Modal right-side label selected
    Then Print
    Then Sign out


