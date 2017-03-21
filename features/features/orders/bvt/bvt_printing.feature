@bvt
Feature:  BVT Printing

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_printing
  Scenario:  Printing
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then set Order Details form Width to 1
    Then set Order Details form Length to 1
    Then set Order Details form Height to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then in Print modal, click Print button
    Then Sign out

