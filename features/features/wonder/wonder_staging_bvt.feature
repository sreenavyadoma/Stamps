Feature: Staging Web Postage Smoke Test

  @wonder_bvt
  Scenario: Staging Web Postage Sign-in
    Then Sign-in to staging webpostage as auto040/password1 using firefox
    Then Expect webpostage user auto040 is signed-in

