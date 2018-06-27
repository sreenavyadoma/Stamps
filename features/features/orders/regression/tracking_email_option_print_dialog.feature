#todo-Rob set Print modal Email Tracking Details to Recipient to checked
Feature: ORDERSAUTO-30 Add Tracking Email Option in Print Dialog

  Background:
    Given a valid user is signed in to Web Apps

  @email_tracking_details
  Scenario:  ORDERSAUTO-30
    Then Add New Order
    Then Order set order details ship-from to Automation - El Segundo, CA
    Then Order set order details ship-to to random address between zone 1 and 4
    Then Order set Order Details service to "PME Padded Flat Rate Envelope"
    Then Order set order details ounces to 1
    Then Open Print Modal
    Then set Print modal Media "Shipping Label - 5 �" x 8 �""
    Then set orders print modal printer
    Then set Print modal Email Tracking Details to Recipient to checked
    Then in Orders Toolbar, Print
    Then sign out

