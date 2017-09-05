# Order: OrderNumber, ShipName, ShipCompany, Username, +BuyerEmail +OrderItem: SKU, Description
Feature:  Basic Search

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_search
  Scenario: Search order
    Then add new order
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form Email to random
    Then set Order Details form Phone to random
    Then set Order Details form service to PM Package
    Then set Order Details form Weight to 1 lb 1 oz

    Then uncheck Orders Grid for cached Order ID

    Then Pause for 3 seconds
    Then Refresh the browser
    Then Pause for 5 seconds

    # Search for new order
    Then check Orders Grid for cached Order ID
    Then search filtered Orders for cached Order ID
    Then Filter Panel: Search Results should be present
    Then expect Filter Panel search result count is 1

    #Then check Orders Grid for cached Order ID
    Then expect Order Details form Order ID equals Grid Oder ID in row 1
    Then expect Order Details form Order ID is the same as saved Order ID

    Then expect Filter Panel search result count is greater than 0
    Then Filter Panel: Remove search results
    Then Filter Panel: Search Results should not be present

    Then Sign out


