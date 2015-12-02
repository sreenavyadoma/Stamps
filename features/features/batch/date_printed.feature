Feature: Date Printed

  Background:
    Given I am signed in as a batch shipper


  @date_printed
  Scenario: Verify Date Printed column on Order Grid

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Print
    Then Expect Grid Ship Date to be today
    Then Expect Grid Date Printed to be today

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Set Print Modal Ship Date to today plus 1
    Then Print
    Then Expect Grid Date Printed to be today
    Then Expect Grid Ship Date to be today plus 1

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Set Print Modal Ship Date to today plus 2
    Then Print
    Then Expect Grid Date Printed to be today
    Then Expect Grid Ship Date to be today plus 2

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Set Print Modal Ship Date to today plus 3
    Then Print
    Then Expect Grid Date Printed to be today
    Then Expect Grid Ship Date to be today plus 3

    Then Sign out


