Feature: As a batch shipper, I want to be able to filter orders by status [B-01621]

  Background:
    Given I am signed in as batch shipper auto_paginate/password1




  Scenario: User Views Filter Panel Default
    When Expect system displays expanded filters panel

    Then Filter Shipped Orders
    And Expect system selects Shipped Filter and deselects the previous filter

    Then Set paging toolbar orders per page count to 500
    Then Expect number of orders on page to be correct
    Then Expect Total Number of Pages to be 2
    Then Set paging toolbar orders per page count to 250
    Then Expect Total Number of Pages to be 3
    Then Expect number of orders on page to be correct
    Then Set paging toolbar orders per page count to 100
    Then Expect Total Number of Pages to be 6
    Then Expect number of orders on page to be correct

    Then cli

    Then Sign out