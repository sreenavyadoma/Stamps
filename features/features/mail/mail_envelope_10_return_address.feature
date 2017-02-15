Feature: Envelope #10 - Print Only Return Address

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_10_return_address
  Scenario: Envelope #10
    Then on Print form, select Envelope 10
    Then on Envelope form, set Mail From to default
    Then on Envelope form, set Mail To country to United States
    Then on Print form, set Mail To address to zone 1 through 4
    Then set Print form Pounds to 0
    Then on Print form, set Ounces to 2
    Then on Envelope form, set service to First-Class Mail Letter
    Then on Envelope form, set Include Return Address to Checked
    Then on Envelope form, set Include Delivery Address to Unchecked
    Then on Envelope form, set Include Postage to Unchecked
    Then on Envelope form, set Reference Number to 12345
    Then on Envelope form, set Cost Code to None
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Print button on Mail Print modal
    Then Sign out
