Feature: QASC Web Postage Smoke Test

  @wonder_bvt
  Scenario: QASC Web Postage Sign-in
    Then Sign-in to qasc webpostage as auto40/password1 using firefox
    Then Expect webpostage user auto40 is signed-in
