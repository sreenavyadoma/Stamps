Feature: Staging Web Postage Smoke Test

  @wonder_bvt
  Scenario: Staging Web Postage Sign-in
    Then Sign-in to staging webpostage as auto40/326tsetaqcdS! using firefox
    Then Expect webpostage user auto40 is signed-in

