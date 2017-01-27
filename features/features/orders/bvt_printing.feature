@bvt
Feature:  BVT Printing

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_printing
  Scenario:  Printing
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 5 through 8
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Height to 1
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then Sign out

