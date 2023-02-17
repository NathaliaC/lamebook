# Lamebook
O Lamebook é a rede social mais simples do mundo. Construa uma aplicação onde exista uma timeline com posts já na página inicial, pública e visível para todos. É possível criar novos posts e curtir posts de outros usuários porém, somente usuários cadastrados no Lamebook podem fazer estas 2 ações.

## Versions
* Ruby - 3.2.0
* Ruby on Rails - 7.0.4
* PostgreSQL - 14.1

Para iniciar a aplicação você precisa executar
```
docker-compose up
```
Para executar os testes você pode usar
```
➜ docker exec -it lamebook_app_1 /bin/bash 
➜ bundle exec rspec 
```

Na inicialização da aplicação serão criados dois usuários, no qual você pode utilizar para logar na parte visual da aplicação.
```
email: carnaval@teste.com
senha: 123456
```

Por fim, acesse `localhost:3000` no navegador. 
