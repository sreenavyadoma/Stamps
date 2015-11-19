

Feature:  As a batch shipper, I want to be able to print two labels on one sheet

  Background:
    Given I am signed in as batch shipper gc/autosuggest/password1

  @two_up
  Scenario: User Prints multiple Domestic labels

    When I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to gcPMFRE5x8,Company, 1990 e. grand ave,el segundo,ca,90028
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"

    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid


    Then Open Print Modal
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""

    Then Select Print Modal right-side label
    And Expect Print Modal right-side label selected
    Then Expect Print Window requires 2 label sheets
    Then Print

    Then Sign out









