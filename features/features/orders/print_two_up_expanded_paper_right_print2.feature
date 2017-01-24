Feature: Print 2 Domestic labels on 8.5x11 - right side

  Background:
    Given A user is signed in to Orders

  @print_two_up_expanded_paper_right_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - right side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PM LFR Envelope, 8.5x11 Right Side 2, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, set Ounces to 1
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PM SFR Box, 8.5x11 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then On Order Details form, select service PM Small Flat Rate Box
    Then On Order Details form, set Ounces to 3
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select right-side label
    Then In Print modal, expect right-side label selected
    Then In Print modal, click Print button
    Then Sign out
