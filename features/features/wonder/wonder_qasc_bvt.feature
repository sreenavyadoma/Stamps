Feature: QASC Web Mail Smoke Test

  @wonder_bvt
  Scenario: QASC Web Mail Sign-in
    Then Sign-in to qasc webpostage as auto30/password1 using ff
    Then Expect webpostage user auto30 is signed-in
