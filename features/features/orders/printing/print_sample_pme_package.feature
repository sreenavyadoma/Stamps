Feature: click print modal print button Sample - PME Package/Flat/Thick Envelope

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_pme_package
  Scenario:  PME Package/Flat/Thick Envelope
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PME Package/Flat/Thick Envelope
    Then set Order Details Ounces to 1
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button Sample
