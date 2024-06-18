Feature: To delete item to cart in application
  Use DELETE /carts/:cartId/items/:itemId

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/cartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * def item_path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/itemId.txt'
    * def item_file = new File(item_path)
    * def scanner = new Scanner(item_file)
    * def itemId = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario: Delete item from the cart
    Given path 'carts/'+ cartId + '/items/' + itemId
    And header Accept = 'application/json'
    When method delete
    And status 204
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")
    
    Scenario: Delete item from the cart with invalid itemId
    Given path 'carts/'+ cartId + '/items/' + itemId + '123'
    And header Accept = 'application/json'
    When method delete
    And status 404
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")
    
    Scenario: Delete item from the cart which is not present
    Given path 'carts/'+ cartId + 'abc' + '/items/' + itemId
    And header Accept = 'application/json'
    When method delete
    And status 404
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")

