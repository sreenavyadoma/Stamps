Feature:  User Able to Selects Curacao and Country Bonaire, Sint Eustatius, and Saba

  Background:
    Given I am signed in to Orders

  @new_country_code @new_country_code_1
  Scenario: User Able to Selects new Country Curacao

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to Curacao
    Then Expect Order Details Ship-To Country is Curacao
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to Bonaire, Sint Eustatius and Saba
    Then Expect Order Details Ship-To Country is Bonaire, Sint Eustatius and Saba
