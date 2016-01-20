Feature: Add Missing Field Validation

  Background:
    Given I am signed in to Orders

  @validate_domestic
  Scenario: Add Missing Validation Logic for Domestic Fields
    Then Add New Order
    Then Order Details - Set Ship-From to default

  #  Add Missing Validation Logic for Email
    Then Order Details - Set Email to @@
    Then Order Details - Set Service to "Priority Mail Large/Thick Envelope"
    Then Expect Order Details Domestic Email data error tooltip to be "Please enter a valid email address"
    Then Expect Grid Ship Cost error to contain "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where Service = Priority Mail AND Zone > 5
    Then Order Details - Set Ship-To address to
      | name      | company    | street_address     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then Order Details - Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details - Set Length to 0
    Then Order Details - Set Width to 1
    Then Order Details - Set Height to 1
    Then Expect Order Details Dimensions Length data error tooltip to be "Each dimension must be greater than 0"

    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Length to 0
    Then Order Details - Set Width to 2
    Then Order Details - Set Height to 2
    Then Expect Order Details Dimensions Length data error tooltip to be "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail AND Zone > 5
    Then Order Details - Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details - Set Length to 3
    Then Order Details - Set Width to 0
    Then Order Details - Set Height to 3
    Then Expect Order Details Dimensions Width data error tooltip to be "Each dimension must be greater than 0"

    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Length to 4
    Then Order Details - Set Width to 0
    Then Order Details - Set Height to 4
    Then Expect Order Details Dimensions Width data error tooltip to be "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then Order Details - Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details - Set Height to 0
    Then Order Details - Set Length to 5
    Then Order Details - Set Width to 5
    Then Expect Order Details Dimensions Height data error tooltip to be "Each dimension must be greater than 0"

    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Height to 0
    Then Order Details - Set Length to 6
    Then Order Details - Set Width to 6
    Then Expect Order Details Dimensions Height data error tooltip to be "Each dimension must be greater than 0"
    Then Expect Grid Ship Cost error to contain "Each dimension must be greater than 0"

    And Sign out
