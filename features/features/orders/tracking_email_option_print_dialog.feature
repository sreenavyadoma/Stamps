Feature: ORDERSAUTO-30 Add Tracking Email Option in Print Dialog

  Background:
    Given a valid user is signed in to Web Apps

  @email_tracking_details
  Scenario:  ORDERSAUTO-30
    Then Add New Order
    Then Order set Order Details form Ship-From to default
    Then Order set Order Details form Ship-To to address in Zone 1 through 4
    Then Order set Order Details form service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order set Order Details form Ounces to 1
    Then Open Print Modal
    Then set Print modal Media "Shipping Label - 5 �" x 8 �""
    Then set Print modal Printer to "factory"
    Then set Print modal Email Tracking Details to Recipient to checked
    Then in Orders Toolbar, Print
    Then Sign out

