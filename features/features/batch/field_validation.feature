Feature: Add Missing Field Validation

  Background:
    Given I am signed in as a batch shipper

  @validate_domestic @ray_test
  Scenario: Add Missing Validation Logic for Domestic Fields
    And I Add a new order
    Then Set single-order form Ship-From to default

  #  Add Missing Validation Logic for Email
    Then Set Email to @@
    Then Set single-order form Service to "Priority Mail Large/Thick Envelope"
    Then Expect single-order form Domestic Email data error tooltip to be "Please enter a valid email address"
    Then Expect order-grid Ship Cost error to contain "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where Service = Priority Mail AND Zone > 5
    Then Set single-order form Ship-To address to
      | name      | company    | street_address     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then Set single-order form Service to "Priority Mail Large/Thick Envelope"
    Then Set single-order form Length to 0
    Then Set single-order form Width to 1
    Then Set single-order form Height to 1
    Then Expect single-order form Length data error tooltip to be "Each dimension must be greater than 0"

    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Length to 0
    Then Set single-order form Width to 2
    Then Set single-order form Height to 2
    Then Expect single-order form Length data error tooltip to be "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail AND Zone > 5
    Then Set single-order form Service to "Priority Mail Large/Thick Envelope"
    Then Set single-order form Length to 3
    Then Set single-order form Width to 0
    Then Set single-order form Height to 3
    Then Expect single-order form Width data error tooltip to be "Each dimension must be greater than 0"

    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Length to 4
    Then Set single-order form Width to 0
    Then Set single-order form Height to 4
    Then Expect single-order form Width data error tooltip to be "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then Set single-order form Service to "Priority Mail Large/Thick Envelope"
    Then Set single-order form Height to 0
    Then Set single-order form Length to 5
    Then Set single-order form Width to 5
    Then Expect single-order form Height data error tooltip to be "Each dimension must be greater than 0"

    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Height to 0
    Then Set single-order form Length to 6
    Then Set single-order form Width to 6
    Then Expect single-order form Height data error tooltip to be "Each dimension must be greater than 0"
    Then Expect order-grid Ship Cost error to contain "Each dimension must be greater than 0"

    And Sign out
