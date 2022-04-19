Feature: hook
    
    @registrar
    Scenario: Registrar Usuário
         Given baseUrl
         And path "users"
         And request {name : "Luffy", email "luffy@g.com"}
         When method post
         Then status 201

    @deletar     
    Scenario: Deletar Usuario com id
        Given url baseUrl
        And path "users", FcoSantos
        When method delete
        Then status 204