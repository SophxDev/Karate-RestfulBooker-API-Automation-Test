function fn() {

  print(">>> CARGANDO KARATE CONFIG <<<");

  // Allure ON
  karate.configure('report', { showLog: true, showAllure: true });
  karate.configure('retry', { count: 3, interval: 2000 });

  var config = {};

  //Base URL global para todos los features
  config.baseUrl = 'https://restful-booker.herokuapp.com';

  //Headers globales opcionales
  config.defaultHeaders = { 'Content-Type': 'application/json' };

  // Tiempo de espera general para requests
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);

  // Activar logs (útil en debugging)
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  // Configuración por entorno (por si luego se quiere usar staging/dev/prod)
  var env = karate.env || 'dev';
  config.env = env;

  if (env === 'dev') {
    config.baseUrl = 'https://restful-booker.onrender.com';
  }

  return config;
}