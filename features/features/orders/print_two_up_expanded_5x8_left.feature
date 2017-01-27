Feature: Print 1 Domestic label on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8_left
  Scenario: Print 1 Domestic label on 5.5x8.5 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PME MFR Box, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out
