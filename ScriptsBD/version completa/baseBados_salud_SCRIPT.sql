--
-- Table structure for table `acompaniante_med`
--

DROP TABLE IF EXISTS `acompaniante_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acompaniante_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(70) DEFAULT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL,
  `CELULAR` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IDX`),
  KEY `FK_Relationship_56` (`ID`),
  CONSTRAINT `FK_Relationship_56` FOREIGN KEY (`ID`) REFERENCES `parentesco` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actualizacion_odo`
--

DROP TABLE IF EXISTS `actualizacion_odo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actualizacion_odo` (
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
  KEY `AK_FK_ACTUALIZACION_ODO_PACIENTE_IDX` (`ID_PACIENTE`),
  KEY `AK_FK_ACTUALIZACION_ODO_USUARIOSISTEMA_IDX` (`ID_USUARIO`),
  CONSTRAINT `FK_fk_actualizacion_odo_paciente` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `paciente` (`ID`),
  CONSTRAINT `FK_fk_actualizacion_odo_usuariosistema` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios_sistema` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alergeno_med`
--

DROP TABLE IF EXISTS `alergeno_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alergeno_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `IDX_TIPO_ALERGENO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `AK_NOMBRE_UNIQUE` (`NOMBRE`),
  KEY `FK_Relationship_61` (`IDX_TIPO_ALERGENO`),
  CONSTRAINT `FK_Relationship_61` FOREIGN KEY (`IDX_TIPO_ALERGENO`) REFERENCES `tipo_alergeno_med` (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ant_familiar_consulta_med`
--

DROP TABLE IF EXISTS `ant_familiar_consulta_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ant_familiar_consulta_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `OBSERVACIONES` varchar(2000) DEFAULT NULL,
  `PADRE` int(11) DEFAULT NULL,
  `ABUELO_P` int(11) DEFAULT NULL,
  `ABUELA_P` int(11) DEFAULT NULL,
  `MADRE` int(11) DEFAULT NULL,
  `ABUELO_M` int(11) DEFAULT NULL,
  `ABUELA_M` int(11) DEFAULT NULL,
  `HERMANOS` int(11) DEFAULT NULL,
  `CONSULTA_MEDICA_MED_IDX` int(11) NOT NULL,
  `ANT_FAMILIARES_MED_IDX` int(11) NOT NULL,
  PRIMARY KEY (`IDX`),
  KEY `AK_FK_ANT_FAMILIAR_CONSULTA_MED_CONSULTA_MEDICA_MED1_IDX` (`CONSULTA_MEDICA_MED_IDX`),
  KEY `AK_FK_ANT_FAMILIAR_CONSULTA_MED_ANT_FAMILIARES_MED1_IDX` (`ANT_FAMILIARES_MED_IDX`),
  CONSTRAINT `FK_fk_ant_familiar_consulta_med_ant_familiares_med1` FOREIGN KEY (`ANT_FAMILIARES_MED_IDX`) REFERENCES `ant_familiares_med` (`IDX`),
  CONSTRAINT `FK_fk_ant_familiar_consulta_med_consulta_medica_med1` FOREIGN KEY (`CONSULTA_MEDICA_MED_IDX`) REFERENCES `consulta_medica_med` (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ant_familiares_med`
--

DROP TABLE IF EXISTS `ant_familiares_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ant_familiares_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ant_odo`
--

DROP TABLE IF EXISTS `ant_odo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ant_odo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ACTUALIZACION` int(11) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `RESULTADO` varchar(2) DEFAULT NULL,
  `TIPO` varchar(2) DEFAULT NULL,
  `ID_ANT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AK_FK_ANTECEDENTE_ODO_ACTUALIZACION_ODO_IDX` (`ID_ACTUALIZACION`),
  KEY `AK_FK_ANTECEDENTE_ODO_ANTECEDENTE_IDX` (`ID_ANT`),
  CONSTRAINT `FK_fk_antecedente_odo_actualizacion_odo` FOREIGN KEY (`ID_ACTUALIZACION`) REFERENCES `actualizacion_odo` (`ID`),
  CONSTRAINT `FK_fk_antecedente_odo_antecedente` FOREIGN KEY (`ID_ANT`) REFERENCES `listado_ant_odon` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `categoria_afiliado`
--

DROP TABLE IF EXISTS `categoria_afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_afiliado` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `CUOTA_COT` int(11) DEFAULT NULL,
  `ID_REGIMEN` int(11) DEFAULT NULL,
  `COPAGO_COT` varchar(4) DEFAULT NULL,
  `CUOTA_BEN` int(11) DEFAULT NULL,
  `COPAGO_BEN` varchar(4) DEFAULT NULL,
  `MAX_COPAGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AK_FK_CATEGORIA_AFILIADO_REGIMEM_IDX` (`ID_REGIMEN`),
  CONSTRAINT `FK_fk_categoria_afiliado_regimem` FOREIGN KEY (`ID_REGIMEN`) REFERENCES `tipo_regimen` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `categoria_usuario`
--

DROP TABLE IF EXISTS `categoria_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_usuario` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `cita_medica_med`
--

DROP TABLE IF EXISTS `cita_medica_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cita_medica_med` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_PROGRAMADA` datetime DEFAULT NULL,
  `HORA_INICIO` time DEFAULT NULL,
  `HORA_FIN` time DEFAULT NULL,
  `TIPO_CITA_ID` int(11) NOT NULL,
  `USUARIOS_SISTEMA_ID` int(11) NOT NULL,
  `PACIENTE_ID` int(11) NOT NULL,
  `ESTADO` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AK_FK_CITA_MEDICA_TIPO_CITA1_IDX` (`TIPO_CITA_ID`),
  KEY `FK_Relationship_58` (`USUARIOS_SISTEMA_ID`),
  KEY `FK_Relationship_64` (`PACIENTE_ID`),
  CONSTRAINT `FK_Relationship_58` FOREIGN KEY (`USUARIOS_SISTEMA_ID`) REFERENCES `usuarios_sistema` (`ID`),
  CONSTRAINT `FK_Relationship_64` FOREIGN KEY (`PACIENTE_ID`) REFERENCES `paciente` (`ID`),
  CONSTRAINT `FK_fk_cita_medica_tipo_cita1` FOREIGN KEY (`TIPO_CITA_ID`) REFERENCES `tipo_cita_med` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `consulta_alergeno_med`
--

DROP TABLE IF EXISTS `consulta_alergeno_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta_alergeno_med` (
  `CON_IDX` int(11) NOT NULL,
  `IDX` int(11) NOT NULL,
  `OBSERVACIONES` longtext,
  PRIMARY KEY (`CON_IDX`,`IDX`),
  KEY `FK_Relationship_53` (`IDX`),
  CONSTRAINT `FK_Relationship_53` FOREIGN KEY (`IDX`) REFERENCES `alergeno_med` (`IDX`),
  CONSTRAINT `FK_Relationship_54` FOREIGN KEY (`CON_IDX`) REFERENCES `consulta_medica_med` (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `consulta_medica_med`
--

DROP TABLE IF EXISTS `consulta_medica_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta_medica_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` date DEFAULT NULL,
  `MOTIVO` longtext,
  `ENFERMEDAD_ACTUAL` longtext,
  `PESO` decimal(4,2) DEFAULT NULL,
  `TALLA` decimal(4,2) DEFAULT NULL,
  `IMC` decimal(4,2) DEFAULT NULL,
  `TEMPERATURA` decimal(4,2) DEFAULT NULL,
  `FREC_CARDIACA` decimal(4,2) DEFAULT NULL,
  `FREC_RESPIRATORIA` decimal(4,2) DEFAULT NULL,
  `ANALISIS` longtext,
  `ACOMPANIANTE_MED_IDX` int(11) DEFAULT NULL,
  `PACIENTE_IDX` int(11) DEFAULT NULL,
  `ID_MEDICO` varchar(20) NOT NULL,
  PRIMARY KEY (`IDX`),
  KEY `AK_FK_CONSULTA_MEDICA_MED_ACOMPANIANTE_MED1_IDX` (`ACOMPANIANTE_MED_IDX`),
  KEY `FK_Relationship_57` (`PACIENTE_IDX`),
  CONSTRAINT `FK_Relationship_57` FOREIGN KEY (`PACIENTE_IDX`) REFERENCES `paciente` (`ID`),
  CONSTRAINT `FK_fk_consulta_medica_med_acompaniante_med1` FOREIGN KEY (`ACOMPANIANTE_MED_IDX`) REFERENCES `acompaniante_med` (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `consulta_sistemas_cuerpo_med`
--

DROP TABLE IF EXISTS `consulta_sistemas_cuerpo_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta_sistemas_cuerpo_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO_` int(11) DEFAULT NULL,
  `OBSERVACIONES` varchar(2000) DEFAULT NULL,
  `CONSULTA_MEDICA_MED_IDX` int(11) NOT NULL,
  `SISTEMA_CUERPO_MED_IDX` int(11) NOT NULL,
  PRIMARY KEY (`IDX`),
  KEY `AK_FK_CONSULTA_SISTEMAS_CUERPO_MED_CONSULTA_MEDICA_MED1_IDX` (`CONSULTA_MEDICA_MED_IDX`),
  KEY `AK_FK_CONSULTA_SISTEMAS_CUERPO_MED_SISTEMA_CUERPO_MED1_IDX` (`SISTEMA_CUERPO_MED_IDX`),
  CONSTRAINT `FK_fk_consulta_sistemas_cuerpo_med_consulta_medica_med1` FOREIGN KEY (`CONSULTA_MEDICA_MED_IDX`) REFERENCES `consulta_medica_med` (`IDX`),
  CONSTRAINT `FK_fk_consulta_sistemas_cuerpo_med_sistema_cuerpo_med1` FOREIGN KEY (`SISTEMA_CUERPO_MED_IDX`) REFERENCES `sistema_cuerpo_med` (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `depto`
--

DROP TABLE IF EXISTS `depto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depto` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `diagnostico_odo`
--

DROP TABLE IF EXISTS `diagnostico_odo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnostico_odo` (
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
  KEY `AK_FK_DIAGNOSTICO_ODO_ACTUALIZCION_IDX` (`ID_ACTUALIZACION`),
  KEY `AK_FK_DIAGNOSTICO_ODO_TIPO_DIAGNOSTICO_IDX` (`TIPODIAGNOSTICO`),
  CONSTRAINT `FK_fk_diagnostico_odo_actualizcion` FOREIGN KEY (`ID_ACTUALIZACION`) REFERENCES `actualizacion_odo` (`ID`),
  CONSTRAINT `FK_fk_diagnostico_odo_tipo_diagnostico` FOREIGN KEY (`TIPODIAGNOSTICO`) REFERENCES `tipodiagnostico` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `diagnosticocie10_odo`
--

DROP TABLE IF EXISTS `diagnosticocie10_odo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosticocie10_odo` (
  `ID` varchar(6) NOT NULL,
  `NOMBRE` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `diagnosticos`
--

DROP TABLE IF EXISTS `diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosticos` (
  `CODIGO_CIE10` varchar(20) NOT NULL,
  `IDX_CONSULTA` int(11) NOT NULL,
  `IMPRESION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CIE10`,`IDX_CONSULTA`),
  KEY `FK_Relationship_52` (`IDX_CONSULTA`),
  CONSTRAINT `FK_Relationship_52` FOREIGN KEY (`IDX_CONSULTA`) REFERENCES `consulta_medica_med` (`IDX`),
  CONSTRAINT `FK_Relationship_55` FOREIGN KEY (`CODIGO_CIE10`) REFERENCES `enfermedades_cie10_med` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `enfermedades_cie10_med`
--

DROP TABLE IF EXISTS `enfermedades_cie10_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedades_cie10_med` (
  `CODIGO` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `eps`
--

DROP TABLE IF EXISTS `eps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eps` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(120) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `escolaridad`
--

DROP TABLE IF EXISTS `escolaridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escolaridad` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_civil` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `estrato`
--

DROP TABLE IF EXISTS `estrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estrato` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultad` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(70) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ginecostetricos_med`
--

DROP TABLE IF EXISTS `ginecostetricos_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ginecostetricos_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_ULTIMA_MESTRUACION` date DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `P` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL,
  `M` int(11) DEFAULT NULL,
  `FECHA_ULTIMO_PARTO` date DEFAULT NULL,
  `METODO_PLANIFICACION` varchar(2000) DEFAULT NULL,
  `CITOLOGIA` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `grupo_usuario_tipo`
--

DROP TABLE IF EXISTS `grupo_usuario_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_usuario_tipo` (
  `ID_USUARIO` int(11) NOT NULL,
  `ID_TIPO` int(11) NOT NULL,
  `LOGIN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`,`ID_TIPO`),
  KEY `AK_FK_GRUPO_TIPO_IDX` (`ID_TIPO`),
  CONSTRAINT `FK_fk_grupo_tipo` FOREIGN KEY (`ID_TIPO`) REFERENCES `tipo_usuario` (`ID`),
  CONSTRAINT `FK_fk_grupo_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios_sistema` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `habitos_med`
--

DROP TABLE IF EXISTS `habitos_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitos_med` (
  `ID_TIPO_HABITO` int(11) NOT NULL,
  `IDX_CONSULTA` int(11) NOT NULL,
  `DESCRIPCION` longtext,
  `CONSUME_SI_NO_EX` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_HABITO`,`IDX_CONSULTA`),
  KEY `FK_Relationship_62` (`IDX_CONSULTA`),
  CONSTRAINT `FK_Relationship_62` FOREIGN KEY (`IDX_CONSULTA`) REFERENCES `consulta_medica_med` (`IDX`),
  CONSTRAINT `FK_Relationship_63` FOREIGN KEY (`ID_TIPO_HABITO`) REFERENCES `tipo_habito` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `historico_ginecostetricos`
--

DROP TABLE IF EXISTS `historico_ginecostetricos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_ginecostetricos` (
  `IDX_CONSULTA` int(11) NOT NULL,
  `IDX_GINECOSTETRICOS` int(11) NOT NULL,
  `OBSERVACIONES` longtext,
  PRIMARY KEY (`IDX_CONSULTA`,`IDX_GINECOSTETRICOS`),
  KEY `FK_Relationship_65` (`IDX_GINECOSTETRICOS`),
  CONSTRAINT `FK_Relationship_65` FOREIGN KEY (`IDX_GINECOSTETRICOS`) REFERENCES `ginecostetricos_med` (`IDX`),
  CONSTRAINT `FK_Relationship_66` FOREIGN KEY (`IDX_CONSULTA`) REFERENCES `consulta_medica_med` (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `listado_ant_odon`
--

DROP TABLE IF EXISTS `listado_ant_odon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listado_ant_odon` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `FAMILIAR` varchar(1) DEFAULT NULL,
  `PERSONAL` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `medicamento_consulta_med`
--

DROP TABLE IF EXISTS `medicamento_consulta_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento_consulta_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `CANTIDAD` int(11) DEFAULT NULL,
  `DOSIS` varchar(200) DEFAULT NULL,
  `CONSULTA_MEDICA_MED_IDX` int(11) NOT NULL,
  `MEDICAMENTO_MED_IDX` varchar(20) NOT NULL,
  PRIMARY KEY (`IDX`),
  KEY `AK_FK_MEDICAMENTO_CONSULTA_MED_CONSULTA_MEDICA_MED1_IDX` (`CONSULTA_MEDICA_MED_IDX`),
  KEY `AK_FK_MEDICAMENTO_CONSULTA_MED_MEDICAMENTO_MED1_IDX` (`MEDICAMENTO_MED_IDX`),
  CONSTRAINT `FK_fk_medicamento_consulta_med_consulta_medica_med1` FOREIGN KEY (`CONSULTA_MEDICA_MED_IDX`) REFERENCES `consulta_medica_med` (`IDX`),
  CONSTRAINT `FK_fk_medicamento_consulta_med_medicamento_med1` FOREIGN KEY (`MEDICAMENTO_MED_IDX`) REFERENCES `medicamento_med` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `medicamento_med`
--

DROP TABLE IF EXISTS `medicamento_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento_med` (
  `CODIGO` varchar(20) NOT NULL,
  `VIA_IDX` int(11) NOT NULL,
  `PRE_IDX` int(11) NOT NULL,
  `NOMBRE` varchar(300) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `CONCENTRACION` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_Relationship_59` (`VIA_IDX`),
  KEY `FK_Relationship_60` (`PRE_IDX`),
  CONSTRAINT `FK_Relationship_59` FOREIGN KEY (`VIA_IDX`) REFERENCES `via_administracion_med` (`IDX`),
  CONSTRAINT `FK_Relationship_60` FOREIGN KEY (`PRE_IDX`) REFERENCES `presentacion_medicamento_med` (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `ID` varchar(5) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `ID_DEPTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AK_FK_MUNICIPIO_DEPARTAMENTO_IDX` (`ID_DEPTO`),
  CONSTRAINT `FK_fk_municipio_departamento` FOREIGN KEY (`ID_DEPTO`) REFERENCES `depto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `obs_odontograma`
--

DROP TABLE IF EXISTS `obs_odontograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs_odontograma` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ACTUALIZACION` int(11) DEFAULT NULL,
  `OCLUSION` varchar(7) DEFAULT NULL,
  `CARIES` varchar(2) DEFAULT NULL,
  `PERDIDOS` varchar(2) DEFAULT NULL,
  `OBTURADOS` varchar(2) DEFAULT NULL,
  `OBS` text,
  PRIMARY KEY (`ID`),
  KEY `AK_FK_OBS_ODONTOGRAMA_ACTUALIZACION_IDX` (`ID_ACTUALIZACION`),
  CONSTRAINT `FK_fk_obs_odontograma_actualizacion` FOREIGN KEY (`ID_ACTUALIZACION`) REFERENCES `actualizacion_odo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
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
  KEY `AK_FK_PACIENTE_TIPO_IDENTIFICACION_IDX` (`TIPO_IDENTIFICACION`),
  KEY `AK_FK_PACIENTE_DEP_NACIMIENTO_IDX` (`DEPTO_NACIMIENTO`),
  KEY `AK_FK_PACIENTE_MUNICIPIO_NACIMIENTO_IDX` (`MUNICIPIO_NACIMIENTO`),
  KEY `AK_FK_PACIENTE_DEP_RESIDENCIA_IDX` (`DEPTO_RESIDENCIA`),
  KEY `AK_FK_PACIENTE_MUNICIPIO_RESIDENCIA_IDX` (`MUNICIPIO_RESIDENCIA`),
  KEY `AK_FK_PACIENTE_EPS_IDX` (`EPS`),
  KEY `AK_FK_PACIENTE_TIPO_REGIMEN_IDX` (`TIPO_REGIMEN`),
  KEY `AK_FK_PACIENTE_TIPO_AFILIADO_IDX` (`TIPO_AFILIADO`),
  KEY `AK_FK_PACIENTE_CATEGORIA_AFILIADO_IDX` (`CATEGORIA_AFILIADO`),
  KEY `AK_FK_PACIENTE_ESTRATO_IDX` (`ESTRATO`),
  KEY `AK_FK_PACIENTE_PARENTESCO_IDX` (`PARENTESCO`),
  KEY `AK_FK_PACIENTE_RAZA_IDX` (`RAZA`),
  KEY `AK_FK_PACIENTE_ESCOLARIDAD_IDX` (`ESCOLARIDAD`),
  KEY `AK_FK_PACIENTE_ESTADO_CIVIL_IDX` (`ESTADO_CIVIL`),
  KEY `AK_FK_PACIENTE_FACULTAD_IDX` (`FACULTAD`),
  KEY `AK_FK_PACIENTE_PROGRAMA_IDX` (`PROGRAMA`),
  CONSTRAINT `FK_fk_paciente_categoria_afiliado` FOREIGN KEY (`CATEGORIA_AFILIADO`) REFERENCES `categoria_afiliado` (`ID`),
  CONSTRAINT `FK_fk_paciente_dep_nacimiento` FOREIGN KEY (`DEPTO_NACIMIENTO`) REFERENCES `depto` (`ID`),
  CONSTRAINT `FK_fk_paciente_dep_residencia` FOREIGN KEY (`DEPTO_RESIDENCIA`) REFERENCES `depto` (`ID`),
  CONSTRAINT `FK_fk_paciente_eps` FOREIGN KEY (`EPS`) REFERENCES `eps` (`ID`),
  CONSTRAINT `FK_fk_paciente_escolaridad` FOREIGN KEY (`ESCOLARIDAD`) REFERENCES `escolaridad` (`ID`),
  CONSTRAINT `FK_fk_paciente_estado_civil` FOREIGN KEY (`ESTADO_CIVIL`) REFERENCES `estado_civil` (`ID`),
  CONSTRAINT `FK_fk_paciente_estrato` FOREIGN KEY (`ESTRATO`) REFERENCES `estrato` (`ID`),
  CONSTRAINT `FK_fk_paciente_facultad` FOREIGN KEY (`FACULTAD`) REFERENCES `facultad` (`ID`),
  CONSTRAINT `FK_fk_paciente_municipio_nacimiento` FOREIGN KEY (`MUNICIPIO_NACIMIENTO`) REFERENCES `municipio` (`ID`),
  CONSTRAINT `FK_fk_paciente_municipio_residencia` FOREIGN KEY (`MUNICIPIO_RESIDENCIA`) REFERENCES `municipio` (`ID`),
  CONSTRAINT `FK_fk_paciente_parentesco` FOREIGN KEY (`PARENTESCO`) REFERENCES `parentesco` (`ID`),
  CONSTRAINT `FK_fk_paciente_programa` FOREIGN KEY (`PROGRAMA`) REFERENCES `programas` (`ID`),
  CONSTRAINT `FK_fk_paciente_raza` FOREIGN KEY (`RAZA`) REFERENCES `raza` (`ID`),
  CONSTRAINT `FK_fk_paciente_tipo_afiliado` FOREIGN KEY (`TIPO_AFILIADO`) REFERENCES `tipo_afiliado` (`ID`),
  CONSTRAINT `FK_fk_paciente_tipo_identificacion` FOREIGN KEY (`TIPO_IDENTIFICACION`) REFERENCES `tipo_identificacion` (`ID`),
  CONSTRAINT `FK_fk_paciente_tipo_regimen` FOREIGN KEY (`TIPO_REGIMEN`) REFERENCES `tipo_regimen` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `parentesco`
--

DROP TABLE IF EXISTS `parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentesco` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `patologico_consulta_med`
--

DROP TABLE IF EXISTS `patologico_consulta_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patologico_consulta_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO_SI_NO` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  `CONSULTA_MEDICA_MED_IDX` int(11) NOT NULL,
  `PATOLOGICOS_MED_IDX` int(11) NOT NULL,
  PRIMARY KEY (`IDX`),
  KEY `AK_FK_PATOLOGICO_CONSULTA_MED_CONSULTA_MEDICA_MED1_IDX` (`CONSULTA_MEDICA_MED_IDX`),
  KEY `AK_FK_PATOLOGICO_CONSULTA_MED_PATOLOGICOS_MED1_IDX` (`PATOLOGICOS_MED_IDX`),
  CONSTRAINT `FK_fk_patologico_consulta_med_consulta_medica_med1` FOREIGN KEY (`CONSULTA_MEDICA_MED_IDX`) REFERENCES `consulta_medica_med` (`IDX`),
  CONSTRAINT `FK_fk_patologico_consulta_med_patologicos_med1` FOREIGN KEY (`PATOLOGICOS_MED_IDX`) REFERENCES `patologicos_med` (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `patologicos_med`
--

DROP TABLE IF EXISTS `patologicos_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patologicos_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `AK_NOMBRE_UNIQUE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `presentacion_medicamento_med`
--

DROP TABLE IF EXISTS `presentacion_medicamento_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentacion_medicamento_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_PRESEN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `AK_NOMBRE_UNIQUE` (`NOMBRE_PRESEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `procedimientos_cups_med`
--

DROP TABLE IF EXISTS `procedimientos_cups_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimientos_cups_med` (
  `CODIGO` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `FACULTAD` int(11) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AK_FK_PROGRAMAS_FACULTAD_IDX` (`FACULTAD`),
  CONSTRAINT `FK_fk_programas_facultad` FOREIGN KEY (`FACULTAD`) REFERENCES `facultad` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `quirurgico_med`
--

DROP TABLE IF EXISTS `quirurgico_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quirurgico_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `CONSULTA_MEDICA_MED_IDX` int(11) NOT NULL,
  `procedimientos_cups_med_codigo` varchar(20) DEFAULT NULL,
  `OBSERVACIONES` longtext,
  PRIMARY KEY (`IDX`),
  KEY `AK_FK_QUIRURGICO_MED_CONSULTA_MEDICA_MED1_IDX` (`CONSULTA_MEDICA_MED_IDX`),
  KEY `AK_FK_QUIRURGICO_MED_PROCEDIMIENTOS_CUPS_MED1_IDX` (`procedimientos_cups_med_codigo`),
  CONSTRAINT `FK_fk_quirurgico_med_consulta_medica_med1` FOREIGN KEY (`CONSULTA_MEDICA_MED_IDX`) REFERENCES `consulta_medica_med` (`IDX`),
  CONSTRAINT `FK_fk_quirurgico_med_procedimientos_cups_med1` FOREIGN KEY (`procedimientos_cups_med_codigo`) REFERENCES `procedimientos_cups_med` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `raza`
--

DROP TABLE IF EXISTS `raza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raza` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `sistema_cuerpo_med`
--

DROP TABLE IF EXISTS `sistema_cuerpo_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_cuerpo_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `AK_NOMBRE_UNIQUE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `tipo_afiliado`
--

DROP TABLE IF EXISTS `tipo_afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_afiliado` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `tipo_alergeno_med`
--

DROP TABLE IF EXISTS `tipo_alergeno_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_alergeno_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `AK_NOMBRE_UNIQUE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `tipo_cita_med`
--

DROP TABLE IF EXISTS `tipo_cita_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cita_med` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `tipo_habito`
--

DROP TABLE IF EXISTS `tipo_habito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_habito` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `tipo_identificacion`
--

DROP TABLE IF EXISTS `tipo_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_identificacion` (
  `ID` varchar(2) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `tipo_regimen`
--

DROP TABLE IF EXISTS `tipo_regimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_regimen` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `ID_CATEGORIA_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AK_FK_TIPO_USUARIO_CATEGORIA_USUARIO_IDX` (`ID_CATEGORIA_USUARIO`),
  CONSTRAINT `FK_fk_tipo_usuario_categoria_usuario` FOREIGN KEY (`ID_CATEGORIA_USUARIO`) REFERENCES `categoria_usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `tipodiagnostico`
--

DROP TABLE IF EXISTS `tipodiagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodiagnostico` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(16) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_USER`),
  UNIQUE KEY `AK_EMAIL_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `usuarios_sistema`
--

DROP TABLE IF EXISTS `usuarios_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_sistema` (
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `via_administracion_med`
--

DROP TABLE IF EXISTS `via_administracion_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `via_administracion_med` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_ADMINIS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `AK_NOMBRE_UNIQUE` (`NOMBRE_ADMINIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;