Feature: Print 2 Domestic labels on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_paper_right_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - right side
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM LFR Envelope, 8.5x11 Right Side 2, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM SFR Box, 8.5x11 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then set Order Details form service to PM Small Flat Rate Box
    Then set Order Details form Ounces to 3
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then in Print modal, click Print button
    Then Sign out
