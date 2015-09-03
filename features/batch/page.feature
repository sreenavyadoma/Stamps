@regression
Feature: B-01746 Order Pagination

  Background:
    Given I am signed in as a batch shipper webbatch_0009/password1

  @page_controls
  Scenario: Go to Next, Last, Previous and First Pages
    Then Expect page toolbar First Page is disabled
    Then Expect page toolbar Previous Page is disabled
    And Pagination control to go to next page is enabled
    Then User clicks next page pagination control
    And Pagination control to go to last page is enabled
    Then User clicks last page pagination control
    Then Expect page toolbar Next Page is disabled
    Then Expect page toolbar Last Page is disabled
    And Pagination control to go to previous page is enabled
    Then User clicks previous page pagination control
    And Pagination control to go to first page is enabled
    Then User clicks first page pagination control

  #@page_number_specified
  #Scenario: Go to Specific Page Number
    Then Expect page toolbar Page Number is enabled
    And Pagination control to go to page number is enabled
    Then Set Page Number to 2

    And Sign out



