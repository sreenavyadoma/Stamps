Feature: Print 2 Domestic labels on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded @print_two_up_expanded_5x8
  Scenario: Print 2 Domestic labels on 5.5x8.5 - left side
    # 2 Domestic labels 5 ½" x 8 ½"
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to PS Large Package, 5.5x8.5, 530 K Street Unit 504, San Diego CA 92101-7060
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Ounces to 1
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to PS Large Package, 5.5x8.5, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Ounces to 1
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print
    Then Sign out
