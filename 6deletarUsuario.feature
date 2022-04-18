Feature: Deletar Usuario
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

Scenario: Deletar Usuario com id
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "users", "a035f9be-e6f6-40af-abe0-a9d2e4073c22"
    When method delete
    Then status 204