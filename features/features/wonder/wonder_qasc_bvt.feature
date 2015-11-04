Feature: QASC Web Postage Smoke Test

  @wonder_bvt
  Scenario: QASC Web Postage Sign-in
    Then Sign-in to qasc webpostage as auto040/password1 using firefox
    Then Expect webpostage user auto040 is signed-in
