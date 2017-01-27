Feature:  User Able to Selects Curacao and Country Bonaire, Sint Eustatius, and Saba

  Background:
    Given a valid user is signed in to Web Apps

  @new_country_code @new_country_code_1
  Scenario: User Able to Selects new Country Curacao

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to Curacao
    Then On Order Details form, expect Ship-To Country is Curacao
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to Bonaire, Sint Eustatius and Saba
    Then On Order Details form, expect Ship-To Country is Bonaire, Sint Eustatius and Saba

