Feature: click print modal print button Sample - PME Package/Flat/Thick Envelope

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_pme_package
  Scenario:  PME Package/Flat/Thick Envelope
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button Sample
