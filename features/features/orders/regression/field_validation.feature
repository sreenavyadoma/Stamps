Feature: Add Missing Field Validation

  Background:
    Given a valid user is signed in to Web Apps

  @validate_domestic
  Scenario: Add Missing Validation Logic for Domestic Fields
    Then add new order
    Then set Order Details form Ship-From to default

  #  Add Missing Validation Logic for Email
    Then set Order Details form Email to @@
    Then set Order Details form service to PM Large/Thick Envelope
    Then expect Order Details form Domestic Email data error tooltip is "Please enter a valid email address"
    Then expect Orders Grid Ship Cost error to contain "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where service = Priority Mail AND Zone > 5
    Then set Order Details form Ship-To to Domestic Address
      | full_name      | company    | street_address     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Length to 0
    Then set Order Details form Width to 1
    Then set Order Details form Height to 1
    Then expect Order Details form Dimensions Length data error tooltip is "Each dimension must be greater than 0"

    Then set Order Details form service to PM Package
    Then set Order Details form Length to 0
    Then set Order Details form Width to 2
    Then set Order Details form Height to 2
    Then expect Order Details form Dimensions Length data error tooltip is "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where service = Priority Mail AND Zone > 5
    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Length to 3
    Then set Order Details form Width to 0
    Then set Order Details form Height to 3
    Then expect Order Details form Dimensions Width data error tooltip is "Each dimension must be greater than 0"

    Then set Order Details form service to PM Package
    Then set Order Details form Length to 4
    Then set Order Details form Width to 0
    Then set Order Details form Height to 4
    Then expect Order Details form Dimensions Width data error tooltip is "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Height to 0
    Then set Order Details form Length to 5
    Then set Order Details form Width to 5
    Then expect Order Details form Dimensions Height data error tooltip is "Each dimension must be greater than 0"

    Then set Order Details form service to PM Package
    Then set Order Details form Height to 0
    Then set Order Details form Length to 6
    Then set Order Details form Width to 6
    Then expect Order Details form Dimensions Height data error tooltip is "Each dimension must be greater than 0"
    Then expect Orders Grid Ship Cost error to contain "Each dimension must be greater than 0"

    Then Sign out
