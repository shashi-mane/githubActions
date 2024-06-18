Feature: To test the status endpoint of grocery api
This is to test the status of grocery api- https://simple-grocery-store-api.glitch.me

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario: To get the status of the api
    Given path '/status'
    When method get #send the get request
    Then status 200 #the status code request should be 200
    And match response.status == "UP"
