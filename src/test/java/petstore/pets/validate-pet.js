function fn(args) {
    var pet = args.pet;
    var expectedName = args.expectedName;
    var expectedStatus = args.expectedStatus;

    karate.log('== Validando mascota encontrada ==');
    karate.log('ID:', pet.id);
    karate.log('Nombre:', pet.name);
    karate.log('Status:', pet.status);

    // Validar nombre esperado
    if (pet.name !== expectedName) {
        karate.fail('Nombre de mascota incorrecto. Esperado: ' + expectedName + ', Obtenido: ' + pet.name);
    }

    // Validar estatus esperado
    if (pet.status !== expectedStatus) {
        karate.fail('Status de mascota incorrecto. Esperado: ' + expectedStatus + ', Obtenido: ' + pet.status);
    }

    karate.log('== Validación exitosa: nombre y status correctos ==');

    return { valid: true, petName: pet.name, petStatus: pet.status };
}
