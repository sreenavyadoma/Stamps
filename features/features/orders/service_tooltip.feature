
Feature: Service Tooltip

  Background:
    Given I am signed in to Orders

  @service_tooltip
  Scenario: PMI Insurance Included - tooltip only
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Canada
    Then Expect Order Details Service Tooltip for "Priority Mail International Package" to include "Ship up to 70 lbs. using any large or thick envelope or box with pricing that varies by weight and country.  The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise."
    Then Expect Order Details Service Tooltip for "Priority Mail International Medium Flat Rate Box" to include "Ship up to 20 lbs. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.||Available box sizes:||Side Loading:   14" x 12" x 3 1/2""
    Then Expect Order Details Service Tooltip for "Priority Mail International Large Flat Rate Box" to include "Ship up to 20 lbs. internationally with pricing that varies by country, not weight.  You must use a USPS-provided box which can be ordered for free from Stamps.com.||Tip: This service includes free insurance of up to $100 for documents and $200 for merchandise.||Available box sizes:||Side Loading: 24 1/16" x 11 7/8" x 3 1/8""





