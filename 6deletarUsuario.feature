Feature: Deletar Usuario
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

    Scenario: Deletar Usuario com id
        Given url baseUrl
        And path "users", "a035f9be-e6f6-40af-abe0-a9d2e4073c22"
        When method delete
        Then status 204

    Scenario: Deletar usuário com id inválido
        Given url baseUrl
        And path "users", "121f629d-cf8d-4bde-9446-de76d283b347"
        When method delete
        Then status 204