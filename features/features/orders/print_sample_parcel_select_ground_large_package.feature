Feature: In Print modal, click Print button Sample - Parcel Select Ground Large Package

  Background:
    Given A user is signed in to Orders

  @print_sample_parcel_select_ground_large_package
  Scenario:  Parcel Select Ground Large Package
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Ounces to 1
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button Sample
    Then Sign out