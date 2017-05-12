Feature: Registration
  Background:
    Given I loaded the default registration page

  @registration_orders
  Scenario: Theme 1632 Normal Test Workflow
    Then populate all Profile page required fields
    Then continue to Membership page
    Then populate all Membership page required fields
    Then submit Membership Page
    Then save sign-in credentials
    Then load sign-in credentials
    Then load Web Apps Orders then sign-in
    Then add new order

#

#    Then save sign-in credentials to parameter file registration_ach_purchase_100k
#    Then load sign-in credentials from file registration_ach_purchase_100k

#    Then send username to standard out

