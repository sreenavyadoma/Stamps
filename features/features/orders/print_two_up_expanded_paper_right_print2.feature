Feature: Print 2 Domestic labels on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_paper_right_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - right side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM LFR Envelope, 8.5x11 Right Side 2, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM SFR Box, 8.5x11 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, set Ounces to 3
    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select right-side label
    Then in Print modal, expect right-side label selected
    Then in Print modal, click Print button
    Then Sign out
