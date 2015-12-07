function registrarEgresado(){
    $("#contenido").load(baseURL('cpanel/RegistrarEgresado'));
}

function listarEgresados(){
    $("#contenido").load(baseURL('CPanel/ListarEgresados'));   
}

function listarEmpresas(){
    $("#contenido").load(baseURL('CPanel/ListarEmpresas'));      
}

function listarPublicador(){
    $("#contenido").load(baseURL('CPanel/ListarPublicadores'));
}

function listarAdministradores(){
    $("#contenido").load(baseURL('CPanel/listarAdministradores'));   
}

function reporteEgresadosTrabajando(){
    $("#contenido").load(baseURL('CPanel/ReporteEgresadosTrabajando'));
}

function reporteEgresadosTitulados(){
    $("#contenido").load(baseURL('CPanel/ReporteEgresadosTitulados'));
}

function reporteEgresadosPorCarrera(){
    $("#contenido").load(baseURL('CPanel/ReporteEgresadosPorCarrera'));
}

function registrarPublicador(){
    $("#contenido").load(baseURL('CPanel/RegistrarPublicador'));
}

function registrarAdministrador(){
    $("#contenido").load(baseURL('CPanel/RegistrarAdministrador'));
}

function importarEgresado(){
    $("#contenido").load(baseURL('Importar'));
}

function menuReportes(){
    $("#contenido").load(baseURL('cpanel/reportes'));
}