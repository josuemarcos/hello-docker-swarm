# 🚀 Hello Docker Swarm (Ruby + Nginx)

Este projeto é um **exemplo prático de orquestração de containers com Docker Swarm**, utilizando:

- **Ruby (Sinatra)** para a aplicação
- **Nginx** como *reverse proxy* e *load balancer*
- **Docker Swarm** para gerenciamento de serviços e réplicas

O objetivo é demonstrar conceitos fundamentais de containers, networking, escalabilidade e balanceamento de carga de forma simples e didática.

---

## 🧠 Conceitos abordados

- Dockerfile
- Docker Compose
- Docker Swarm
- Serviços replicados
- Routing Mesh
- Reverse Proxy
- Load Balancing
- Comunicação entre containers
- Headers HTTP e proxy (`Host`, `X-Forwarded-*`)

---

## 🏗️ Arquitetura

Cliente (Browser / curl)
↓
Nginx
(Reverse Proxy + Load Balancer)
↓
Docker Swarm (Routing Mesh)
↓
3x Containers Ruby (Sinatra)

yaml


- O cliente acessa apenas o **Nginx**
- O Nginx distribui as requisições entre múltiplas réplicas da aplicação
- Cada resposta informa qual container atendeu a requisição

---

## 📦 Serviços

### 🔹 Aplicação Ruby (Sinatra)

Cada réplica responde com:

- Mensagem "Olá Mundo"
- Hostname do container
- IP interno
- Timestamp

Isso permite visualizar claramente o **balanceamento de carga**.

### 🔹 Nginx

- Atua como **reverse proxy**
- Atua como **load balancer**
- Distribui requisições via *round-robin*
- Encaminha headers corretamente para a aplicação

---

## 📁 Estrutura do projeto

```text
.
├── app
│ ├── app.rb
│ ├── Gemfile
│ └── Dockerfile
│
├── nginx
│ ├── nginx.conf
│ └── Dockerfile
│
├── docker-compose.yml
└── README.md

```

---

## ⚙️ Pré-requisitos

- Docker
- Docker Compose
- Docker Swarm inicializado

Para inicializar o Swarm localmente:

```bash
docker swarm init
```

## ▶️ Como executar o projeto

###  Build das imagens

```bash
docker compose build
```

###  Deploy no Docker Swarm
```bash
docker stack deploy -c docker-compose.yml hello
```

###  Verificar serviços
```bash
docker service ls
```

### Saída esperada:
```bash
hello_app     replicated   3/3
hello_nginx   replicated   1/1
```

### 🌐 Acessando a aplicação
Abra no navegador ou use curl:
```bash
http://localhost:8080
```

### Exemplo de resposta:
```bash
Olá Mundo!
Hostname: hello_app.2.k8g9nryihx9g
IP: 10.0.1.12
Timestamp: 2026-01-13 20:15:42 +0000
```

### Ao atualizar a página várias vezes, você verá hostnames diferentes, comprovando o balanceamento de carga.



