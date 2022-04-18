Feature: Atualizar Usuario
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

Background: Variável de url, nome e e-mail
    * def payload = {name : "Zoro1", email : "zoro@g.com"}
    * def baseUrl = "https://crud-api-academy.herokuapp.com/api/v1"
    Given url baseUrl

        Scenario: Atualizar Usuario com Id
            And path "users", "8588358a-3b17-4c7f-8b40-da3f20f57584"
            And request {name: "Zoro1", email: "zoro@g.com"}
            When method put
            Then status 200
            And match response contains {id: "8588358a-3b17-4c7f-8b40-da3f20f57584", name: "Zoro1", email: "zoro@g.com", createdAt: "#string", updatedAt: "#string"}

        Scenario: Atualzar usuário não localizado
            And path "users", "8588358a-3b17-4c7f-8b40-da3f20f57584"
            And request payload
            When method put
            Then status 404

        Scenario: Atualizar usuário com email inválido
            And path "users", "8588358a-3b17-4c7f-8b40-da3f20f57584"
            And request {name : "Zoro1", email : "zorog.com"}
            And path 
            When method put 
            Then status 400

