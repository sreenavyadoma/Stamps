Feature: Add Missing Field Validation

  Background:
    Given I am signed in to Orders

  @validate_domestic
  Scenario: Add Missing Validation Logic for Domestic Fields
    Then Toolbar: Add
    Then Details: Set Ship-From to default

  #  Add Missing Validation Logic for Email
    Then Details: Set Email to @@
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Expect Domestic Email data error tooltip is "Please enter a valid email address"
    Then Grid: Expect Ship Cost error to contain "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where Service = Priority Mail AND Zone > 5
    Then Details: Set Ship-To to Domestic Address
      | name      | company    | street_address     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Length to 0
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Expect Dimensions Length data error tooltip is "Each dimension must be greater than 0"

    Then Details: Select Service Priority Mail Package
    Then Details: Set Length to 0
    Then Details: Set Width to 2
    Then Details: Set Height to 2
    Then Details: Expect Dimensions Length data error tooltip is "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail AND Zone > 5
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Length to 3
    Then Details: Set Width to 0
    Then Details: Set Height to 3
    Then Details: Expect Dimensions Width data error tooltip is "Each dimension must be greater than 0"

    Then Details: Select Service Priority Mail Package
    Then Details: Set Length to 4
    Then Details: Set Width to 0
    Then Details: Set Height to 4
    Then Details: Expect Dimensions Width data error tooltip is "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Height to 0
    Then Details: Set Length to 5
    Then Details: Set Width to 5
    Then Details: Expect Dimensions Height data error tooltip is "Each dimension must be greater than 0"

    Then Details: Select Service Priority Mail Package
    Then Details: Set Height to 0
    Then Details: Set Length to 6
    Then Details: Set Width to 6
    Then Details: Expect Dimensions Height data error tooltip is "Each dimension must be greater than 0"
    Then Grid: Expect Ship Cost error to contain "Each dimension must be greater than 0"

    Then Sign out
