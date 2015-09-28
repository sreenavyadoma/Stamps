
Feature: Print Media

  Background:
    Given I am signed in as a batch shipper ff

@print @print1 @regression
Scenario:  As a batch shipper, I want to be able to change my print media
And I Add a new order
Then Set Ship From to default
Then Set Ship-To address to random
Then Set Service to Priority Mail Package
Then Open Print Modal