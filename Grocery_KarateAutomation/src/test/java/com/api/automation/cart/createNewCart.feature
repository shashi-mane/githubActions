Feature: To create a new cart in application
  Use POST /carts to create a new cart in the application

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario: To create a new cart
    Given path '/carts'
    And header Accept = 'application/json'
    When method post
    And status 201
    And print response
    * def cartId = response.cartId
    And print "CART_ID: ",cartId
    * eval karate.write(cartId,"cartId.txt")
    #* call read('getCart.feature') { cartId: '#(cartId)' }
