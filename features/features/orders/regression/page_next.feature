@regression
Feature: Order Pagination

  Background:
    Given a valid user is signed in to Web Apps

  @page_next
  Scenario: Go to next page

    Then Sign out
