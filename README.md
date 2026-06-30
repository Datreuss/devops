# Proyecto DevOps: Microservicios con Monitoreo, Logging y CI/CD

Este repositorio contiene la configuración, el código y la infraestructura como código (IaC) para el despliegue, automatización y observabilidad de nuestra arquitectura basada en microservicios. El objetivo principal de este proyecto es garantizar un ciclo de vida de desarrollo de software (SDLC) ágil, seguro y altamente observable.

---

## Características Principales

* **Contenedorización Avanzada:** Microservicios empaquetados mediante Docker.
* **Orquestación y Simulación:** Entorno local robusto gestionado íntegramente con Docker Compose.
* **Logging Centralizado:** Recolección, indexación y análisis de logs en tiempo real para auditoría y depuración.
* **Monitoreo y Métricas:** Extracción de métricas de rendimiento del sistema con almacenamiento de series temporales.
* **Dashboards Personalizados:** Visualización unificada del tráfico, latencia y salud de las aplicaciones.
* **Automatización Integrada:** Ciclo de integración continua estructurado directamente sobre la arquitectura nativa de GitHub.

---

## Arquitectura y Stack Tecnológico

El entorno simulado está compuesto por los siguientes componentes tecnológicos:

* **Aplicación/Microservicio:** Node.js / Python / Go (expone endpoints de salud y métricas).
* **Colectores de Logs:** **Fluentd / Logstash / Promtail** (encargados de capturar los logs de los contenedores).
* **Almacenamiento de Logs:** **Elasticsearch / Loki** (motor de búsqueda e indexación de eventos).
* **Base de Datos de Métricas:** **Prometheus** (raspado activo de métricas en formato estándar).
* **Visualización:** **Grafana** (diseño de dashboards e integración de fuentes de datos de logs y métricas).
* **Infraestructura:** Docker & Docker Compose.

---

## Estrategia de Monitoreo y Observabilidad

Para cumplir con los estándares de producción y la evaluación de comportamiento del microservicio, se implementaron dos pilares fundamentales:

### 1. Sistema de Logging Centralizado
Todos los microservicios escriben sus logs en formato estructurado (JSON) a la salida estándar (`stdout`). El agente de logging intercepta estos flujos de manera no invasiva, los procesa y los almacena.
* **Uso:** Permite rastrear errores específicos, excepciones de código (`ERROR`, `CRITICAL`) y el flujo de las peticiones (`INFO`).
* **Acceso:** Configurado en Grafana mediante el datasource correspondiente (Loki/Elasticsearch).

### 2. Sistema de Monitoreo de Métricas
El microservicio expone un endpoint dedicado (`/metrics`) utilizando una librería cliente nativa. Prometheus realiza consultas periódicas (scraping) a este endpoint para consolidar las series temporales.[cite: 2]

---

## Métricas Clave de Desempeño (KPIs) y Dashboard

El **Dashboard Personalizado en Grafana** está diseñado para evaluar la calidad y el rendimiento del entorno mediante las siguientes métricas clave estructuradas bajo el método **RED** (Rate, Errors, Duration):[cite: 2]

| Categoría | Métrica Específica | Indicador de Calidad / Desempeño | Tipo de Gráfico |
| :--- | :--- | :--- | :--- |
| **Rendimiento** | **Tasa de Peticiones (Rate)** | Número de solicitudes por segundo (RPS) que procesa el microservicio. | Línea de tiempo |
| **Calidad** | **Tasa de Errores (Errors)** | Porcentaje de respuestas con estado HTTP 5xx u errores internos sobre el total de peticiones. | Gráfico de barras / Gauge |
| **Desempeño** | **Latencia / Duración (Duration)** | Tiempo de respuesta del microservicio (Percentiles p50, p95, p99) para detectar degradación. | Línea de tiempo / Histograma |
| **Infraestructura**| **Uso de CPU y Memoria** | Consumo de recursos de hardware del contenedor del microservicio. | Indicador numérico (Stat) |
| **Disponibilidad**| **Uptime (Salud)** | Estado de disponibilidad activa del microservicio basado en las sondas de live/ready. | Estado (Green/Red) |

---

## Requisitos Previos

Asegúrate de tener instalado lo siguiente en tu máquina local:[cite: 2]
* [Docker](https://docs.docker.com/get-docker/) (v20.10 o superior)[cite: 2]
* [Docker Compose](https://docs.docker.com/compose/install/) (v2.0 o superior)[cite: 2]
* [Git](https://git-scm.com/)[cite: 2]

---

## Instalación y Despliegue Local

Sigue estos pasos para levantar todo el entorno simulado (Microservicios + Stack de Observabilidad):[cite: 2]

1. **Clonar el repositorio y acceder a la rama de desarrollo:**[cite: 2]
   ```bash
   git clone [https://github.com/Datreuss/devops.git](https://github.com/Datreuss/devops.git)
   cd devops
   git checkout develop
