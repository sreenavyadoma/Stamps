Feature: Verify QASC, QACC and Staging environments are up and running.

  Scenario: QASC Web Postage Sign-in
    Then Sign-in to qasc webpostage as auto40/password using firefox

  Scenario: QACC Web Postage Sign-in
    Then Sign-in to qacc webpostage as auto40/password using firefox

  Scenario: Staging Web Postage Sign-in
    Then Sign-in to staging webpostage as auto40/password using firefox

