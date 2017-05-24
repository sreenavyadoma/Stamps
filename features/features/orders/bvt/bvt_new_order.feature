Feature:  BVT Order Creation

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_new_order
  Scenario:  Add a new order
    Then add new order
    Then set Order Details form Ship-To to random address between zone 9
    Then set Order Details form service to PM Package
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1
    Then set Order Details form Insure-For to $1.00
    Then set Order Details form Length to 1
    Then set Order Details form Width to 1
    Then set Order Details form Height to 1
    # Orders Grid Operations
    Then uncheck Orders Grid row 1
    Then expect Orders Grid Pounds is 1
    Then expect Orders Grid Ounces is 1
    Then expect Orders Grid Weight is 1 lb. 1 oz.
    Then expect Orders Grid Insured Value is $1.00
    Then Sign out
