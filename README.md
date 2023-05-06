# Docker Magento 2

Ambiente de Magento 2 em Docker.

## Serviços do ambiente

- MariaDB
  - phpMyAdmin: 5.2
- Nginx: 1.22
- PHP: 8.1
  - Composer: 2.2.21
  - Xdebug: 3.2.1
- Redis: 7.0
- RabbitMQ: 3.9
- Elasticsearch: 7.17.10
  - Kibana: 7.17.10
- Magento Commerce: 2.4.6
  - n98-magerun: 7.0.3

---

## Scripts

Para **instalar** todo o ambiente é necessário somente um passo:

```sh
bin/install
```

Para **parar** os contêiners do projeto:

```sh
bin/stop
```

Para **iniciar** os contêiners do projeto:

```sh
bin/start
```

Para acessar o terminal do contêiner PHP do projeto:

```sh
bin/bash
```

Para executar um comando no terminal do contêiner PHP do projeto:

```sh
bin/cli
```

Para **reiniciar** os contêiners do projeto:

```sh
bin/restart
```

Para **deletar** o projeto:

```sh
bin/kill
```

> Este comando inclui as seguintes funções:
> - Desinstalar o Magento 2
> - Deletar os contêiners;
> - Deletar os volumes do contêiners;
> - Deletar a rede dos contêiners;
> - Deletar o arquivo `composer.lock`
> - Deletar a pasta `vendor`

---

## Acessos

### MariaDB

O banco de dados escolhido foi o MariaDB na versão 10.6 e os acessos do banco de dados como administrador são:

```txt
Usuário: admin
Senha: admin123
```

Os endereços de IP do container são:

```txt
padrão: 171.0.0.2:3306
local: 127.0.0.1:3306
```

#### phpMyAdmin

Foi escolhida a versão 5.2 do phpMyAdmin, pois é a última versão disponível no momento. O acesso ao phpMyAdmin já vem por padrão o usuário de administrador do banco de dados. Os endereços de IP do container são:

```txt
padrão: 171.0.0.3:80
local: 127.0.0.1:8080
```

### Nginx

O servidor escolhido foi o Nginx na versão 1.22 e os endereços de IP do container são:

```txt
padrão: 171.0.0.4:80
local: 127.0.0.1:80
```

### PHP

A versão escolhida do PHP foi a 8.1 e o endereço de IP do container é:

```txt
padrão: 171.0.0.5
```

### Redis

O versão escolhida do Redis foi a 7.0 e o endereço de IP do container é:

```txt
padrão: 171.0.0.6
```

### RabbitMQ

O serviço de mensageria escolhido foi o RabbitMQ na versão 3.9 e os endereços de IP do container são:

```txt
padrão: 171.0.0.7:15672
local: 127.0.0.1:15672
```

### Elasticsearch

O mecanismo de busca escolhido foi o Elasticsearch na versão 7.17 e os endereços de IP do container são:

```txt
padrão: 171.0.0.8:9200
local: 127.0.0.1:9200
```

#### Kibana

Foi escolhido o Kibana como interface para o mecanismo de busca do Elasticsearch, utilizando a versão 7.17 por compatibilidade. Os endereços de IP do container são:

```txt
padrão: 171.0.0.9:5601
local: 127.0.0.1:5601
```