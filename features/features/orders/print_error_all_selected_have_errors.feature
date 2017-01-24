
Feature:  Prompt User to Remove Orders in Error from Print Group

  Background:
    Given A user is signed in to Orders

  @printing_error
  Scenario:  Printing
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then In Orders Grid, check row 1
    Then Print expecting error A service must be selected before printing.

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then Print expecting error All selected orders have errors and cannot be printed.

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Regional Rate Box A
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    Then Sign out
