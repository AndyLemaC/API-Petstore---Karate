# Ejercicio API Petstore - Karate Framework

El ejercicio automatiza pruebas sobre la API pública de [Petstore Swagger](https://petstore.swagger.io/) utilizando **Karate DSL**.

---

## ✅ Requisitos Previos

- Java JDK: 11
- Apache Maven: 3.9.12
- Karate Framework: 1.4.1
- JUnit 5: 5.9.1

---
## ⚙️ Configuración del Entorno de Desarrollo

### 1️⃣ Clonar el Repositorio

```bash
git clone https://github.com/AndyLemaC/api_test.git
cd petstore-api-test
```

### 2️⃣ Configurar IntelliJ IDEA

Instalar los siguientes plugins:

- Maven Integration  
- Cucumber (Gherkin)  
- Karate Plugin

### 3️⃣ Importar el Proyecto

1. Abrir IntelliJ IDEA  
2. Seleccionar **"Open"** y elegir el archivo `pom.xml`  
3. Marcar la opción **"Open as Project"**

---

## ▶️ Ejecución de Pruebas

### Desde IntelliJ IDEA

1. Navegar a `src/test/java/petstore/runners/UserTestRunner.java`  
2. Hacer clic derecho y seleccionar **"Run UserTestRunner"**

### Desde Línea de Comandos

```bash
# Ejecutar todas las pruebas
mvn clean test

# Ejecutar pruebas con tags y reporte detallado
mvn clean test -Dkarate.options="--tags ~@ignore"
```

---

## 🗂️ Estructura del Proyecto

```
api_petstore/
├── src/
│   └── test/
│       ├── java/
│       │   ├── karate-config.js                    # Configuracion global de Karate
│       │   └── petstore/
│       │       ├── pets/
│       │       │   ├── pet.feature                 # Escenarios de prueba API Petstore
│       │       │   └── validate-pet.js             # Utilidad de validacion de mascota
│       │       └── runners/
│       │           └── PetTestRunner.java          # Runner de pruebas
│       └── resources/
│           └── petstore/
│               └── pets/
│                   └── pet.json                    # Datos de prueba en JSON
├── target/                                         # Carpeta generada por Maven (reportes y resultados)
├── logback-test.xml                                # Configuracion de logs
├── pom.xml                                         # Configuracion Maven del proyecto
├── README.md                                       # Instrucciones de ejecucion
└── conclusiones.txt                                # Hallazgos y conclusiones del ejercici
```
---

## ❓ Cobertura del ejercicio

- 01: Anadir una mascota a la tienda.
- 02: Consultar la mascota ingresada por ID.
- 03: Actualizar nombre de mascota y estatus a `sold`.
- 04: Consultar la mascota modificada por estatus `sold`.

---

## 📊 Reportes

- Reporte principal Karate: `target/karate-reports/karate-summary.html`
- Reporte detallado del feature: `target/karate-reports/petstore.pets.pet.html`
- Resultado de ejecucion Maven/Surefire: `target/surefire-reports/`

