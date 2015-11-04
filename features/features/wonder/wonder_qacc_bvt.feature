Feature: QACC Web Postage Smoke Test

  @wonder_bvt
  Scenario: QACC Web Postage Sign-in
    Then Sign-in to qacc webpostage as auto040/326tsetaqcdS! using firefox
    Then Expect webpostage user auto040 is signed-in
