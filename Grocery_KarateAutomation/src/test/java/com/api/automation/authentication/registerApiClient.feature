Feature: To register new API client
  Use POST /api-clients

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario Outline: Register new API Client
    Given path '/api-clients'
    And header Accept = 'application/json'
    And request {"clientName":<clientName> , "clientEmail":<clientEmail>}
    When method post
    And status 201
    And print response
    * def accessToken = response.accessToken
    And print "Access Token: ",accessToken
    * eval karate.write(accessToken,"accessToken.txt")

    Examples: 
      | clientName  | clientEmail          |
      | "Joe Smith" | "joesmith@gmail.com" |

  Scenario Outline: Register new API Client with existing email address
    Given path '/api-clients'
    And header Accept = 'application/json'
    And request {"clientName":<clientName> , "clientEmail":<clientEmail>}
    When method post
    And status 409
    And print response

    Examples: 
      | clientName  | clientEmail          |
      | "John Wick" | "johnwick@gmail.com" |
