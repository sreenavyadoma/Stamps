Feature: ORDERSAUTO-3405 New Sprint 11/22/17 WEBAPPS-6706 Split Order: Automatically Select New Order After Split

  Background:
    Given a valid user is signed in to Web Apps

  @split_order
  Scenario:  ORDERSAUTO-3405 New Sprint 11/22/17 WEBAPPS-6706 Split Order: Automatically Select New Order After Split
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to domestic address to
      | full_name       | company  | street_address1      | city          | state | zip   | country       | phone   |  email            |
      | Split Order | Stamps  | 1990 E Grand Ave  | El Segundo | CA    | 90245 | United States | random |  random |
    Then set order details phone to 4445554444
    Then set order details email to rtest@stamps.com
    Then set order details service to PM Package
    Then set order details pounds to 1

    Then add order details item 1, qty 3, id IDone, description description 1
    Then add order details item 2, qty 5, id IDtwo, description description 2

    Then select grid toolbar more actions item Split Order
    Then expect Split Order modal original order id is correct
    Then expect Split Order modal default new order id is correct
    Then expect item details in Split order Modal are correct
    Then set Split Order new order number to random
    Then set Split Order new order quantity for item 1 to 1
    Then set Split Order new order quantity for item 2 to 2

    Then click Split Order modal confirm button

    Then expect new order from Split Order modal is selected in orders grid
    Then expect order details ship-to name is Split Order
    Then expect order details ship-to company name is Stamps
    Then expect order details ship-to cleansed street address is 1990 E Grand Ave
    Then expect order details ship-to cleansed city is El Segundo
    Then expect order details ship-to cleansed state is CA
    Then expect order details ship-to cleansed zip plus 4 code is 90245-5013
    Then expect order details ship-to cleansed zip code is 90245
    Then expect order details ship-to phone is 4445554444
    Then expect Order Details Ship-To Email is rtest@stamps.com


    Then sign out
