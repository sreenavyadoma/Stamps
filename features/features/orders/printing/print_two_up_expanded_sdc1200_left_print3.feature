Feature: User Prints 3 Domestic labels on SDC-1200 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_sdc1200_left_print3
  Scenario: User Prints 3 Domestic labels on SDC-1200 - left side
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM Med FR Box, SDC-1200, 530 K Street Unit 504, San Diego CA 92101-7060
    Then set Order Details form service to PM Medium Flat Rate Box
    Then set Order Details form Ounces to 1
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM Lg FR Box, SDC-1200, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then set Order Details form service to PM Large Flat Rate Box
    Then set Order Details form Ounces to 1
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM RR Box A, SDC-1200, 4937 79th St., Sacramento CA 95820-6213
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Ounces to 1
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then check Orders Grid row 3
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Pause for 6 seconds

    Then Sign out
