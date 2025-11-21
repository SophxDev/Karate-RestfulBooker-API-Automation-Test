<div align="center">

# 🧪 QA Automation – API Bookings con Karate DSL

Automatización de pruebas **API REST** sobre el servicio de reservas _Restful-Booker_, usando  
**Karate DSL + JUnit 5 + Maven + Allure Reports**.

</div>

---

## 🚀 Objetivo del proyecto

Este repositorio contiene un pequeño framework de **QA Automation para pruebas de API** sobre el dominio de reservas (bookings).  

Está pensado como proyecto de práctica / portafolio para:

- Diseñar y estructurar tests de API con **Karate DSL**  
- Ejecutarlos desde **Maven / JUnit 5**  
- Integrar con **Allure** para reporting  
- Manejar escenarios de **creación, consulta, actualización y eliminación de bookings**

> 🔎 Nota: La API pública de Restful-Booker y sus mirrors (`herokuapp`, `onrender`) pueden devolver
> **timeouts (504/SocketTimeout)** o **códigos 418 (I'm a Teapot)** por limitaciones del entorno.
> El framework está preparado para eso y los fallos reportados son del entorno, no de la lógica de pruebas.

---

## 🧰 Tech stack

- **Lenguaje:** Java 17  
- **Framework de pruebas API:** [Karate DSL](https://karatelabs.github.io/karate/) (`karate-junit5`)  
- **Runner de tests:** JUnit 5 + Maven Surefire  
- **Build tool:** Maven  
- **Reporting:** Allure + logs de Karate  
- **Arquitectura de tests:**  
  - Features organizados por dominio (`bookings`, `auth`, `helpers`, `common`)  
  - Reutilización de escenarios (`call`, `callonce`)  
  - Configuración centralizada en `karate-config.js`

---

## 📂 Estructura principal del proyecto

```text
qa-karate-api-bookings
│
├─ pom.xml                          # Configuración Maven, dependencias y plugins
│
├─ src
│   └─ test
│      ├─ java
│      │   ├─ runners
│      │   │   └─ BookingsRunner.java   # Runner JUnit5 que ejecuta los features de bookings
│      │   ├─ hooks/                    # (Opcional) Hooks / utilidades para tests
│      │   └─ utils/                    # (Opcional) Clases de apoyo
│      │
│      └─ resources
│          ├─ karate-config.js          # Configuración global de Karate (baseUrl, timeouts, logs)
│          ├─ data
│          │   └─ create-booking.json   # Payloads de ejemplo para crear booking
│          └─ features
│              ├─ auth                  # Features de autenticación (token / auth)
│              ├─ bookings              # Casos de prueba de bookings (CRUD)
│              ├─ common                # Features reutilizables (fragments / flows comunes)
│              ├─ helpers               # Helpers para crear y devolver IDs, etc.
│              └─ responses             # (Opcional) Ejemplos de respuestas esperadas

```

---

## 🌐 API bajo prueba
El framework apunta a la API pública de Restful-Booker, o a uno de sus mirrors:

https://restful-booker.herokuapp.com

https://restful-booker.onrender.com

La URL base se controla desde:

// src/test/resources/karate-config.js

---

## 🧪 Cómo ejecutar los tests
1️⃣ Requisitos previos:

- Java 17 instalado y configurado en JAVA_HOME

- Maven 3.8+ instalado (mvn -v)
  
- Git (si clonas el repo)

- (Opcional) Allure Commandline para generar reportes bonitos


2️⃣ Clonar el repositorio:
```bash
git clone https://github.com/TU-USUARIO/qa-karate-api-bookings.git
cd qa-karate-api-bookings
```

3️⃣ Ejecutar todos los escenarios de bookings
```bash
mvn clean test -Dtest=BookingsRunner
```
Esto ejecuta todos los .feature dentro de features/bookings.


4️⃣ Ejecutar un feature específico
Por ejemplo, solo create-booking:
```bash
mvn clean test \
  -Dtest=BookingsRunner \
  -Dkarate.options="classpath:features/bookings/create-booking.feature"
```

---

## 📊 Reportes con Allure
El pom.xml está configurado para que Allure genere resultados en:

target/allure-results
Si tienes Allure CLI instalado, después de ejecutar los tests puedes lanzar:

allure serve target/allure-results

Esto abrirá un dashboard interactivo en el navegador con:

- Resumen de suites

- Escenarios pasados/fallidos

- Timeline

- Detalle de cada request/response
  
---

## ⚠️ Comportamiento inestable de la API (importante)
Como se trata de una API pública en entornos gratuitos (Heroku / Render), es normal encontrar:

- java.net.SocketTimeoutException: Read timed out

- Respuestas 418 I'm a Teapot en lugar de 200 OK

- Ocasionalmente errores 5xx del servidor

(Estos errores no vienen del framework, sino del entorno de la API bajo prueba.)


El objetivo de este repositorio es mostrar:

- Modelado de escenarios con Karate

- Organización de features y payloads

- Integración con Maven / JUnit 5 / Allure

- Manejo de flujos de booking (create / get / update / delete) a nivel de pruebas

En un entorno controlado (API interna, mock o ambiente estable) estos mismos features sirven como base para una suite de regresión de API real.

## 🧠 Próximas mejoras (ideas)
- Añadir perfiles por entorno (dev / qa / prod) usando karate.env

- Integrar un mock server (Karate Mock / JSON Server) para evitar la dependencia de la API externa

- Añadir ejecución en pipeline CI (GitHub Actions / GitLab CI)

- Agregar validaciones de esquema (JSON schema) y escenarios negativos

---

## ✨ Autora
Jaqueline Espino

Desarrolladora de Software en transición a QA Automation

Automatización de pruebas UI & API con Java, Karate, Selenium, Playwright, etc.

💼 Linkedin: https://www.linkedin.com/in/jaquelineespino/

🔗 GitHub: https://github.com/SophxDev
