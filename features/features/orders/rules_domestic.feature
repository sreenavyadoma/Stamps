Feature:  Service enabled/disabled tests

  Background:
    Given I am signed in to Orders

  @fcm_selection_enabled
  Scenario:  First Class Mail over 16 ounces disabled
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 17
    Then Expect Order details Service "First-Class Mail Large Envelope/Flat" to be disabled
    Then Expect Order details Service "First-Class Mail Package/Thick Envelope" to be disabled

    #First Class Mail up to 15.9 ounces enabled
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 15.9
    Then Expect Order details Service "First-Class Mail Package/Thick Envelope" to be enabled
    Then Expect Order details Service "First-Class Mail Large Envelope/Flat" to be enabled

