Feature: Delete and existing booking

  Background:
    * url baseUrl

  Scenario: Successfully delete a booking

    # Generar token
    * def auth = call read('classpath:features/common/reusable-auth.feature')
    * def token = auth.token

    # Crear booking real
    * def created = call read('classpath:features/helpers/create-and-return-id.feature')
    * def bookingId = created.bookingId

    # Ejecutar Delete
    Given path '/booking', bookingId
    And header Cookie = 'token=' + token
    When method delete
    Then status 201

    # Verificar que ya no exista el registro borrado
    Given path '/booking', bookingId
    When method get
    Then status 404