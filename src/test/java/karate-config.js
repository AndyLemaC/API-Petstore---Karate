function fn() {
    var env = karate.env;
    karate.log('== Ambiente de ejecución:', env);

    // Configuración base del proyecto
    var config = {
        baseUrl: 'https://petstore.swagger.io/v2',
        readTimeout: 10000,
        connectTimeout: 5000
    };

    // Configurar la URL base de Karate globalmente
    karate.configure('url', config.baseUrl);
    karate.configure('readTimeout', config.readTimeout);
    karate.configure('connectTimeout', config.connectTimeout);
    karate.configure('ssl', true);

    return config;
}