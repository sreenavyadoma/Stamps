Feature: click print modal print button Sample - Priority Mail Flat Rate Envelope

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_pm_flat_rate_envelope
  Scenario:  Priority Mail Flat Rate Envelope
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Flat Rate Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button Sample
    Then sign out
