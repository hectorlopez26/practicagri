use gripoo;

-- Crear la tabla cursos
CREATE TABLE cursos (
    idcodigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    horas_curso INT NOT NULL,
    horas_practica INT NOT NULL,
    total_horas INT NOT NULL
);

-- Crear la tabla convocatorias
CREATE TABLE convocatorias (
    idnumeroconvocatoria INT AUTO_INCREMENT PRIMARY KEY,
    idcurso INT NOT NULL,
    inicio DATE NOT NULL,
    fin DATE NOT NULL,
    horario VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    FOREIGN KEY (idcurso) REFERENCES cursos(idcodigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear la tabla programas
CREATE TABLE programas (
    idcurso INT NOT NULL,
    foap BOOLEAN NOT NULL,
    competencia_digital BOOLEAN NOT NULL,
    conforcat BOOLEAN NOT NULL,
    ada BOOLEAN NOT NULL,
    PRIMARY KEY (idcurso),
    FOREIGN KEY (idcurso) REFERENCES cursos(idcodigo) ON DELETE CASCADE ON UPDATE CASCADE
);
DROP TABLE IF EXISTS `contactos`;

CREATE TABLE `contactos` (
  `pk_contacto` int NOT NULL AUTO_INCREMENT,
  `dni_nie` varchar(9) DEFAULT NULL,
  `nombres` varchar(40) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `direccion` varchar(75) DEFAULT NULL,
  `codigo_postal` char(5) NOT NULL,
  `fk_provincia` int NOT NULL,
  `email` varchar(75) NOT NULL,
  `movil` varchar(9) NOT NULL,
  `telefono2` varchar(15) NOT NULL,
  `estatus` enum('desempleado','autónomo','trabajador') DEFAULT NULL,
  `nivel` enum('1 Titulacion','2 Secundaria (ESO)','3 Bachillerato / FP Medio') DEFAULT NULL,
  `fk_sector` int DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `scoring` float DEFAULT NULL,
  `rating` char(1) DEFAULT NULL,
  `tipo_contacto` enum('lead','en captación','alumno') DEFAULT NULL,
  `fecha_primer_contacto` date DEFAULT NULL,
  `fecha_captacion` date DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  `NIF` tinyint(1) DEFAULT NULL,
  `CV` tinyint(1) DEFAULT NULL,
  `Vida_Laboral` tinyint(1) DEFAULT NULL,
  `fecha_VL` date DEFAULT NULL,
  `contrato_trabajo` tinyint(1) DEFAULT NULL,
  `nomina` tinyint(1) DEFAULT NULL,
  `lopd` tinyint(1) DEFAULT NULL,
  `hoja_inscripcion` tinyint(1) DEFAULT NULL,
  `joven_no_cualificado` tinyint(1) DEFAULT NULL,
  `violencia_genero` tinyint(1) DEFAULT NULL,
  `mujeres` tinyint(1) DEFAULT NULL,
  `inmigrantes` tinyint(1) DEFAULT NULL,
  `discapacitado` tinyint(1) DEFAULT NULL,
  `comentarios_perfil` text,
  `asignado_a` char(5) DEFAULT NULL COMMENT 'Empleado que lleva el caso',
  PRIMARY KEY (`pk_contacto`),
  UNIQUE KEY `dni_nie` (`dni_nie`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `pk_empleado` char(5) NOT NULL,
  `empleado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pk_empleado`)
) ENGINE=InnoDB;

INSERT INTO `empleado` VALUES ('DISAH','Heryka Díaz Sandoval'),('MUCAM','Mari Carmen Martínez');

DROP TABLE IF EXISTS `llamadas`;
CREATE TABLE `llamadas` (
  `pk_llamada` int NOT NULL AUTO_INCREMENT,
  `campaign` int DEFAULT NULL,
  `fk_contacto` int DEFAULT NULL,
  `fecha_llamada` date NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `resultado` varchar(100) NOT NULL,
  `fk_convocatoria` int DEFAULT NULL,
  `proxima_llamada` date DEFAULT NULL,
  `fk_empleado` char(5) DEFAULT NULL,
  PRIMARY KEY (`pk_llamada`)
) ENGINE=InnoDB;




