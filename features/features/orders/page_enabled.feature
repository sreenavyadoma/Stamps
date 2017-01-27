Feature: B-01746 Order Pagination

  Background:
    Given a valid user is signed in to Web Apps

  @page_enabled
  Scenario: Number of orders is > 'number of orders per page' pagination control

    Then Sign out
