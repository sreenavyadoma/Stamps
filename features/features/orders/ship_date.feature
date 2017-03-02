
Feature: Ship Date

  Background:
    Given a valid user is signed in to Web Apps

  @ship_date
  Scenario:  set Print modal Ship Date to today
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then in Orders Toolbar, click Print button
    Then set Print modal Ship Date to today
    Then In left Filter Panel, expect Shipped Tab Ship Date is today
    Then in Print modal, click Print button
    Then Sign out


  @ship_date
  Scenario:  set Print modal Ship Date to 1 day from today
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then in Orders Toolbar, click Print button
    Then set Print modal Ship Date to today plus 1
    Then set Print modal Ship Date to today plus 3
    Then in Print modal, click Print button
    Then Sign out


  @ship_date
  Scenario:  set Print modal Ship Date to 1 day from today
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then in Orders Toolbar, click Print button
    Then set Print modal Ship Date to today plus 2
    Then In left Filter Panel, expect Shipped Tab Ship Date is today plus 2
    Then in Print modal, click Print button
    Then Sign out


  @ship_date
  Scenario:  set Print modal Ship Date to 1 day from today
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then in Orders Toolbar, click Print button
    Then set Print modal Ship Date to today plus 3
    Then In left Filter Panel, expect Shipped Tab Ship Date is today plus 3
    Then in Print modal, click Print button
    Then Sign out


