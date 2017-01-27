Feature: Add Missing Field Validation

  Background:
    Given a valid user is signed in to Web Apps

  @validate_domestic
  Scenario: Add Missing Validation Logic for Domestic Fields
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

  #  Add Missing Validation Logic for Email
    Then on Order Details form, set Email to @@
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, expect Domestic Email data error tooltip is "Please enter a valid email address"
    Then In Orders Grid, expect Ship Cost error to contain "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where service = Priority Mail AND Zone > 5
    Then on Order Details form, set Ship-To to Domestic Address
      | name      | company    | street_address     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Length to 0
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1
    Then on Order Details form, expect Dimensions Length data error tooltip is "Each dimension must be greater than 0"

    Then on Order Details form, select service PM Package
    Then on Order Details form, set Length to 0
    Then on Order Details form, set Width to 2
    Then on Order Details form, set Height to 2
    Then on Order Details form, expect Dimensions Length data error tooltip is "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where service = Priority Mail AND Zone > 5
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Length to 3
    Then on Order Details form, set Width to 0
    Then on Order Details form, set Height to 3
    Then on Order Details form, expect Dimensions Width data error tooltip is "Each dimension must be greater than 0"

    Then on Order Details form, select service PM Package
    Then on Order Details form, set Length to 4
    Then on Order Details form, set Width to 0
    Then on Order Details form, set Height to 4
    Then on Order Details form, expect Dimensions Width data error tooltip is "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Height to 0
    Then on Order Details form, set Length to 5
    Then on Order Details form, set Width to 5
    Then on Order Details form, expect Dimensions Height data error tooltip is "Each dimension must be greater than 0"

    Then on Order Details form, select service PM Package
    Then on Order Details form, set Height to 0
    Then on Order Details form, set Length to 6
    Then on Order Details form, set Width to 6
    Then on Order Details form, expect Dimensions Height data error tooltip is "Each dimension must be greater than 0"
    Then In Orders Grid, expect Ship Cost error to contain "Each dimension must be greater than 0"

    Then Sign out
