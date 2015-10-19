Feature: Verify QASC, QACC and Staging environments are up and running.

  @wonder_bvt
  Scenario: QASC Web Postage Sign-in
    Then Sign-in to qasc webpostage as auto40/password using firefox
    Then Expect webpostage user auto40 is signed-in

  @wonder_bvt
  Scenario: QACC Web Postage Sign-in
    Then Sign-in to qacc webpostage as auto40/password using firefox
    Then Expect webpostage user auto40 is signed-in

  @wonder_bvt
  Scenario: Staging Web Postage Sign-in
    Then Sign-in to staging webpostage as auto40/password using firefox
    Then Expect webpostage user auto40 is signed-in

