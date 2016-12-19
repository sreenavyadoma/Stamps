Feature: ORDERSAUTO-30 Add Tracking Email Option in Print Dialog

  Background:
    Given I am signed in to Orders

  @email_tracking_details
  Scenario:  ORDERSAUTO-30
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details: Set Ounces to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 �" x 8 �""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Set Email Tracking Details to Recipient to checked
    Then Toolbar: Print
    Then Sign out

