Feature: Print 3 Domestic labels on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8_left_print3
  Scenario: Print 3 Domestic labels on 5.5x8.5 - left side

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address FCM Lg Env-Flat, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM Lg-Thick Env, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address FCM Pkg-Thick Env, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then on Order Details form, select service FCM Large Envelope
    Then on Order Details form, set Ounces to 1
    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Grid, check row 3
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out
