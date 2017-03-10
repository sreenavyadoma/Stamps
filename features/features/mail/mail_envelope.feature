Feature: Envelope

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_envelope
  Scenario: Envelope

   #mail_print_envelope_10
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_10_delivery_address
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 3
    Then select Print form service FCM Letter
    Then on Envelope form, set Include Return Address to Unchecked
    Then on Envelope form, set Include Delivery Address to Checked
    Then on Envelope form, set Include Postage to Unchecked
    Then on Envelope form, set Reference Number to 12345
    Then on Envelope form, set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_10_postage
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 3.5
    Then select Print form service FCM Letter
    Then on Envelope form, set Include Return Address to Unchecked
    Then on Envelope form, set Include Delivery Address to Unchecked
    Then on Envelope form, set Include Postage to Checked
    Then on Envelope form, set Reference Number to 54321
    Then on Envelope form, set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_10_return_address
    Then select Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 2
    Then select Print form service FCM Letter
    Then on Envelope form, set Include Return Address to Checked
    Then on Envelope form, set Include Delivery Address to Unchecked
    Then on Envelope form, set Include Postage to Unchecked
    Then on Envelope form, set Reference Number to 12345
    Then on Envelope form, set Cost Code to None
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_9
    Then select Print On Envelope - #9, 3 ⅞" x 8 ⅞"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_A9
    Then select Print On Envelope - #A9, 5 ¾" x 8 ¾"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 5 through 8

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_6
    Then select Print On Envelope - #6, 3 ⅝" x 6 ½"
    Then set Print form Mail-From to default
    Then set Envelope form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_A2
    Then select Print On Envelope - #A2, 4 ⅜" x 5 ¾"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 5 through 8

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

  #mail_print_envelope_7
    Then select Print On Envelope - #7, 3 ⅞" x 7 ½"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1

    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button


    Then select Print On Envelope - #9, 3 ⅞" x 8 ⅞"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1 through 4

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_11
    Then select Print On Envelope - #11, 4 ½" x 10 ⅜"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 5 through 8

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_envelope_12
    Then select Print On Envelope - #12, 4 ¾" x 11"
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 5 through 8

    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    
    Then Sign out
