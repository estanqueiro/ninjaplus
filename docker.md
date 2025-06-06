# Ambiente de testes

## Baixar as imagens

docker pull postgres
docker pull dpage/pgadmin4
docker pull qaninja/ninjaplus-api
docker pull qaninja/ninjaplus-web
docker pull qaninja/python-wd

### Criar a rede  Docker

docker network create --driver bridge skynet

### Subir o Banco de Dados

docker run --name pgdb --network=skynet -e "POSTGRES_PASSWORD=qaninja" -p 5432:5432 -v var/lib/postgresql/data -d postgres

### Subir o Administrador do Banco de Dados (PgAdmin)

docker run --name pgadmin --network=skynet -p 15432:80 -e "PGADMIN_DEFAULT_EMAIL=root@qaninja.io" -e "PGADMIN_DEFAULT_PASSWORD=qaninja" -d dpage/pgadmin4

### Subir a API 

docker run --name ninjaplus-api --network=skynet -e "DATABASE=pgdb" -p 3000:3000 -d qaninja/ninjaplus-api

### Subir a Aplicação Web

docker run --name ninjaplus-web --network=skynet -e "VUE_APP_API=http://ninjaplus-api:3000" -p 5000:5000 -d qaninja/ninjaplus-web

### Subir o Jenkins
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk17

### Subir o python

### Entrar no docker do jenkins para pegar senha do administrador
docker exec -it jenkins sh
cat /var/jenkins_home/secrets/initialAdminPassword => a786d5c122d84b64899fb9b260d90cc7
admin => devops/devops

### Importante:​
### Quando você reiniciar o seu computador, certifique-se que o Docker esteja online e suba containers​ novamente:

docker start pgdb
docker start pgadmin
​docker start ninjaplus-api
​docker start ninjaplus-web
docker start jenkins

### Se alguma coisa der errado e for necessário refazer a aula, voce poderá remover os containers com os seguintes comandos:

docker rm -f ​pgdb
docker rm -f ​pgadmin
docker rm -f ​ninjaplus-api
docker rm -f ​ninjaplus-web

### Gerar o requirements do projeto robotframework
pip freeze > requirements.txt