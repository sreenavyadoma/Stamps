
Feature: Service Tooltip

  Background:
    Given I am signed in to Orders

  @inline_service_rates
  Scenario:  User Views Price Next to Service Dropdown
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Canada

    Then Expect Order Details Customs <string> button is <string>
    Then Expect Order Details Service Cost inline price for "First-Class Mail Large Envelope/Flat" to be greater than $0.01