# Ejercicio API Petstore - Karate Framework

El ejercicio contiene archivos, scripts, reportes y los insumos necesarios para su implementacion y reproduccion.

## Tecnologias y versiones

- Java JDK: 11
- Apache Maven: 3.9.12
- Karate Framework: 1.4.1
- JUnit 5: 5.9.1

## Estructura principal

- Feature principal: `src/test/java/petstore/pets/pet.feature`
- Runner: `src/test/java/petstore/runners/PetTestRunner.java`
- Configuracion global: `src/test/java/karate-config.js`
- Datos JSON: `src/test/resources/petstore/pets/pet.json`
- Configuracion de logs: `logback-test.xml`
- Hallazgos y conclusiones: `conclusiones.txt`

## Precondiciones

- Tener JDK 11 instalado y configurado en `JAVA_HOME`.
- Tener Maven 3.9.12 instalado y disponible en `PATH`.
- Tener conexion a internet (se consume `https://petstore.swagger.io/v2`).

## Ejecucion paso a paso

1. Abrir terminal en la raiz del proyecto.
2. Ejecutar:

```bash
mvn clean test
```

## Cobertura del ejercicio

- 01: Anadir una mascota a la tienda.
- 02: Consultar la mascota ingresada por ID.
- 03: Actualizar nombre de mascota y estatus a `sold`.
- 04: Consultar la mascota modificada por estatus `sold`.

## Reportes

- Reporte principal Karate: `target/karate-reports/karate-summary.html`
- Reporte detallado del feature: `target/karate-reports/petstore.pets.pet.html`
- Resultado de ejecucion Maven/Surefire: `target/surefire-reports/`

## Notas

- Los datos del request se cargan desde JSON y se parametrizan en ejecucion.
- Los escenarios estan en espanol y numerados para trazabilidad.
- Si vuelves a ejecutar, Maven regenera los reportes en la carpeta `target`.
