Feature: click print modal print button Sample - Parcel Select Ground Large Package

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_parcel_select_ground_large_package
  Scenario:  Parcel Select Ground Large Package
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button Sample
    Then sign out