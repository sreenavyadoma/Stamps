#todo-rob Fix Purchasing so that if a user has 100K the test will fail right away, not being able to purchase more stamps.
Feature: Purchasing

  Background:
    Given a valid user is signed in to Web Apps

  @orders_purchasing
  Scenario:
    Then on add funds modal, purchase 10
    Then on add funds modal, click purchase button
    Then buy mail confirm purchase: expect text area contains, please confirm your $10.00 postage purchase.
    Then buy mail confirm transction: click confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $10.00 has been approved.
    Then buy mail purchase approved: click ok button
    Then buy mail: expect customer balance increased by $10

    Then on add funds modal, purchase 25
    Then on add funds modal, click purchase button
    Then buy mail confirm purchase: expect text area contains, please confirm your $25.00 postage purchase.
    Then buy mail confirm transction: click confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $25.00 has been approved.
    Then buy mail purchase approved: click ok button
    Then buy mail: expect customer balance increased by $25

    Then on add funds modal, purchase 50
    Then on add funds modal, click purchase button
    Then buy mail confirm purchase: expect text area contains, please confirm your $50.00 postage purchase.
    Then buy mail confirm transction: click confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $50.00 has been approved.
    Then buy mail purchase approved: click ok button
    Then buy mail: expect customer balance increased by $50

    Then on add funds modal, purchase 100
    Then on add funds modal, click purchase button
    Then buy mail confirm purchase: expect text area contains, please confirm your $100.00 postage purchase.
    Then buy mail confirm transction: click confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $100.00 has been approved.
    Then buy mail purchase approved: click ok button
    Then buy mail: expect customer balance increased by $100

    Then on add funds modal, purchase other amount 35
    Then buy mail confirm purchase: expect text area contains, please confirm your $35.00 postage purchase.
    Then buy mail confirm transction: click confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $35.00 has been approved.
    Then buy mail purchase approved: click ok button
    Then buy mail: expect customer balance increased by $35
    Then sign out
