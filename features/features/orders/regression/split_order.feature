Feature: ORDERSAUTO-3405 New Sprint 11/22/17 WEBAPPS-6706 Split Order: Automatically Select New Order After Split

  Background:
    Given a valid user is signed in to Web Apps

  @split_order
  Scenario:  ORDERSAUTO-3405 New Sprint 11/22/17 WEBAPPS-6706 Split Order: Automatically Select New Order After Split
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Domestic address to
      | full_name       | company  | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Split Order | Stamps  | 1990 E Grand Ave  | El Segundo | CA    | 90245 | United States |  |   |
    Then set order details form Phone to 4445554444
    Then set order details form Email to rtest@stamps.com
    Then set Order Details form service to PM Package
    Then set Order Details form Pounds to 1

    Then on Order Details form, Add Item 1, Qty 3, ID IDone, Description description 1
    Then on Order Details form, Add Item 2, Qty 5, ID IDtwo, Description description 2

    Then select grid toolbar more actions item Split Order
    Then expect Split Order modal original order id is correct
    Then expect Split Order modal default new order id is correct
    Then expect item details in Split order Modal are correct
    Then set Split Order new order number to random
    Then set Split Order new order quantity for item 1 to 1
    Then set Split Order new order quantity for item 2 to 2

    Then click Split Order modal confirm button

    Then expect new order from Split Order modal is selected in orders grid
    Then expect Order Details ship-to Name is Split Order
    Then expect Order Details ship-to Company Name is Stamps
    Then expect Order Details Ship-To Cleansed Street Address is 1990 E Grand Ave
    Then expect Order Details Ship-To Cleansed City is El Segundo
    Then expect Order Details Ship-To Cleansed State is CA
    Then expect Order Details Ship-To Cleansed Zip Plus 4 Code is 90245-5013
    Then expect Order Details Ship-To Cleansed Zip Code is 90245
    Then expect Order Details Ship-To Phone is 4445554444
    Then expect Order Details Ship-To Email is rtest@stamps.com


    Then Sign out
