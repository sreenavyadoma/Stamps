
Feature: Ship Date

  Background:
    Given a valid user is signed in to Web Apps

  @ship_date
  Scenario:  In Print modal, set Ship Date to today
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Ship Date to today
    Then In left filter panel, expect Shipped Tab Ship Date is today
    Then In Print modal, click Print button
    Then Sign out


  @ship_date
  Scenario:  In Print modal, set Ship Date to 1 day from today
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Ship Date to today plus 1
    Then In Print modal, set Ship Date to today plus 3
    Then In Print modal, click Print button
    Then Sign out


  @ship_date
  Scenario:  In Print modal, set Ship Date to 1 day from today
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Ship Date to today plus 2
    Then In left filter panel, expect Shipped Tab Ship Date is today plus 2
    Then In Print modal, click Print button
    Then Sign out


  @ship_date
  Scenario:  In Print modal, set Ship Date to 1 day from today
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Ship Date to today plus 3
    Then In left filter panel, expect Shipped Tab Ship Date is today plus 3
    Then In Print modal, click Print button
    Then Sign out


