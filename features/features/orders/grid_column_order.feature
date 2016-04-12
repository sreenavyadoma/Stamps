Feature: "Country" grid column should appear to left of "Address" column by default

  Background:
    Given I am signed in to Orders

  @grid_column_order
  Scenario: Column Order
    Then Grid: Expect Column Country appears to left of Address