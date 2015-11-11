Feature: QACC Web Postage Smoke Test

  @wonder_bvt
  Scenario: QACC Web Postage Sign-in
    Then Sign-in to qacc webpostage as auto30/326tsetaqcdS! using ff
    Then Expect webpostage user auto30 is signed-in
