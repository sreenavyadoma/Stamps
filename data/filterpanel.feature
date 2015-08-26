Feature: As a batch shipper, I want to be able to filter orders by status [B-01621]

  Background:
    Given I am signed in as a Batch user

  Scenario: User Views Filter Panel
    * User views the Orders tab
    * System displays expanded filters panel.
    * System displays "Awaiting Shipment" and "Shipped" filters in panel.
    * System selects the "Awaiting Shipment" filter by default.


  Scenario: User closes filters panel
    *	Filters panel is in the Open state
    *	User clicks on the Filters panel border arrow or double clicks on the Filters panel border
    *	Expect system closes Filters panel
    *	Expect system shows name of current Order Status filter in closed panel
    *	Expect system shows an arrow next to the Order Status filter name pointing to the open position
    *	Expect system changes the panel arrow so that it is pointing to the open position
    *	Expect system saves the change as default for all future sessions

  Scenario: User opens Filters panel
    *	Filters panel is in the Closed state
    *	User clicks on the Filters panel header arrow, Filters panel border arrow, or double clicks on the Filters panel border
    *	Expect system opens the Filters panel
    *	Expect system hides the header arrow and Order Status filter name and changes the panel border arrow so that it is pointing to the closed position
    *	Expect system saves the change as default for all future sessions

  Scenario: User clicks on Filters panel when it is closed
    *	Filters panel is in the Closed state
    *	User single clicks on the Filters panel (not on the arrows)
    *	Expect System opens the Filters panel
    *	Expect user’s mouse is hovering over Filters panel and system keeps panel open
    *	Expect user hovers off Filters panel for 3 seconds (without hovering back over the panel) and system closes Filters panel

  Scenario: User resizes Filters panel
    *	Filters panel is in the Open state
    *	User hovers over the Filters panel right panel border.
    *	Expect system changes cursor to show that panel size can be increased or decreased
    *	User clicks on panel border, holds mouse button down, and moves cursor to desired location
    *	User releases mouse
    *	Expect system changes panel width to cursor location while respecting min and max values
    *	Expect system saves the change as default for all future sessions

  Scenario: User Changes filters
    * User clicks on a filter in the Filters panel other than the currently-selected filter.
    * Expect system selects the new filter and deselects the previous filter.
    * Expect system updates the grid to show only orders which match the selected filter.
    * Expect system shows or hides "Print" button in control ribbon based on the new filter: a. Awaiting Shipment: Show "Print" button. b. Shipped: Hide "Print" button.

  Scenario: Pagination on Per-Filter Basis
    * User clicks to open a filter
    * Expect Pagination in the grid should be scoped to the active filter
    * Expect that in the Shipped view the pagination controls reflect the number of Shipped records in the grid.

  Scenario: User views Order Status filters
    *	User or system sets Filters panel to open
    *	Expect system shows all Order Status filters including: Awaiting Shipment, Shipped , Cancelled
    * 	Expect system highlights the currently-selected Order Status filter
    *	Expect if  hovers over an Order Status filter that is not selected, it is also highlighted

  Scenario: User views search field
    *	User or system opens the Filters panel
    * 	Expect system shows Search field
    *	Expect system shows “Search Orders” label within search field
    *	Expect system shows disabled magnifying glass button within search field
    *	User clicks into the search field
    *	Expect system still shows “Search Orders” label within search field
    *	Expect system still shows disabled magnifying glass button within search field
    *	User types one or more characters into the Search field
    *	Expect system hides the “Search Orders” label within the search field
    *	Expect system enables the magnifying glass button within search field

  Scenario: User Searches for Orders
    *	User views Search field  and enters one or more characters
    *	User clicks the magnifying glass in the Search text field or presses the Enter key
    *	Expect system searches for a match to the search query in all fields for all orders for all statuses.
    *	Expect system creates a new Order Status filter named “Search Results”
    *	Expect system shows the number of orders that match the search query next to the filter name.
    *	Expect system shows an “X” button to the left of the “Search Results” text in the Status Filter.
    *	Expect system sets “Search Results” as the active Status Filter
    *	Expect system updates orders shown in grid to match the search query.
    *	Expect By default, System groups orders by the “Order Status” column
    *   Expect the user can override this default by changing the group by column

  Scenario: User clears Search
    *	User searches for an order
    *	User clicks on the “X” in the “Search Results” Order Status Filter.
    *	Expect system clears text in Search field and shows “Search Orders” placeholder text within search field.
    *	Expect system shows disabled magnifying glass button within search field.
    *	Expect system sets “Awaiting Shipment” as the active Order Status Filter

  Scenario: User Changes Active Status Filter While Viewing Search Results
    *	User searches for an order
    *	User clicks on an Order Status Filter other than “Search Results” a
    *	Expect system clears text in Search field and shows “Search Orders” placeholder text within search field.
    *	Expect system shows disabled magnifying glass button within search field.

