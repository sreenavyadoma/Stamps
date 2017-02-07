Feature: User Prints 3 Domestic labels on SDC-1200 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_sdc1200_left_print3
  Scenario: User Prints 3 Domestic labels on SDC-1200 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM Med FR Box, SDC-1200, 530 K Street Unit 504, San Diego CA 92101-7060
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM Lg FR Box, SDC-1200, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM RR Box A, SDC-1200, 4937 79th St., Sacramento CA 95820-6213
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, set Ounces to 1
    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Grid, check row 3
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Pause for 6 seconds

    Then Sign out
