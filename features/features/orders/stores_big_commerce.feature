
Feature:  Big Commerce Store Management

  Background:
    Given I am signed in to Orders

    @big_commerce
    Scenario: Rakuten Store Management
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores

      # Add Store
      Then Manage Stores: Add
      Then Marketplace: Select Big Commerce
      Then Big Commerce: Expect Login to your Bigcommerce admin link is present
      Then Marketplace: Close Modal
      Then Manage Stores: Close Modal
      Then Sign out




