Feature: Pesquisar Usuario
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

Scenario: Pesquisar usuario por nome ou e-mail
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "search"
    And param value = "Chico Santos"
    When method get 
    Then status 200
    And match response == "#array"