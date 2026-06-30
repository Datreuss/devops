#!/bin/bash

echo "🚀 Iniciando el pipeline de despliegue local..."

# 1. Validar la sintaxis de Docker Compose
echo "🔍 Validando configuración de Docker Compose..."
docker compose config

if [ $? -ne 0 ]; then
    echo " Error en la sintaxis de Docker Compose. Abortando."
    exit 1
fi

# 2. Construir e iniciar los contenedores
echo "⚙️ Construyendo imágenes y levantando el entorno simulado..."
docker compose up -d --build

if [ $? -eq 0 ]; then
    echo "¡Entorno desplegado con éxito!"
    echo " Monitoreo listo:"
    echo "   - Microservicio Java"
    echo "   - Prometheus: http://localhost:9090"
    echo "   - Grafana Dashboard: http://localhost:3000 (User/Pass: admin/admin)"
else
    echo " Hubo un error al levantar los contenedores."
    exit 1
fi
