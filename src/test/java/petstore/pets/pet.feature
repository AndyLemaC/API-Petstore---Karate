Feature: Pruebas API Petstore con Karate

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario: 01 - Anadir una mascota a la tienda
    * def petId = java.lang.System.currentTimeMillis()
    * def petName = 'Rocky-' + petId
    * def petToCreate = read('classpath:petstore/pets/pet.json')
    * set petToCreate.id = petId
    * set petToCreate.name = petName
    * set petToCreate.status = 'available'

    Given path '/pet'
    And request petToCreate
    When method post
    Then status 200
    And match response.id == petId
    And match response.name == petName
    And match response.status == 'available'

  Scenario: 02 - Consultar la mascota ingresada por ID
    * def petId = java.lang.System.currentTimeMillis()
    * def petName = 'Rocky-' + petId
    * def petToCreate = read('classpath:petstore/pets/pet.json')
    * set petToCreate.id = petId
    * set petToCreate.name = petName
    * set petToCreate.status = 'available'

    Given path '/pet'
    And request petToCreate
    When method post
    Then status 200

    Given path '/pet', petId
    When method get
    Then status 200
    And match response.id == petId
    And match response.name == petName
    And match response.status == 'available'

  Scenario: 03 - Actualizar nombre de mascota y estatus a sold
    * def petId = java.lang.System.currentTimeMillis()
    * def createdName = 'Rocky-' + petId
    * def updatedName = 'Toby'
    * def petToCreate = read('classpath:petstore/pets/pet.json')
    * set petToCreate.id = petId
    * set petToCreate.name = createdName
    * set petToCreate.status = 'available'

    Given path '/pet'
    And request petToCreate
    When method post
    Then status 200

    * def petToUpdate = read('classpath:petstore/pets/pet.json')
    * set petToUpdate.id = petId
    * set petToUpdate.name = updatedName
    * set petToUpdate.status = 'sold'

    Given path '/pet'
    And request petToUpdate
    When method put
    Then status 200
    And match response.id == petId
    And match response.name == updatedName
    And match response.status == 'sold'

  Scenario: 04 - Consultar la mascota modificada por estatus sold
    * def petId = java.lang.System.currentTimeMillis()
    * def createdName = 'Rocky-' + petId
    * def updatedName = 'Toby'
    * def petToCreate = read('classpath:petstore/pets/pet.json')
    * set petToCreate.id = petId
    * set petToCreate.name = createdName
    * set petToCreate.status = 'available'

    Given path '/pet'
    And request petToCreate
    When method post
    Then status 200

    * def petToUpdate = read('classpath:petstore/pets/pet.json')
    * set petToUpdate.id = petId
    * set petToUpdate.name = updatedName
    * set petToUpdate.status = 'sold'

    Given path '/pet'
    And request petToUpdate
    When method put
    Then status 200

    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    And match response == '#array'

    * def foundPets = karate.filter(response, function(x){ return x.id == petId })
    * match foundPets == '#[1]'
    * match foundPets[0].name == updatedName
    * match foundPets[0].status == 'sold'
