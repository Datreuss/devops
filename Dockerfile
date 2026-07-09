name: biblioteca-auth-simulado
services:
  microservicio:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    restart: always
