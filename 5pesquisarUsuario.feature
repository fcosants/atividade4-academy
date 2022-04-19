Feature: Pesquisar Usuario
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

Scenario: Pesquisar usuario por nome ou e-mail
    Given url baseUrl
    And path "search"
    And param value = "chocopreto"
    When method get 
    Then status 200
    And match response == "#array"
    And match response contains {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string" }