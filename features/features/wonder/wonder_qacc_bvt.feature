Feature: QACC Web Postage Smoke Test

  @wonder_bvt
  Scenario: QACC Web Postage Sign-in
    Then Sign-in to qacc webpostage as auto40/password1 using firefox
    Then Expect webpostage user auto40 is signed-in
