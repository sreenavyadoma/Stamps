Feature: As a batch shipper, I want to be able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in as a Batch user

  Scenario: User Views Filter Panel - Panel
    * User views the Orders tab
    * System displays expanded filters panel.
    * System displays "Awaiting Shipment" and "Shipped" filters in panel.
    * System selects the "Awaiting Shipment" Filter Panel - by default.
    Then Sign out
