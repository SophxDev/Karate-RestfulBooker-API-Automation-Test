Feature: Reusable authentication logic

  Scenario:
    #Llamada de feature principal de auth
    * def result = call read('classpath:features/auth/auth-token.feature')

    #Extraccion del token para otros features
    * def token = result.token
