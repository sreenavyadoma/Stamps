Feature: ORDERSAUTO-30 Add Tracking Email Option in Print Dialog

  Background:
    Given a valid user is signed in to Web Apps

  @email_tracking_details
  Scenario:  ORDERSAUTO-30
    Then Add New Order
    Then Order on Order Details form, set Ship-From to default
    Then Order on Order Details form, set Ship-To to address in Zone 1 through 4
    Then Order on Order Details form, set service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order on Order Details form, set Ounces to 1
    Then Open Print Modal
    Then in Print modal, set Media "Shipping Label - 5 �" x 8 �""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, set Email Tracking Details to Recipient to checked
    Then in Orders Toolbar, Print
    Then Sign out

