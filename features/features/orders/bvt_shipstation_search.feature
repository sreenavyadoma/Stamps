# Order: OrderNumber, ShipName, ShipCompany, Username, +BuyerEmail +OrderItem: SKU, Description
Feature:  Basic Search

  Background:
    Given I am signed in to Orders

  @bvt_shipstation_search
  Scenario: Search order

    # Search for New Order ID
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Set Email to random
    Then Details: Set Phone to random
    Then Details: Select Service PM Package
    Then Details: Set Weight to 1 lb 1 oz

    Then Grid: Uncheck Saved Order ID

    Then Pause for 3 seconds
    Then Refresh Browser
    Then Pause for 5 seconds

    # Search for new order
    Then Left Panel: Search saved Order ID
    Then Left Panel: Search Results should be present
    Then Left Panel: Search results count should be 1

    Then Grid: Check Saved Order ID
    Then Details: Expect Order ID equals Grid Oder ID in row 1
    Then Details: Expect Order ID is the same as saved Order ID

    Then Left Panel: Search results should be more than 0
    Then Left Panel: Remove search results
    Then Left Panel: Search Results should not be present

    Then Sign out


