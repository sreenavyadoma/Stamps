
Feature: Service Tooltip

  Background:
    Given I am signed in to Orders

  @service_tooltip
  Scenario:  User Views Price Next to Service Dropdown
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Canada
    Then Expect Order Details Service Tooltip for "Priority Mail International Package" to include "Ship up to 70 lbs. using any large or thick envelope or box with pricing that varies by weight and country.  The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise."
    Then Expect Order Details Service Tooltip for "Priority Mail International Medium Flat Rate Box" to include "Ship up to 20 lbs. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.<br><br>Available box sizes:"
    Then Expect Order Details Service Tooltip for "Priority Mail International Large Flat Rate Box" to include "Ship up to 20 lbs. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.<br><br>Available box sizes:"



