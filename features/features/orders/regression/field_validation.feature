Feature: Add Missing Field Validation

  Background:
    Given a valid user is signed in to Web Apps

  @validate_domestic
  Scenario: Add Missing Validation Logic for Domestic Fields
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA

  #  Add Missing Validation Logic for Email
    Then set order details email to @@
    Then set order details service to PM Large/Thick Envelope
    Then expect Order Details Domestic Email data error tooltip is "Please enter a valid email address"
    #Then expect orders grid Ship Cost error to contain "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where service = Priority Mail AND Zone > 5
    Then set order details ship-to domestic address to
      | full_name      | company    | street_address1     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then set order details service to PM Large/Thick Envelope
    Then set order details length to 0
    Then set order details width to 1
    Then set order details height to 1
    Then expect Order Details Dimensions Length data error tooltip is "Each dimension must be greater than 0"

    Then set order details service to PM Package
    Then set order details length to 0
    Then set order details width to 2
    Then set order details height to 2
    Then expect Order Details Dimensions Length data error tooltip is "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where service = Priority Mail AND Zone > 5
    Then set order details service to PM Large/Thick Envelope
    Then set order details length to 3
    Then set order details width to 0
    Then set order details height to 3
    Then expect Order Details Dimensions Width data error tooltip is "Each dimension must be greater than 0"

    Then set order details service to PM Package
    Then set order details length to 4
    Then set order details width to 0
    Then set order details height to 4
    Then expect Order Details Dimensions Width data error tooltip is "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then set order details service to PM Large/Thick Envelope
    Then set order details height to 0
    Then set order details length to 5
    Then set order details width to 5
    Then expect Order Details Dimensions Height data error tooltip is "Each dimension must be greater than 0"

    Then set order details service to PM Package
    Then set order details height to 0
    Then set order details length to 6
    Then set order details width to 6
    Then expect Order Details Dimensions Height data error tooltip is "Each dimension must be greater than 0"
    #Then expect orders grid Ship Cost error to contain "Each dimension must be greater than 0"

    Then sign out
