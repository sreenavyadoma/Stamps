Feature: Multiple Reprints

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_reprints
  Scenario: Multiple reprints in 24 hour period

    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to MM Package/Flat/Thick Envelope, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then set order details service to MM Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then In Orders Grid, Sort Order Date in Descending Order
    Then pause for 2 seconds
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint
    Then select Filter Panel tab Shipped
    Then pause for 2 seconds
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then sign out