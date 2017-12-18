Feature: ORDERSAUTO-3405 New Sprint 11/22/17 WEBAPPS-6706 Split Order: Automatically Select New Order After Split

  Background:
    Given a valid user is signed in to Web Apps

  @split_order
  Scenario:  ORDERSAUTO-3405 New Sprint 11/22/17 WEBAPPS-6706 Split Order: Automatically Select New Order After Split
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then set Order Details form Pounds to 1

    Then on Order Details form, Add Item 1, Qty 3, ID itemone, Description first item
    Then on Order Details form, Add Item 2, Qty 5, ID itemtwo, Description second item

    Then select grid toolbar more actions item Split Order
    Then expect Split Order modal original order id is correct
    Then expect Split Order modal default new order id is correct
    Then expect item details in Split order Modal are correct
    Then set new order number to 12345
    Then set new order quantity for item 1 to 1
    Then set new order quantity for item 2 to 2

    Then confirm order split

    Then confirm new order is selected

    Then expect order details form Associated Item 1 Qty is 1
    Then expect order details form Associated Item 1 ID is itemone
    Then expect order details form Associated Item 1 Description Placeholder is first item

    Then expect order details form Associated Item 1 Qty is 2
    Then expect order details form Associated Item 1 ID is itemtwo
    Then expect order details form Associated Item 1 Description is second item

    Then check orders grid cached order ID

    Then expect order details form Associated Item 1 Qty is 2
    Then expect order details form Associated Item 1 ID is itemone
    Then expect order details form Associated Item 1 Description Placeholder is first item

    Then expect order details form Associated Item 1 Qty is 3
    Then expect order details form Associated Item 1 ID is itemtwo
    Then expect order details form Associated Item 1 Description is second item

    Then Sign out
