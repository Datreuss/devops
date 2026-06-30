# DevOps Project - Infrastructure & Automation

Este repositorio contiene la configuración, scripts y manifiestos utilizados para la automatización de la infraestructura, containerización y el ciclo de vida del despliegue de la aplicación. 

El proyecto está diseñado bajo la filosofía de **Infraestructura como Código (IaC)** y **Prácticas GitOps/CI-CD** para garantizar entornos consistentes y replicables.

## Estructura del Proyecto

A continuación se detalla la arquitectura de archivos actual del repositorio:

```text
├── .github/
│   └── workflows/          # Configuración de pipelines de CI/CD automatizados
├── docker/                 # Entornos de contenedores y empaquetado de aplicaciones
│   ├── Dockerfile          # Definición de la imagen base de la aplicación
│   └── docker-compose.yml  # Orquestación de servicios en entornos locales
├── terraform/              # Código para aprovisionamiento de Infraestructura como Código (IaC)
│   ├── main.tf             # Definición de recursos principales
│   ├── variables.tf        # Variables de configuración del entorno
│   └── outputs.tf          # Valores de retorno de la infraestructura
├── k8s/                    # Manifiestos para despliegue en clústeres de Kubernetes
│   ├── deployment.yaml     # Configuración de pods y réplicas
│   ├── service.yaml        # Exposición de la red interna/externa
│   └── ingress.yaml        # Enrutamiento de tráfico HTTP/HTTPS
└── scripts/                # Scripts utilitarios en Bash para automatización local
