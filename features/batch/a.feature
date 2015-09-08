Feature: B-01746 Order Pagination

  Background:
    Given I am signed in as a batch shipper webbatch_0009/password1

  Scenario 1: Overview

    Given User is signed in as a Batch User
    When Web Batch grid has multiple orders
    And system is processing a multiple-order print job
    Then orders that are included in the job are flagged as 'locked' until the print job completes

  Scenario 2: User Views 'Locked' Order(s) as Disabled in the Grid

    Given User is signed in as a Batch User
    When Web Batch grid has multiple orders
    And User selects multiple orders for printing
    And prints postage for those orders per existing behavior
    Then System flags the orders as 'locked' per existing behavior

  Scenario 2.1: User Views 'Locked' Order(s) as Disabled in the Grid | Master checkbox selection

    Given User is signed in as a Batch User
    When Web Batch grid has multiple orders
    And User selects multiple orders for printing
    And prints postage for those orders per existing behavior
    And User views these orders in the Grid
    Then System displays the order rows in the Grid as disabled
    And their visual style is changed as specified in §3
    And they cannot be selected by master checkbox selection

  Scenario 2.2: User Views 'Locked' Order(s) as Disabled in the Grid | shift-click selection

    Given User is signed in as a Batch User
    When Web Batch grid has multiple orders
    And User selects multiple orders for printing
    And prints postage for those orders per existing behavior
    And User views these orders in the Grid
    Then System displays the order rows in the Grid as disabled
    And their visual style is changed as specified in §3
    And they cannot be selected by shift-click selection

  Scenario 3: Disabled Row Style

    Given User is signed in as a Batch User
    When Web Batch grid has multiple orders
    And User selects multiple orders for printing
    And prints postage for those orders per existing behavior
    And User views these orders in the Grid
    Then System displays the order rows in the Grid as disabled
    And their border-style: solid
    And their border-color: rgb(190, 190, 190)
    And their background-color: rgb(190, 190, 190) !important
    And their opacity: 0.4
