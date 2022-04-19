Feature: Atualizar Usuario
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

Background: Variável de url, nome e e-mail
    * def payload = {name : "Zoro1", email : "zoro@g.com"}
    Given url baseUrl

        Scenario: Atualizar Usuario com Id
            And path "users", "3be5f658-ec85-471d-87e4-7ec110625a32"
            And request {name: "chocozin", email: "zoro@g.com"}
            When method put
            Then status 200
            And match response contains {id: "3be5f658-ec85-471d-87e4-7ec110625a32", name: "chocozin", email: "zoro@g.com", createdAt: "#string", updatedAt: "#string"}

        Scenario: Atualzar usuário não localizado
            And path "users", "8588358a-3b17-4c7f-8b40-da3f20f57584"
            And request payload
            When method put
            Then status 404

        Scenario: Atualizar usuário com email inválido
            And path "users", "8588358a-3b17-4c7f-8b40-da3f20f57584"
            And request {name : "Zoro1", email : "zorog.com"}
            When method put 
            Then status 400

        Scenario: Atualizar usuário com e-mail já utlizado por outro usuário e aparecer mensagem padrão
            And path "users", "d67aacba-5e61-40bb-973b-e8f35cf4647c"
            And request {name : "chocobranco", email : "chocopreto@g.com"}
            When method put
            Then status 422
            And match response contains { error: "E-mail already in use." }
            
        Scenario:  Atualizar o nome de usuário com mais de 100 caracteres.
            And path "users", "d67aacba-5e61-40bb-973b-e8f35cf4647c"
            And request {name : "chicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochicochico", email : "abacate@teste.comBella"}
            When method put
            Then status 400

        Scenario: Atualizar um e-mail com mais de 60 caracteres
            And path "users", "d67aacba-5e61-40bb-973b-e8f35cf4647c"
            And request {name : "Maria", email: "chicochicochicochicochicochicochicochicochicochicochicochicochico@g.com"}
            When method post
            Then status 404