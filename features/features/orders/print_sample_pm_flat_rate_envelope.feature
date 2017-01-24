Feature: In Print modal, click Print button Sample - Priority Mail Flat Rate Envelope

  Background:
    Given A user is signed in to Orders

  @print_sample_pm_flat_rate_envelope
  Scenario:  Priority Mail Flat Rate Envelope
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, set Ounces to 1
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button Sample
    Then Sign out
