Feature: in Print modal, click Print button Sample - Priority Mail Express Padded Flat Rate Envelope

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_pme_padded_flat_rate_envelope
  Scenario:  Priority Mail Express Padded Flat Rate Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button Sample
    Then Sign out