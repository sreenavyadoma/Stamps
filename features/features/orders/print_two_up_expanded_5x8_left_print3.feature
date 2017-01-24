Feature: Print 3 Domestic labels on 5.5x8.5 - left side

  Background:
    Given A user is signed in to Orders

  @print_two_up_expanded_5x8_left_print3
  Scenario: Print 3 Domestic labels on 5.5x8.5 - left side

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address FCM Lg Env-Flat, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then On Order Details form, select service FCM Large Envelope
    Then On Order Details form, set Ounces to 1
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PM Lg-Thick Env, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, set Length to 1
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address FCM Pkg-Thick Env, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then On Order Details form, select service First-Class Mail Package/Thick Envelope
    Then On Order Details form, set Ounces to 1
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Grid, check row 3
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select left-side label
    Then In Print modal, expect left-side label selected
    Then In Print modal, click Print button
    Then Sign out
