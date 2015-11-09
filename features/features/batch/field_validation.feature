Feature: Add Missing Field Validation

  Background:
    Given I am signed in as a batch shipper

  @validate_domestic @ray_test
  Scenario: Add Missing Validation Logic for Domestic Fields
    And I Add a new order
    Then Set Order Form Ship-From to default

  #  Add Missing Validation Logic for Email
    Then Set Order Form Email to @@
    Then Set Order Form Service to "Priority Mail Large/Thick Envelope"
    Then Expect single-order form Domestic Email data error tooltip to be "Please enter a valid email address"
    Then Expect Grid Ship Cost error to contain "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where Service = Priority Mail AND Zone > 5
    Then Set Order Form Ship-To address to
      | name      | company    | street_address     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then Set Order Form Service to "Priority Mail Large/Thick Envelope"
    Then Set Order Form Length to 0
    Then Set Order Form Width to 1
    Then Set Order Form Height to 1
    Then Expect single-order form Length data error tooltip to be "Each dimension must be greater than 0"

    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Length to 0
    Then Set Order Form Width to 2
    Then Set Order Form Height to 2
    Then Expect single-order form Length data error tooltip to be "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail AND Zone > 5
    Then Set Order Form Service to "Priority Mail Large/Thick Envelope"
    Then Set Order Form Length to 3
    Then Set Order Form Width to 0
    Then Set Order Form Height to 3
    Then Expect single-order form Width data error tooltip to be "Each dimension must be greater than 0"

    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Length to 4
    Then Set Order Form Width to 0
    Then Set Order Form Height to 4
    Then Expect single-order form Width data error tooltip to be "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then Set Order Form Service to "Priority Mail Large/Thick Envelope"
    Then Set Order Form Height to 0
    Then Set Order Form Length to 5
    Then Set Order Form Width to 5
    Then Expect single-order form Height data error tooltip to be "Each dimension must be greater than 0"

    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Height to 0
    Then Set Order Form Length to 6
    Then Set Order Form Width to 6
    Then Expect single-order form Height data error tooltip to be "Each dimension must be greater than 0"
    Then Expect Grid Ship Cost error to contain "Each dimension must be greater than 0"

    And Sign out
