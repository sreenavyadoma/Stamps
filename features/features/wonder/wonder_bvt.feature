Feature: This is a smoke test to see if QASC, QACC and Staging environments are up and running.

  Scenario: QASC Web Postage Sign-in
    Then Sign-in to qasc webpostage as auto40/password using firefox
    Then Navigate to Contacts tab

  Scenario: QACC Web Postage Sign-in
    Then Sign-in to qacc webpostage as auto40/password using firefox
    Then Navigate to Contacts tab

  Scenario: Staging Web Postage Sign-in
    Then Sign-in to staging webpostage as auto40/password using firefox
    Then Navigate to Contacts tab
