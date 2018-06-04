Feature:  BVT tests for Orders

  Background:
    Given Start test driver

  @bvt_bulk_update
  Scenario: BVT Bulk Update International
    Then sign-in to orders
  # Order #1 (Domestic)
    Then in Orders Grid, Sort Order Date in Descending Order
    Then add order 1
    Then blur out on order details form
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then blur out on order details form

#  # Order #2 (International)
    Then add order 2
    Then blur out on order details form
    Then set order details ship-to international address to
      | full_name     | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone        |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone | Random email  |
    Then set order details weight to 0 lb 1 oz
    Then set order details service to PMEI Package/Flat/Thick Envelope
    Then blur out on order details form

#  Check 1st two orders
    When check orders grid row 1
    When check orders grid row 2

  # Updating order details
    Then expect bulk update is present
    Then set bulk update domestic service to PM Large Package
    Then set bulk update international service to PMI Package/Flat/Thick Envelope
    Then check bulk update weight
    Then set bulk update pounds to 0
    Then set bulk update ounces to 3
    Then click bulk update update order button
    Then wait until orders available

#  # Uncheck both orders
    When uncheck orders grid row 1
    When uncheck orders grid row 2

#  # verify fields in 1st order
    When check orders grid row 2
    Then expect Order Details service is PM Large Package
    Then expect order details pound is 0
    Then expect order details ounce is 3
    When uncheck orders grid row 2

#  # verify fields in 2nd order
    When check orders grid row 1
    Then expect order details international service is PMI Package/Flat/Thick Envelope
    Then expect order details pound is 0
    Then expect order details ounce is 3
    Then sign out