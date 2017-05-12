CREATE TABLE IF NOT EXISTS `categoria_usuario` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `depto` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `eps` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(120) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `escolaridad` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `estado_civil` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `estrato` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `facultad` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(70) DEFAULT NULL,
  `estado` int(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `parentesco` ( 
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `municipio` (
  `ID` varchar(5) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `ID_DEPTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_municipio_departamento_idx` (`ID_DEPTO`),
  CONSTRAINT `fk_municipio_departamento` FOREIGN KEY (`ID_DEPTO`) REFERENCES `depto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `programas` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `FACULTAD` int(11) DEFAULT NULL,
  `estado` int(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_programas_facultad_idx` (`FACULTAD`),
  CONSTRAINT `fk_programas_facultad` FOREIGN KEY (`FACULTAD`) REFERENCES `facultad` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `raza` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tipo_afiliado` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tipo_identificacion` (
  `ID` varchar(2) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tipo_regimen` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `categoria_afiliado` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `CUOTA_COT` int(11) DEFAULT NULL,
  `ID_REGIMEN` int(11) DEFAULT NULL,
  `COPAGO_COT` varchar(4) DEFAULT NULL,
  `CUOTA_BEN` int(11) DEFAULT NULL,
  `COPAGO_BEN` varchar(4) DEFAULT NULL,
  `MAX_COPAGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_categoria_afiliado_regimem_idx` (`ID_REGIMEN`),
  CONSTRAINT `fk_categoria_afiliado_regimem` FOREIGN KEY (`ID_REGIMEN`) REFERENCES `tipo_regimen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `ID_CATEGORIA_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tipo_usuario_categoria_usuario_idx` (`ID_CATEGORIA_USUARIO`),
  CONSTRAINT `fk_tipo_usuario_categoria_usuario` FOREIGN KEY (`ID_CATEGORIA_USUARIO`) REFERENCES `categoria_usuario` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `usuarios_sistema` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDENTIFICACION` varchar(20) NOT NULL,
  `NOMBRES` varchar(60) NOT NULL,
  `APELLIDOS` varchar(60) NOT NULL,
  `LOGIN` varchar(20) NOT NULL,
  `CONTRASENA` varchar(250) NOT NULL,
  `REGISTRO` varchar(30) DEFAULT NULL,
  `ACTIVO` int(11) DEFAULT NULL,
  `CARGO` varchar(50) DEFAULT NULL,
  `CELULAR` varchar(10) DEFAULT NULL,
  `TELEFONO` varchar(8) DEFAULT NULL,
  `EXTENSION` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `paciente` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_APERTURA` date DEFAULT NULL,
  `NOMBRE1` varchar(20) DEFAULT NULL,
  `NOMBRE2` varchar(20) DEFAULT NULL,
  `APELLIDO1` varchar(30) DEFAULT NULL,
  `APELLIDO2` varchar(30) DEFAULT NULL,
  `TIPO_IDENTIFICACION` varchar(2) NOT NULL,
  `IDENTIFICACION` varchar(20) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `DEPTO_NACIMIENTO` int(11) DEFAULT NULL,
  `MUNICIPIO_NACIMIENTO` varchar(3) DEFAULT NULL,
  `DIRECCION` varchar(60) DEFAULT NULL,
  `TELEFONO` varchar(30) DEFAULT NULL,
  `DEPTO_RESIDENCIA` int(11) DEFAULT NULL,
  `MUNICIPIO_RESIDENCIA` varchar(3) DEFAULT NULL,
  `ZONA_RESIDENCIA` char(1) DEFAULT NULL,
  `EPS` int(11) DEFAULT NULL,
  `TIPO_REGIMEN` int(11) DEFAULT NULL,
  `TIPO_AFILIADO` int(11) DEFAULT NULL,
  `CATEGORIA_AFILIADO` int(11) DEFAULT NULL,
  `ESTRATO` int(11) DEFAULT NULL,
  `PERSONA_RESPONSABLE` varchar(60) DEFAULT NULL,
  `PARENTESCO` int(11) DEFAULT NULL,
  `DIRECCION_PRESPONSABLE` varchar(60) DEFAULT NULL,
  `TELEFONO_PRESPONSABLE` varchar(30) DEFAULT NULL,
  `RAZA` int(11) DEFAULT NULL,
  `ESCOLARIDAD` int(11) DEFAULT NULL,
  `ESTADO_CIVIL` int(11) DEFAULT NULL,
  `OCUPACION` varchar(30) DEFAULT NULL,
  `ESTADO` varchar(1) DEFAULT NULL,
  `CARPETA` varchar(20) DEFAULT NULL,
  `FACULTAD` int(11) DEFAULT NULL,
  `PROGRAMA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_paciente_tipo_identificacion_idx` (`TIPO_IDENTIFICACION`),
  KEY `fk_paciente_dep_nacimiento_idx` (`DEPTO_NACIMIENTO`),
  KEY `fk_paciente_municipio_nacimiento_idx` (`MUNICIPIO_NACIMIENTO`),
  KEY `fk_paciente_dep_residencia_idx` (`DEPTO_RESIDENCIA`),
  KEY `fk_paciente_municipio_residencia_idx` (`MUNICIPIO_RESIDENCIA`),
  KEY `fk_paciente_eps_idx` (`EPS`),
  KEY `fk_paciente_tipo_regimen_idx` (`TIPO_REGIMEN`),
  KEY `fk_paciente_tipo_afiliado_idx` (`TIPO_AFILIADO`),
  KEY `fk_paciente_categoria_afiliado_idx` (`CATEGORIA_AFILIADO`),
  KEY `fk_paciente_estrato_idx` (`ESTRATO`),
  KEY `fk_paciente_parentesco_idx` (`PARENTESCO`),
  KEY `fk_paciente_raza_idx` (`RAZA`),
  KEY `fk_paciente_escolaridad_idx` (`ESCOLARIDAD`),
  KEY `fk_paciente_estado_civil_idx` (`ESTADO_CIVIL`),
  KEY `fk_paciente_facultad_idx` (`FACULTAD`),
  KEY `fk_paciente_programa_idx` (`PROGRAMA`),
  CONSTRAINT `fk_paciente_categoria_afiliado` FOREIGN KEY (`CATEGORIA_AFILIADO`) REFERENCES `categoria_afiliado` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_dep_nacimiento` FOREIGN KEY (`DEPTO_NACIMIENTO`) REFERENCES `depto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_dep_residencia` FOREIGN KEY (`DEPTO_RESIDENCIA`) REFERENCES `depto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_eps` FOREIGN KEY (`EPS`) REFERENCES `eps` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_escolaridad` FOREIGN KEY (`ESCOLARIDAD`) REFERENCES `escolaridad` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_estado_civil` FOREIGN KEY (`ESTADO_CIVIL`) REFERENCES `estado_civil` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_estrato` FOREIGN KEY (`ESTRATO`) REFERENCES `estrato` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_facultad` FOREIGN KEY (`FACULTAD`) REFERENCES `facultad` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_municipio_nacimiento` FOREIGN KEY (`MUNICIPIO_NACIMIENTO`) REFERENCES `municipio` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_municipio_residencia` FOREIGN KEY (`MUNICIPIO_RESIDENCIA`) REFERENCES `municipio` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_parentesco` FOREIGN KEY (`PARENTESCO`) REFERENCES `parentesco` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_programa` FOREIGN KEY (`PROGRAMA`) REFERENCES `programas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_raza` FOREIGN KEY (`RAZA`) REFERENCES `raza` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_tipo_afiliado` FOREIGN KEY (`TIPO_AFILIADO`) REFERENCES `tipo_afiliado` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_tipo_identificacion` FOREIGN KEY (`TIPO_IDENTIFICACION`) REFERENCES `tipo_identificacion` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_tipo_regimen` FOREIGN KEY (`TIPO_REGIMEN`) REFERENCES `tipo_regimen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `diagnosticocie10_odo` (
  `ID` varchar(6) NOT NULL,
  `NOMBRE` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `grupo_usuario_tipo` (
  `id_usuario` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_tipo`),
  KEY `fk_grupo_tipo_idx` (`id_tipo`),
  CONSTRAINT `fk_grupo_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_grupo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios_sistema` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `actualizacion_odo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PACIENTE` int(11) DEFAULT NULL,
  `ACOMPANANTE` varchar(40) DEFAULT NULL,
  `TELEFONO` varchar(40) DEFAULT NULL,
  `CELULAR` varchar(40) DEFAULT NULL,
  `PARENTESCO` varchar(30) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(5) DEFAULT NULL,
  `TIPO` varchar(40) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_actualizacion_odo_paciente_idx` (`ID_PACIENTE`),
  KEY `fk_actualizacion_odo_usuariosistema_idx` (`ID_USUARIO`),
  CONSTRAINT `fk_actualizacion_odo_paciente` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `paciente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_actualizacion_odo_usuariosistema` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios_sistema` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `obs_odontograma` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ACTUALIZACION` int(11) DEFAULT NULL,
  `OCLUSION` varchar(7) DEFAULT NULL,
  `CARIES` varchar(2) DEFAULT NULL,
  `PERDIDOS` varchar(2) DEFAULT NULL,
  `OBTURADOS` varchar(2) DEFAULT NULL,
  `OBS` text,
  PRIMARY KEY (`ID`),
  KEY `fk_obs_odontograma_actualizacion_idx` (`ID_ACTUALIZACION`),
  CONSTRAINT `fk_obs_odontograma_actualizacion` FOREIGN KEY (`ID_ACTUALIZACION`) REFERENCES `actualizacion_odo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tipodiagnostico` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `diagnostico_odo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ACTUALIZACION` int(11) DEFAULT NULL,
  `DX` varchar(8) DEFAULT NULL,
  `DX1` varchar(8) DEFAULT NULL,
  `DX2` varchar(8) DEFAULT NULL,
  `DX3` varchar(8) DEFAULT NULL,
  `NDX` text,
  `NDX1` text,
  `NDX2` text,
  `NDX3` text,
  `TIPODIAGNOSTICO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_diagnostico_odo_actualizcion_idx` (`ID_ACTUALIZACION`),
  KEY `fk_diagnostico_odo_tipo_diagnostico_idx` (`TIPODIAGNOSTICO`),
  CONSTRAINT `fk_diagnostico_odo_actualizcion` FOREIGN KEY (`ID_ACTUALIZACION`) REFERENCES `actualizacion_odo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_diagnostico_odo_tipo_diagnostico` FOREIGN KEY (`TIPODIAGNOSTICO`) REFERENCES `tipodiagnostico` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `listado_ant_odon` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `FAMILIAR` varchar(1) DEFAULT NULL,
  `PERSONAL` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `ant_odo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ACTUALIZACION` int(11) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `RESULTADO` varchar(2) DEFAULT NULL,
  `TIPO` varchar(2) DEFAULT NULL,
  `ID_ANT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_antecedente_odo_actualizacion_odo_idx` (`ID_ACTUALIZACION`),
  KEY `fk_antecedente_odo_antecedente_idx` (`ID_ANT`),
  CONSTRAINT `fk_antecedente_odo_actualizacion_odo` FOREIGN KEY (`ID_ACTUALIZACION`) REFERENCES `actualizacion_odo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_antecedente_odo_antecedente` FOREIGN KEY (`ID_ANT`) REFERENCES `listado_ant_odon` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1409 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`tipo_cita_med` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`cita_medica_med` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_PROGRAMADA` DATETIME DEFAULT NULL,
  `HORA_INICIO` TIME DEFAULT NULL,
  `HORA_FIN` TIME DEFAULT NULL,
  `tipo_cita_ID` int(11) NOT NULL,
  `ESTADO` VARCHAR(10) DEFAULT NULL,
  `usuarios_sistema_ID` int(11) NOT NULL,
  `paciente_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_cita_medica_tipo_cita1_idx` (`tipo_cita_ID`),
  UNIQUE KEY `FECHA_PROGRAMADA_UNIQUE` (`FECHA_PROGRAMADA`),
  KEY `fk_cita_medica_usuarios_sistema1_idx` (`usuarios_sistema_ID`),
  KEY `fk_cita_medica_paciente1_idx` (`paciente_ID`),
  CONSTRAINT `fk_cita_medica_tipo_cita1`
    FOREIGN KEY (`tipo_cita_ID`)
    REFERENCES `divsalud-bd`.`tipo_cita_med` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cita_medica_usuarios_sistema1`
    FOREIGN KEY (`usuarios_sistema_ID`)
    REFERENCES `divsalud-bd`.`usuarios_sistema` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cita_medica_paciente1`
    FOREIGN KEY (`paciente_ID`)
    REFERENCES `divsalud-bd`.`paciente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`acompaniante_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(70) DEFAULT NULL,
  `telefono` VARCHAR(15) DEFAULT NULL,
  `celular` VARCHAR(15) DEFAULT NULL,
  `parentesco_ID` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_acompaniante_med_parentesco1_idx` (`parentesco_ID`),
  CONSTRAINT `fk_acompaniante_med_parentesco1`
    FOREIGN KEY (`parentesco_ID`)
    REFERENCES `divsalud-bd`.`parentesco` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`diagnostico_med` (
  `idx` int(11) NOT NULL,
  `tipo_diagnostico` VARCHAR(100) DEFAULT NULL,
  `impresion_diagnostico_med_idx` int(11) NOT NULL, /* REFERENCIA? */
  PRIMARY KEY (`idx`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`signos_vitales_med` (
  `idx` int(11) NOT NULL,
  `peso` DECIMAL(4,2) DEFAULT NULL,
  `talla` DECIMAL(4,2) DEFAULT NULL,
  `imc` DECIMAL(4,2) DEFAULT NULL,
  `temperatura` DECIMAL(4,2) DEFAULT NULL,
  `frec_cardiaca` DECIMAL(4,2) DEFAULT NULL,
  `frec_respiratoria` VARCHAR(4) DEFAULT NULL,
  PRIMARY KEY (`idx`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`ginecostetricos_med` (
  `idx` int(11) NOT NULL,
  `fecha_ultima_mestruacion` DATE DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `P` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL,
  `M` int(11) DEFAULT NULL,
  `fecha_ultimo_parto` DATE DEFAULT NULL,
  `metodo_planificacion` VARCHAR(2000) DEFAULT NULL,
  `citologia` VARCHAR(2000) DEFAULT NULL,
  PRIMARY KEY (`idx`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`consulta_medica_med` (
  `idx` int(11) NOT NULL,
  `fecha` DATE DEFAULT NULL,
  `motivo` VARCHAR(2000) DEFAULT NULL,
  `enfermedad_actual` VARCHAR(2000) DEFAULT NULL,
  `analisis` VARCHAR(2000) DEFAULT NULL,
  `paciente_ID` int(11) NOT NULL,
  `acompaniante_med_idx` int(11) NOT NULL,
  `diagnostico_med_idx` int(11) NOT NULL,
  `signos_vitales_med_idx` int(11) NOT NULL,
  `ginecostetricos_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_consulta_medica_med_paciente1_idx` (`paciente_ID`),
  KEY `fk_consulta_medica_med_acompaniante_med1_idx` (`acompaniante_med_idx`),
  KEY `fk_consulta_medica_med_diagnostico_med1_idx` (`diagnostico_med_idx`),
  KEY `fk_consulta_medica_med_signos_vitales_med1_idx` (`signos_vitales_med_idx`),
  KEY `fk_consulta_medica_med_ginecostetricos_med1_idx` (`ginecostetricos_med_idx`),
  CONSTRAINT `fk_consulta_medica_med_paciente1`
    FOREIGN KEY (`paciente_ID`)
    REFERENCES `divsalud-bd`.`paciente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_medica_med_acompaniante_med1`
    FOREIGN KEY (`acompaniante_med_idx`)
    REFERENCES `divsalud-bd`.`acompaniante_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_medica_med_diagnostico_med1`
    FOREIGN KEY (`diagnostico_med_idx`)
    REFERENCES `divsalud-bd`.`diagnostico_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_medica_med_signos_vitales_med1`
    FOREIGN KEY (`signos_vitales_med_idx`)
    REFERENCES `divsalud-bd`.`signos_vitales_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_medica_med_ginecostetricos_med1`
    FOREIGN KEY (`ginecostetricos_med_idx`)
    REFERENCES `divsalud-bd`.`ginecostetricos_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`ant_familiares_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`idx`))
  ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`ant_familiar_consulta_med` (
  `idx` int(11) NOT NULL,
  `observaciones` VARCHAR(2000) DEFAULT NULL,
  `padre` int(1) DEFAULT NULL,
  `abuelo_p` int(1) DEFAULT NULL,
  `abuela_p` int(1) DEFAULT NULL,
  `madre` int(1) DEFAULT NULL,
  `abuelo_m` int(1) DEFAULT NULL,
  `abuela_m` int(1) DEFAULT NULL,
  `hermanos` int(1) DEFAULT NULL,
  `consulta_medica_med_idx` int(11) NOT NULL,
  `ant_familiares_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_ant_familiar_consulta_med_consulta_medica_med1_idx` (`consulta_medica_med_idx`),
  KEY `fk_ant_familiar_consulta_med_ant_familiares_med1_idx` (`ant_familiares_med_idx`),
  CONSTRAINT `fk_ant_familiar_consulta_med_consulta_medica_med1`
    FOREIGN KEY (`consulta_medica_med_idx`)
    REFERENCES `divsalud-bd`.`consulta_medica_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ant_familiar_consulta_med_ant_familiares_med1`
    FOREIGN KEY (`ant_familiares_med_idx`)
    REFERENCES `divsalud-bd`.`ant_familiares_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`alergeno_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(100) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`tipo_alergeno_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(100) DEFAULT NULL,
  `alergeno_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_tipo_alergeno_med_alergeno_med1_idx` (`alergeno_med_idx`),
  CONSTRAINT `fk_tipo_alergeno_med_alergeno_med1`
    FOREIGN KEY (`alergeno_med_idx`)
    REFERENCES `divsalud-bd`.`alergeno_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`habitos_otros_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`))
  ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`habitos_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(100) DEFAULT NULL,
  `descripcion` VARCHAR(1000) DEFAULT NULL,
  `estado` BINARY(2) DEFAULT NULL,
  `consulta_medica_med_idx` int(11) NOT NULL,
  `habitos_otros_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_habitos_med_consulta_medica_med1_idx` (`consulta_medica_med_idx`),
  KEY `fk_habitos_med_habitos_otros_med1_idx` (`habitos_otros_med_idx`),
  CONSTRAINT `fk_habitos_med_consulta_medica_med1`
    FOREIGN KEY (`consulta_medica_med_idx`)
    REFERENCES `divsalud-bd`.`consulta_medica_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitos_med_habitos_otros_med1`
    FOREIGN KEY (`habitos_otros_med_idx`)
    REFERENCES `divsalud-bd`.`habitos_otros_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`procedimientos_cups_med` (
  `codigo` int(11) NOT NULL,
  `descripcion` VARCHAR(1000) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`sistema_cuerpo_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`consulta_sistemas_cuerpo_med` (
  `idx` int(11) NOT NULL,
  `estado` int(1) DEFAULT NULL,
  `observaciones` VARCHAR(2000) DEFAULT NULL,
  `consulta_medica_med_idx` int(11) NOT NULL,
  `sistema_cuerpo_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_consulta_sistemas_cuerpo_med_consulta_medica_med1_idx` (`consulta_medica_med_idx`),
  KEY `fk_consulta_sistemas_cuerpo_med_sistema_cuerpo_med1_idx` (`sistema_cuerpo_med_idx`),
  CONSTRAINT `fk_consulta_sistemas_cuerpo_med_consulta_medica_med1`
    FOREIGN KEY (`consulta_medica_med_idx`)
    REFERENCES `divsalud-bd`.`consulta_medica_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_sistemas_cuerpo_med_sistema_cuerpo_med1`
    FOREIGN KEY (`sistema_cuerpo_med_idx`)
    REFERENCES `divsalud-bd`.`sistema_cuerpo_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`patologicos_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`patologico_consulta_med` (
  `idx` int(11) NOT NULL,
  `estado` int(1) DEFAULT NULL,
  `descripcion` VARCHAR(1000) DEFAULT NULL,
  `consulta_medica_med_idx` int(11) NOT NULL,
  `patologicos_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_patologico_consulta_med_consulta_medica_med1_idx` (`consulta_medica_med_idx`),
  KEY `fk_patologico_consulta_med_patologicos_med1_idx` (`patologicos_med_idx`),
  CONSTRAINT `fk_patologico_consulta_med_consulta_medica_med1`
    FOREIGN KEY (`consulta_medica_med_idx`)
    REFERENCES `divsalud-bd`.`consulta_medica_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patologico_consulta_med_patologicos_med1`
    FOREIGN KEY (`patologicos_med_idx`)
    REFERENCES `divsalud-bd`.`patologicos_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`medicamento_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(300) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL,
  `concentracion` VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (`idx`))
  ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`via_administracion_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(45) DEFAULT NULL,
  `medicamento_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_via_administracion_med_medicamento_med1_idx` (`medicamento_med_idx`),
  CONSTRAINT `fk_via_administracion_med_medicamento_med1`
    FOREIGN KEY (`medicamento_med_idx`)
    REFERENCES `divsalud-bd`.`medicamento_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`medicamento_consulta_med` (
  `idx` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `dosis` VARCHAR(200) DEFAULT NULL,
  `consulta_medica_med_idx` int(11) NOT NULL,
  `medicamento_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_medicamento_consulta_med_consulta_medica_med1_idx` (`consulta_medica_med_idx`),
  KEY `fk_medicamento_consulta_med_medicamento_med1_idx` (`medicamento_med_idx`),
  CONSTRAINT `fk_medicamento_consulta_med_consulta_medica_med1`
    FOREIGN KEY (`consulta_medica_med_idx`)
    REFERENCES `divsalud-bd`.`consulta_medica_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicamento_consulta_med_medicamento_med1`
    FOREIGN KEY (`medicamento_med_idx`)
    REFERENCES `divsalud-bd`.`medicamento_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`presentacion_medicamento_med` (
  `idx` int(11) NOT NULL,
  `nombre` VARCHAR(45) DEFAULT NULL,
  `medicamento_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_presentacion_medicamento_med_medicamento_med1_idx` (`medicamento_med_idx`),
  CONSTRAINT `fk_presentacion_medicamento_med_medicamento_med1`
    FOREIGN KEY (`medicamento_med_idx`)
    REFERENCES `divsalud-bd`.`medicamento_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`consulta_tipo_alergeno_med` (
  `idx` int(11) NOT NULL,
  `consulta_medica_med_idx` int(11) NOT NULL,
  `tipo_alergeno_med_idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_consulta_tipo_alergeno_med_consulta_medica_med1_idx` (`consulta_medica_med_idx`),
  KEY `fk_consulta_tipo_alergeno_med_tipo_alergeno_med1_idx` (`tipo_alergeno_med_idx`),
  CONSTRAINT `fk_consulta_tipo_alergeno_med_consulta_medica_med1`
    FOREIGN KEY (`consulta_medica_med_idx`)
    REFERENCES `divsalud-bd`.`consulta_medica_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_tipo_alergeno_med_tipo_alergeno_med1`
    FOREIGN KEY (`tipo_alergeno_med_idx`)
    REFERENCES `divsalud-bd`.`tipo_alergeno_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`quirurgico_med` (
  `idx` int(11) NOT NULL,
  `consulta_medica_med_idx` int(11) NOT NULL,
  `procedimientos_cups_med_codigo` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_quirurgico_med_consulta_medica_med1_idx` (`consulta_medica_med_idx`),
  KEY `fk_quirurgico_med_procedimientos_cups_med1_idx` (`procedimientos_cups_med_codigo`),
  CONSTRAINT `fk_quirurgico_med_consulta_medica_med1`
    FOREIGN KEY (`consulta_medica_med_idx`)
    REFERENCES `divsalud-bd`.`consulta_medica_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quirurgico_med_procedimientos_cups_med1`
    FOREIGN KEY (`procedimientos_cups_med_codigo`)
    REFERENCES `divsalud-bd`.`procedimientos_cups_med` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`enfermedades_cie10_med` (
  `codigo` int(11) NOT NULL,
  `descripcion` VARCHAR(200) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`diagnostico_enfermedades_cie10_med` (
  `diagnostico_med_idx` int(11) NOT NULL,
  `enfermedades_cie10_med_codigo` int(11) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_diagnostico_med_has_enfermedades_cie10_med_enfermedades__idx` (`enfermedades_cie10_med_codigo`),
  KEY `fk_diagnostico_med_has_enfermedades_cie10_med_diagnostico_m_idx` (`diagnostico_med_idx`),
  CONSTRAINT `fk_diagnostico_med_has_enfermedades_cie10_med_diagnostico_med1`
    FOREIGN KEY (`diagnostico_med_idx`)
    REFERENCES `divsalud-bd`.`diagnostico_med` (`idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostico_med_has_enfermedades_cie10_med_enfermedades_ci1`
    FOREIGN KEY (`enfermedades_cie10_med_codigo`)
    REFERENCES `divsalud-bd`.`enfermedades_cie10_med` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `divsalud-bd`.`user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`))
ENGINE = InnoDB  DEFAULT CHARSET=utf8;
