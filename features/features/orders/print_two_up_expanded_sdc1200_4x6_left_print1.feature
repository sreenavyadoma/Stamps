Feature: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_sdc1200_4x6_left_print1
  Scenario: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to Domestic Address PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then on Order Details form, select service PM Package
    Then set Order Details form Weight to 1 lb 1 oz
    Then set Order Details form Dimensions to Length 1 Width 1 Height 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then set Print modal Printer to "factory"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then in Print modal, click Print button
    Then Sign out
