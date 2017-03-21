Feature: Print 2 Domestic labels on 5.5x8.5 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8_right_print2
  Scenario: Print 2 Domestic labels on 5.5x8.5 - right side
    # 2 Domestic labels 5 ½" x 8 ½" right side
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then set Order Details form service to MM Package
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM Large Package, 5.5x8.5 Right Side 1, 26930 NE 152nd St., Duvall WA 98019-8316
    Then set Order Details form service to PM Large Package
    Then set Order Details form Ounces to 1
    Then set Order Details form Dimensions to Length 1 Width 1 Height 1
    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then in Print modal, click Print button
    Then Sign out


