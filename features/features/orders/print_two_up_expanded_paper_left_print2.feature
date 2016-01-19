Feature: Print 2 Domestic labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 2 Domestic labels on 8.5x11 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM FR Envelope, 8.5x11, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM PFR Envelope, 8.5x11, 557 County Rd. H, Fredonia WI 53021-9634
    Then Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out
