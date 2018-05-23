
@mail_print_envelope_10_A2_A9
Feature: Envelope #10, #A2, #A9

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope_10
  Scenario: Print On: Envelope #10

    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1
    Then set Print form Ounces to 1
    Then select print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_envelope_10_delivery_address
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Ounces to 3
    Then select print form service FCM Letter
    #Then on Envelope form, set Include Return Address to Unchecked
    #Then on Envelope form, set Include Delivery Address to Checked
    #Then on Envelope form, set Include Postage to Unchecked
    #Then on Envelope form, set Reference Number to 12345
    #Then on Envelope form, set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_envelope_10_postage
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Ounces to 3
    Then select print form service FCM Letter
    #Then on Envelope form, set Include Return Address to Unchecked
    #Then on Envelope form, set Include Delivery Address to Unchecked
    #Then on Envelope form, set Include Postage to Checked
    #Then on Envelope form, set Reference Number to 54321
    #Then on Envelope form, set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_envelope_10_return_address
    Then select print on Envelope - 10
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Ounces to 2
    Then select print form service FCM Letter
    #Then on Envelope form, set Include Return Address to Checked
    #Then on Envelope form, set Include Delivery Address to Unchecked
    #Then on Envelope form, set Include Postage to Unchecked
    #Then on Envelope form, set Reference Number to 12345
    #Then on Envelope form, set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_envelope_A9
  Scenario: Print On: Envelope #A9

    Then select print on Envelope - A9
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

  @mail_print_envelope_A2
  Scenario: Print On: Envelope #A2

    Then select print on Envelope - A2
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then sign out
