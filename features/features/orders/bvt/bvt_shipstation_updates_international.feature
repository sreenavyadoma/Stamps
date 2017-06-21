
Feature:  Update International Orders to ShipStation

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation
    Then add new order
    Then blur out on Order Details form
    Then set Order Details Ship-To International address to
      | full_name          | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone         |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone  | Random email  |
    Then set Order Details form Weight to 2 lb 2 oz
    Then set Order Details form service to PMI Package
    Then set Order Details form Insure-For to $100.25
    Then set Order Details form Reference Number to Some random string
    Then on Order Details form, Add Item 1, Qty 1, ID ID 1, Description Description 1
    Then on Order Details form, Add Item 2, Qty 2, ID random string, Description random string
    Then on Order Details form, Add Item 3, Qty 3, ID ID 3, Description random string

    # Edit the customs form

    Then expect Orders Grid Recipient is correct
    Then expect Orders Grid Company is correct
    Then expect Orders Grid Country is correct
    Then expect Orders Grid Address is correct
    Then expect Orders Grid City is correct
    Then expect Orders Grid State is correct
    Then expect Orders Grid Zip is correct
    #Then expect Orders Grid Phone is correct
    #Then expect Orders Grid Email is correct

    Then expect Orders Grid Qty. is 6
    Then expect Orders Grid Item SKU is Multiple
    Then expect Orders Grid Item Name is Multiple

    Then expect Orders Grid service is Priority Mail International
    Then expect Orders Grid Pounds is correct
    Then expect Orders Grid Ounces is correct
    Then expect Order Details form Insure-For is correct
    Then expect Orders Grid Order Status is Awaiting Shipment

    Then Pause for 2 second
    Then Sign out



