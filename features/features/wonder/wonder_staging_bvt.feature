Feature: Staging Web Postage Smoke Test

  @wonder_bvt @wonder_bvt_staging
  Scenario: Staging Web Postage Sign-in
    Then Sign-in to staging webpostage as auto30/password1 using ff
    Then Expect webpostage user auto30 is signed-in

