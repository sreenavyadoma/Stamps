Feature: in Print modal, click Print button Sample - Priority Mail Regional Rate Box A

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_pm_regional_rate_box_a
  Scenario:  Priority Mail Regional Rate Box A
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button Sample
    Then Sign out
