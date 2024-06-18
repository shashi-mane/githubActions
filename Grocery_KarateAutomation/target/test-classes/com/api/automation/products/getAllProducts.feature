Feature: To test the products endpoint of grocery api
This get the list of products from inventory

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario: To get the list of all products from grocery api
    Given path '/products'
    And header Accept = 'application/json'
    When method get 
    Then status 200 
    And print response
    
    Scenario: To get the list of all products that are available from grocery api
    Given path '/products'
    And header Accept = 'application/json'
    And param available = true
    When method get 
    Then status 200 
    And print response
    Scenario: To get the list of all products from grocery api with invalid parameters
    Given path '/products'
    And header Accept = 'application/json'
    And param available = "tr"
    When method get 
    Then status 400 
    And print response
    
