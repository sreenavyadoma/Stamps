Feature: Envelopes regression



  Background:
    Given I am signed in as a postage shipper

  @wp_envelope_regression
  @wp_envelope_10
  Scenario: Envelope #10
    Then Print Postage: Select Print On Envelope - #10, 4 ⅛” x 9 ½”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out

  @wp_envelope_regression
  @wp_envelope_9
  Scenario: Envelope #9
    Then Print Postage: Select Print On Envelope - #9, 3 ⅞” x 8 ⅞”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out

  @wp_envelope_regression
  @wp_envelope_A9
  Scenario: Envelope #A9
    Then Print Postage: Select Print On Envelope - #A9, 5 ¾” x 8 ¾”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out

  @wp_envelope_regression
  @wp_envelope_6
  Scenario: Envelope #6
    Then Print Postage: Select Print On Envelope - #6, 3 ⅝” x 6 ½”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out

  @wp_envelope_regression
  @wp_envelope_A2
  Scenario: Envelope #A2
    Then Print Postage: Select Print On Envelope - #A2, 4 ⅜” x 5 ¾”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out

  @wp_envelope_regression

  @wp_envelope_7
  Scenario: Envelope #7
    Then Print Postage: Select Print On Envelope - #7, 3 ⅞” x 7 ½”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out

  @wp_envelope_regression
  @wp_envelope_11
  Scenario: Envelope #11
    Then Print Postage: Select Print On Envelope - #11, 4 ½” x 10 ⅜”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out

  @wp_envelope_regression
  @wp_envelope_12
  Scenario: Envelope #12
    Then Print Postage: Select Print On Envelope - #12, 4 ¾” x 11”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out


