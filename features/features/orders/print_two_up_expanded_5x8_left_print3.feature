Feature: Print 3 Domestic labels on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 3 Domestic labels on 5.5x8.5 - left side

    # 3 Domestic labels 5 ½" x 8 ½"
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to FCM Lg Env-Flat, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Lg-Thick Env, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then Set Order Details Service to "Priority Mail Large/Thick Envelope"
    Then Set Order Details Ounces to 1
    Then Set Order Details Length to 1
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to FCM Pkg-Thick Env, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Check Orders Grid row 3
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out
