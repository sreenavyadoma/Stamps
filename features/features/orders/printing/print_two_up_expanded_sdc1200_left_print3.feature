Feature: User Prints 3 Domestic labels on SDC-1200 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_sdc1200_left_print3
  Scenario: User Prints 3 Domestic labels on SDC-1200 - left side
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM Med FR Box, SDC-1200, 530 K Street Unit 504, San Diego CA 92101-7060
    Then set order details service to PM Medium Flat Rate Box
    Then set order details ounces to 1
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM Lg FR Box, SDC-1200, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then set order details service to PM Large Flat Rate Box
    Then set order details ounces to 1
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM RR Box A, SDC-1200, 4937 79th St., Sacramento CA 95820-6213
    Then set order details service to PM Regional Rate Box A
    Then set order details ounces to 1
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then check Orders Grid row 3
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button Sample
    Then click print modal print button
    Then pause for 6 seconds

    Then sign out
