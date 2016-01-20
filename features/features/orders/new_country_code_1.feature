Feature:  User Able to Selects Curacao and Country Bonaire, Sint Eustatius, and Saba

  Background:
    Given I am signed in to Orders

  @new_country_code @new_country_code_1
  Scenario: User Able to Selects new Country Curacao

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To Country to Curacao
    Then Expect Order Details Ship-To Country is Curacao
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To Country to Bonaire, Sint Eustatius and Saba
    Then Expect Order Details Ship-To Country is Bonaire, Sint Eustatius and Saba

