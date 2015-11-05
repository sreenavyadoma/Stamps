Feature: Staging Web Postage Smoke Test

  @wonder_bvt
  Scenario: Staging Web Postage Sign-in
    Then Sign-in to staging webpostage as auto30/password1 using chrome
    Then Expect webpostage user auto30 is signed-in

