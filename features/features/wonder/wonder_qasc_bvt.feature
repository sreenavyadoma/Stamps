Feature: QASC Web Postage Smoke Test

  @wonder_bvt
  Scenario: QASC Web Postage Sign-in
    Then Sign-in to qasc webpostage as auto30/password1 using chrome
    Then Expect webpostage user auto30 is signed-in
