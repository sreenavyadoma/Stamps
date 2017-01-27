Feature: Print 2 Domestic labels on 5.5x8.5 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8_right_print2
  Scenario: Print 2 Domestic labels on 5.5x8.5 - right side
    # 2 Domestic labels 5 ½" x 8 ½" right side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Ounces to 1
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PM Large Package, 5.5x8.5 Right Side 1, 26930 NE 152nd St., Duvall WA 98019-8316
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, set Dimensions to Length 1 Width 1 Height 1
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select right-side label
    Then In Print modal, expect right-side label selected
    Then In Print modal, click Print button
    Then Sign out


