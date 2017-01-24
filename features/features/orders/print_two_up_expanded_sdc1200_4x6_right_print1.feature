Feature: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾" right side

  Background:
    Given A user is signed in to Orders

  @print_two_up_expanded_sdc1200_4x6_right_print1
  Scenario: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾" right side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Weight to 1 lb 1 oz
    Then On Order Details form, set Dimensions to Length 1 Width 1 Height 1
    Then On Order Details form, set Insure-For to $1.09
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then In Print modal, set Printer to "Designer"
    Then In Print modal, select right-side label
    Then In Print modal, expect right-side label selected
    Then In Print modal, click Print button
    Then Sign out
