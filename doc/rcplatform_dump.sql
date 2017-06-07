-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: localhost    Database: renren-security
-- ------------------------------------------------------
-- Server version	5.6.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACT_EVT_LOG`
--

DROP TABLE IF EXISTS `ACT_EVT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_EVT_LOG`
--

LOCK TABLES `ACT_EVT_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_EVT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_EVT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_BYTEARRAY`
--

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_BYTEARRAY`
--

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('10002',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','10001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"æ€»ç»ç†\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"äººäº‹ç»ç†\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"170.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('10003',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','10001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\Z IDATxÚíp•å™ÇUÐ²Óa*nÕÅµîÖaaK»´º%J¥¥T¦&‡sN\")¸Ê¥\\ä²ÔAî—¡P@²Ø´].BHL¸L0X	—\r‚„Z\npÂäÝçù&\'sj’““ó¿ßÌ3†ï;žOÿ9?ž÷}Ïw¹ï>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¨Î¹zƒæÎ»mÊ”)Ÿÿâ¿¸žššêºuëæ’““o\Z4èÊØ±cM˜0áýŸÿüçÏ“@pìØ±o-[¶,wÀ€_¤¥¥¹Å‹»¼¼<W\\\\ì._¾ì”k×®¹’’—ŸŸïÒÓÓ]Ÿ>}nöïßÿôÈ‘#ßHLLl@Š\0±ï¸\rrrr6ôë×ïæÔ©SÝîÝ»=Q¿,ûöísÒ­Ý«¯¾zqðàÁH †]wÖ¬YçèvíÚåªÃþýû©o¼öÚkkdÈ]tjÒÒÒv£G¾6{ölwþüy\rt¨-ïw½oß¾›RÔ`çUyßzë-wãÆ\rmæÍ›wM:qVBBB]ÒˆòœW‡ÍÚykBÞ3gÎ¼”œœü.‰D]°Ò9o´†ÍwN§¥¥ëÖ­[©Diè¬«ÍºÒta+g>ô{^ýª(–Lœ8ñSéÂCH zsßzz’F¬ºoˆÂÂÂ«@à3´\0ªAffæ=Ãª&®\"‘ššZâóùÚò[\0¨\"zn³žYÌ˜1c—£\'ò[\0¨\"za‚žÛ\\|ôÑGGDàü\0ªˆ^U¤&Ô§N:-ò[\0¨\")))åWÅ\Z½8B¾Ìo Šèõ¼µ‰Ÿß@éÞ½ûÍZìÀ§èÀ\0Õ›_®­9pIIÉAæÀ\0Õ`Ü¸qjk:##ãV¡ªÁÄ‰ß­­ïÇŒ³šïªAÿþý¿£÷°ª…3±.ë©”œ‰PMp2ÖçBË°]‡Ï‡9\Z šŒ=zÜÔ©SoÆRà×^{m5W#D½Ù\\¯^½JõN’±`Û¶mÚ}¹ Jôë×¯£Ì‡¯Õô9.]ºt\\æ¾¸#@”éÝ»÷ŸfÌ˜q¥´Jûôé£sße¤\retAI:qÆÜ¹s¯Ö€Ä¥#GŽü½~ïËý¡jPb™0mÚ´/^ŒÚ°¹oß¾ºhµ‚y/@$NIII—!õ¹‚‚‚Õ]°*›ó.£óÄ]hJNN>:vìØ\"¹2ÃêËùùùëtN­«Í,XÔÚ5}>_?¿ßÿé+¯¼rjêÔ©»6mÚôÙñãÇKB;Ó«ŠôÂ„\r6dèé‘z†U™¸C2ÄOGn#5Zd~W¤þX/ÔëyËþY¨s\\Ù÷¦žÉV\06¤¾!]¶I\0ØøJÇŽ¿B\06¾’’RŸ$\0l\nüyjjjC’\0°)ðI¿ßßˆ$\0l\n\\œ˜˜Ø”$\0l\n|$>J\06Ö6\'	\0›”!ô“$`SàB¿ßÿ4I\0ØxÏç{†$\0¢çDV$`³çëE$`Sà¸9;€]·øýþçHÀ¦À9ÜqÀ(Ò}3“’’~@\06;ð:‘øG$`SàÕ>Ÿ¯I\0Øø}©®$`süéÀ‰$`³/‰ý$`Sàw¤RHÀæú·2„þI\0ØìÀ¤þ“$\0l\nükéÀ}HÀ \"ïlF÷\'	\0›xºÔ ’\00ˆtß·¤%	\0›ø—\"ñ’\0°)ðRcHÀ 2|+xI\0ØìÀ#¥&‘€A¤û“.<™$\0l¡‹ÄÓHÀfî¯\'s€ÍÜGO§$	\0ƒè…zAI\0ØìÀ?ÓK\nIÀfNÑ‹úIÀ z;½­I\0ØB\'êíHÀæº«ÞZ–$\0l¡;K^E\06‡Ð¥@\06;ð‹\"ð’\00HRRÒó\"q6I\0DºïHm&	\0›CèïŠÀ[IÀ >ŸïÛ\"ðv’\0°9„n-L\06;ð3\"ñý955µžüüx0|”d\0â³ãæH–*–rj1IÄ!~¿ÿÕ»ˆ«u]»0IÄ!			uË:p$ç‘€Í.L÷0Ò…ï ð\nÒ0€ÏçëTQ`éÌÏ‘€DÚ-aòf’€-Â:p‰\0Ø“8Wºï$`¤¤¤ŠÄ7H Î¹ºEEE+òòò¾øðÃ]ff&U…ÊÊÊr›7o>%•Ì§\nb†Ê»eËWRRâ®^½JU£Nž<é6mÚtNd~™OÄí¼ÈU‰¯JG.ä“1A‡ÍˆÝ¯óÉ‚˜ ó7¤‹ºÀŽOÄ•À>/vEù‹Ý¾¬7¼ÒŸuÂ\"0Ä¹À¥gº½c\\ÁÚ¡·”nÓ}H‹ÀÇÙ·ê6yCõ×}«‘!ž.Ì™Q`Ý‡´q,ðÞÌñÖ}H‹À€ÀPëªs$uÒ\"0Ä±ÀsçFX÷!-C|úèn·wÃ¸Û‡Ï²M÷!-C¬uxÇ;·	¬Û!Þ¾rÅÜ:ïöá³lÓ}H‹À§ë™VrçDœë>ÎÆB`ˆ7¥³Ìv{ÖŒ(o¨ô5úZº1Cü·º.Ý!Žþ2]÷nÝjQàªÊ*F`ˆ§Uh\n\0\0˜B`@`@`®Zåææê‡Ö-X° |ÛðáÃ½mÇ¯öû?ûì³Þ{U¬±cÇVú½Ö¯_ïý»ú<#ŽÀÙÙÙnåÊ•®GÞ{Îœ9Óûóž={¸¦>þ¼ëÙ³§kÞ¼¹kÑ¢…2dHùë&Mšäyä×¬Y37aÂo›>òå‰\'žpiiiîá‡öÖí3fÌðÞ³  à–ã8Ð=öØc®Q£F®k×®îôéÓ.°þ% Ç™={6GxáÂ…®^½zúN·xñb×¾}{÷É\'Ÿ¸x¯5j”×UõçU«V¹µk×z?·lÙÒÛwæÌ™ˆïØ±Ã=õÔSnéÒ¥åûß{ï½ˆÇ	<eÊW¿~}—’’â®DñJ*soß¾Ý“âí·ß.ß6tèPo›>ý0??ßÝÿý®qãÆž0999Þk&OžìxàO&•¯Aƒ^×\r	¼|ùò[Ž©zïÑ¡Co¿vÔHÇ	\\·n]ïØEEE¡áÞøÐ¡Cž:mëÕ«—\'Ð…¼?¯Y³ÆƒAo¸ê’ƒöDRÙ‡\ræUzzz¹Àÿûî$°¾Vß#99Ù-Z´ÈÛ?gÎœˆÇ	Ü¦Mox®Ãl†{Z`•T;]Ó¦M½a´vâ†\rºÖ­[{ûçÏŸïZµjåöïßï\rcëÔ©ãfÍšåÖ­[çÉ¤âmÛ¶ÍµmÛÖedd”šûÞMà#F¸|Ð9rÄ-Y²ÄÛ?}úôˆÇ	¬ÿïÓ¦Mó¶ïÜ¹áÞ844Õ…¤ûÊ¾âÑyéÖ­[½}\'Nœp/¼ð‚7\'Õar—.]ÜÙ³gÝÅ‹]jjª×Azè!×¹sgï/ƒÀ¡aïÝÖ•h]¤Òáp»ví\\“&M\\ïÞ½#3|«´´Ô[ÄÒù1Ã=-pØSê½yïö;wÎ[®¸]·…ªªZ*leŽÉ‰€À#0\0#0 0…À€À€À€ÀL!0 0 0#0SŒÀ\0ŒÀ€ÀC¼£wDº¨Öeø:Ÿ,ˆ	›7o.Žtñ=Uù:zôèïDàB>Y²³³²qãÆÏOœ8qÉ‚ Ñ¼ýk´;¯Ê›••õ™ÔË|² fÈ®“t|úéü-^kÃ†\rÎï÷{ÿŒÃÿ>Í®yîB·nÝ.vîÜùïIÀ¦À%‰‰‰IÀ¦À‡¥\'	\0›ï•yð7IÀ¦ÀÛÀwHÀ Ò}³“’’ž\'	\0›xµÏçëD\06þ”$\0l\n¼HªI\0D†Ï³eÜŸ$\0\"ò¾)¿N\06‡Ð£¥&’€MIM\'	\0›÷’šO\0‘ùoPæÁé$`‘÷%‘ø$`Sàe½$\0lÎ¿\'•K\06çÀÿ*ï\"	\0ƒ$&&>)$	\0ƒ$\'\'7‘€A‚ÁàWEàs$`„„„º\"0O>\0°Š|µcÇŽ_!	\0›ŸILLü\ZI\0ØøˆÔ?€Aü~ÿ~©§IÀfÞ¾E\06Þœ””ô}’\0°)ð:ŸÏ×‘$\0\"ò®”9ðOIÀ \"ïR‘ø’\0°9„þµÜ‡$\0l\n<EjI\0Øx¼Ô8’\00ˆŸ‡Ê<ø-’\00ˆÈ›&ÿŠ$\0l\nÜ]†ÐKHÀæøe©$`sÜQþ€$\0¢çAË0zI\0D¯D’¼ƒ$\0¢×‹À…$`½‡Ô_HÀ z?,ø4I\0DïH)_!	\0»ÃèÒ‰ë€MÏéS\ZHÀ¦ÀÇô9I$`Sàƒú¤B’\0°)ð.}V0I\0Ø8Wê{$`Sà\r~¿ÿE’\00ˆŸÿ(¿D\0yÓEâ I\0ØBÏ—êE\06ž.5ˆ$\0l¡ÿKM\06!õ¦T#ùq½F˜gÄ!Á`ðQ‘3SDÝ#uXªXÊU,ŸÏ×‰´\0âsÎ»îNÒ†Éû1)ÄïYo£sý.÷#%€øîÂs\"|255µ	Ä1\"iC•µ¢Àº˜E:\06ºð\n—êJ4É\0ØèÂõÊV¢Csßß\n€!¤ã¾\Z6|æ»_\0ƒCé<©«$`=iC¾D\0pÎÕ-**Z‘——÷Å‡~è233©*TVV–Û¼yó)©d>U3TÞ-[¶¸’’wõêUª\ZuòäI·iÓ¦s\"óË|² &hçEÞ¨J|U:2cƒØ ÃfÄ‹n‰À×ùdALÐùÒE]`Ç\'âJàŸ»¢üÅn_Ö^éÏº\raâ\\àÒ³GÝÞŒ1®`íÐ[J·é>¤E`ˆcì[u›¼¡úë¾ÕH‹ÀÏæLŽ(°îCZ†8xoæøˆë>¤E`@`¨	uÕ9’ÀºiâXàƒ¹s#\n¬û!Ž>}t·Û»aÜíÃgÙ¦û!ŽÖ:¼ãÛÖm‹Àï_¹ânwûðY¶é>¤E`ˆSõL«¹s\"Îugc!0Ä›ÀÒY‹f»=ëGF”7Tú\Z}-Ý!þ[]—nŒÀÇ™®{·nŒÀµ(pUå\r#0ÄÓ*4…À€À€À€ÀL!0 0 0W­rssõCë,XP¾møðáÞ¶ãÇWûýŸ}öYï½*ÖØ±c+ý^ë×¯÷þ]}žÇ@àììl·råJ×£Gï=gÎœéýyÏž=\\ÓŸ?ÞõìÙÓ5oÞÜµhÑÂ\r2¤üu“&Mr<òˆkÖ¬™›0a‚·MùòÄO¸´´4÷ðÃ{ëö3fxïYPPpËñè{ì1×¨Q#×µkWwúôéˆÇXÿÐãÌž=#	¼páBW¯^=}§[¼x±kß¾½ûä“OÜ¼×Œ\Z5ÊëªúóªU«ÜÚµk½Ÿ[¶léí;sæLDwìØážzê)·téÒòýï½÷^Äc†ž2eŠ«_¿¾KIIqW¢x%ƒ9·oßîIñöÛo—o:t¨·MŸ~˜ŸŸïî¿ÿ~×¸qcO˜œœï5“\'Ov<ð€\'“Ê× A¯ë†^¾|ù-Ç‰Ô½÷èÐ¡ƒ·_;j¤c†®[·®wì¢¢\"†Ðpo|èÐ!O\n‡¶õêÕËèÂ…ÞŸ×¬Yã‚Á 7\\uÉÁƒ{\"©ìÃ†\ró*==½\\àŠÿ}wX_«ï‘œœì-ZäíŸ3gNÄc†nÓ¦7<×a6Ã=-°Jª®iÓ¦Þ0Z;qÃ†\r]ëÖ­½ýóçÏw­Zµrû÷ï÷†±uêÔq³fÍrëÖ­ódRñ¶mÛæÚ¶më222ÊÍ}ï&ðˆ#Üƒ>èŽ9â–,YâíŸ>}zÄc†Öÿ÷iÓ¦yÛwîÜ‰Àpï\n\ZšêBÒ}e_ñè¼tëÖ­Þ¾\'N¸^xÁ›“ê0¹K—.îìÙ³îâÅ‹.55Õë =ôëÜ¹³÷—AHàÐ°÷nëJ´.Rép¸]»v®I“&®wïÞ¾ˆUZZê-béüáž8ì)õÞ¼÷NûÎ;ç­WÜ®ÛBUU-¶2ÇäD@`\n\0˜B`@`@`@`¦)F`\0F`@`\n!ÞÑ»?\"]Të²|OÄ„Í›7Gºøžª|=zôw\"p!Ÿ,ˆ	ÙÙÙ?Ù¸qãç\'Nœ¸„€Õë¼*oVVÖgR/óÉ‚˜!¸NÒ5òuè§ó·x¬nÝº¹xýo++Í®y*0~üøDà/HÀ 			uE`†\0,Ò±cÇ¯ˆÀWHÀ ‰‰‰\'_\"	\0ƒ¤¤¤Ô/€A‚ÁàWEàs$`ÔÔÔ†>Ÿï,I\0ØœM:ði’\0°)pc¸„$\0â÷û›ˆÀÇIÀ ÉÉÉÍDàc$``0ø¨|„$\0lÎ¿.F\0y—:L\0ñù|-DàOIÀ @àŸDà$`sü\r¿ß¿Ÿ$\0l\nü/\"ð>’\0°9~F†Ð{HÀ Ò}[ŠÀ$`‘·µÔÿ’€AÀ·Dà$`sümx;I\0Ø¸­üI\0ØœO*—$\0â÷ûŸ·€MÛ‰ÀIÀ IIIÏ‹ÄÙ$`sÜ^*‹$\0âóù:ˆÀ$`sü#xI\0$üXºðZ’\0°Ù;‹À«HÀæø\'2„þI\0Däí*õ>I\0Øøe©$`sœ$ÿž$\0lÎ»‰Äï’€Mƒ\"p:I\0Øœ§H½C\06çÀÝEà%$`³÷‰K\06;ð«2þ\rI\0ØìÀ½¤æ“€M{KÍ#	\0›÷•šK\06çÀýe<›$\0\"ò‰g’€M‹ÀÓHÀæxˆÔ’\0°9&]x2I\0Øx„tà_’€Í9ð(‘ø¿HÀæxŒÔ$`SàñRãHÀ¦Àoh&	\0ƒèüWçÁ$`Sà7Eà×IÀ ú°~L\06çÀSôl,’\0°)ðt©A$`s<S¯H\"	\0›sàÙzM0I\0ØøW\"p\ZI\0ØœÏÓûb‘€Mçë)IÀ¦À¥z’€Aô©2þI\0ØìÀKôùH$`Sàe\"p2I\0Øø¿¥$`sü®Ì»‘€Mÿ \'’€ADÞ•\"ñOIÀæø}©®$`Sàÿ‘êB\06^-ÃèN$`s¼6ü˜$\0l\n¼^þ!I\0ØBoðûý/’€M³¤Ú“€Ms¤HÀ 2|Þ”””ô}’\0°Ù·ˆÄÏ‘€M·ŠÀß%	\0›çIý;I\0Øx»Ïçû6I\0Øx§üo$`‘÷ã@ ÐŠ$\0lvà¿ßß’$\0l\n¼Wþ&I\0ØøÿdýÏ$`é¾û¿A\06;ðAøI’\0°)ð¡@ ð$`SàÃR“€Mÿ\"Cè¯“€Mÿ*7\'	\0›KNNnF\0qŽ>I„u£\nSSSë‘@ü	ü´zýnó¨Q€ø2/¾‹Àê’€Á.L÷°Ñ…—ÝiîK÷0€Ïç{¦bæ!ß\0¶$þc˜À;é¾\0¶nÖ}y:!€Á¹ðj©›Ò}ùÞ žÑ!²ßïÿ‘;Qj.ZIÝF‘ý™Roêj4\'s\0Ä‰‰‰MEÎñ\"å§_â,¬ð*–šÇ•J\0µÔqenûz ¸XIq+ÖuíÊtd€ØuÝ\'Eº‚Š2¦¥¥¹ùóç»¼¼<wôèQwùòe§è?KJJÜÎ;ÝÒ¥KÝÀoYo?«_?‘.@\r¢«ËÁ`ðd¸|C‡õä¼qã†û²ìÚµË9²¢È¥¬XÔ ¼2d¾NDv«W¯®”¸Y¿~½“áó-Cj$¨a³È{&|¸|àÀ\rþüç?»þýûWìÄ§¢AÙWDáòêœ6šèû…K¬sb¶\0¢3t~=|Ø­Î{§N\\a8=…ôª7tn\ZþU‘Îyk‡Ï‡¹§4@5Ð“4ÂW›¯]»æjšáÃ‡‡K<ß@Õç¾ågXéWE±`÷îÝ·œ±%]¸¿\r€ÊÏ};…/\\Uçë¢Ê~²wò\0¨ÚðybH¢…ºX’žž.ð›ü6\0*/ðºDzzd,ÑázØ0:‡ß@å>’¨¸¸8¦ë÷Âá—\"òÛ\0¨¼Àå÷µ\n]˜+ôxáçIóÛ\0¨¼ÀåÕ@`ÌÀžÀ¬B˜ï¬\"â¼T[gb\r0à&gbT=ZçŸœ\r`w=%üj¤Xtá\n÷Êâj$€ªRvßçR®°Û…\'ÆêŽÝ»w¿É9\0¢ˆÞ›JïQUÓ÷Äê×¯ßÜ ({æoiMÝ•2\\^îJ	P$%%ý \\âhÝºÂ°™ûBÄJâÐê´>i¡²_3†\'3\0ÔÆp:|N>¬Ö3¶òóó½s§+>I%×3¬ÂOÒàÙH\0µ€.0•­N_®îÓ	uµ™+€Z@¿\'–Î9#üŒ­Ê<Øï÷?MŠ\0µLÙ-h_*ëÊëÂ/E6G/LÐs›9=\0\0\0\0\0\0\0\0\0\0\0\0\0\0â‰ÿæž®d»à`\0\0\0\0IEND®B`‚',1),('12502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','12501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"applyUserId\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"æ€»ç»ç†\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"äººäº‹ç»ç†\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"170.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('12503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','12501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\Z IDATxÚíp•å™ÇUÐ²Óa*nÕÅµîÖaaK»´º%J¥¥T¦&‡sN\")¸Ê¥\\ä²ÔAî—¡P@²Ø´].BHL¸L0X	—\r‚„Z\npÂäÝçù&\'sj’““ó¿ßÌ3†ï;žOÿ9?ž÷}Ïw¹ï>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¨Î¹zƒæÎ»mÊ”)Ÿÿâ¿¸žššêºuëæ’““o\Z4èÊØ±cM˜0áýŸÿüçÏ“@pìØ±o-[¶,wÀ€_¤¥¥¹Å‹»¼¼<W\\\\ì._¾ì”k×®¹’’—ŸŸïÒÓÓ]Ÿ>}nöïßÿôÈ‘#ßHLLl@Š\0±ï¸\rrrr6ôë×ïæÔ©SÝîÝ»=Q¿,ûöísÒ­Ý«¯¾zqðàÁH †]wÖ¬YçèvíÚåªÃþýû©o¼öÚkkdÈ]tjÒÒÒv£G¾6{ölwþüy\rt¨-ïw½oß¾›RÔ`çUyßzë-wãÆ\rmæÍ›wM:qVBBB]ÒˆòœW‡ÍÚykBÞ3gÎ¼”œœü.‰D]°Ò9o´†ÍwN§¥¥ëÖ­[©Diè¬«ÍºÒta+g>ô{^ýª(–Lœ8ñSéÂCH zsßzz’F¬ºoˆÂÂÂ«@à3´\0ªAffæ=Ãª&®\"‘ššZâóùÚò[\0¨\"zn³žYÌ˜1c—£\'ò[\0¨\"za‚žÛ\\|ôÑGGDàü\0ªˆ^U¤&Ô§N:-ò[\0¨\")))åWÅ\Z½8B¾Ìo Šèõ¼µ‰Ÿß@éÞ½ûÍZìÀ§èÀ\0Õ›_®­9pIIÉAæÀ\0Õ`Ü¸qjk:##ãV¡ªÁÄ‰ß­­ïÇŒ³šïªAÿþý¿£÷°ª…3±.ë©”œ‰PMp2ÖçBË°]‡Ï‡9\Z šŒ=zÜÔ©SoÆRà×^{m5W#D½Ù\\¯^½JõN’±`Û¶mÚ}¹ Jôë×¯£Ì‡¯Õô9.]ºt\\æ¾¸#@”éÝ»÷ŸfÌ˜q¥´Jûôé£sße¤\retAI:qÆÜ¹s¯Ö€Ä¥#GŽü½~ïËý¡jPb™0mÚ´/^ŒÚ°¹oß¾ºhµ‚y/@$NIII—!õ¹‚‚‚Õ]°*›ó.£óÄ]hJNN>:vìØ\"¹2ÃêËùùùëtN­«Í,XÔÚ5}>_?¿ßÿé+¯¼rjêÔ©»6mÚôÙñãÇKB;Ó«ŠôÂ„\r6dèé‘z†U™¸C2ÄOGn#5Zd~W¤þX/ÔëyËþY¨s\\Ù÷¦žÉV\06¤¾!]¶I\0ØøJÇŽ¿B\06¾’’RŸ$\0l\nüyjjjC’\0°)ðI¿ßßˆ$\0l\n\\œ˜˜Ø”$\0l\n|$>J\06Ö6\'	\0›”!ô“$`SàB¿ßÿ4I\0ØxÏç{†$\0¢çDV$`³çëE$`Sà¸9;€]·øýþçHÀ¦À9ÜqÀ(Ò}3“’’~@\06;ð:‘øG$`SàÕ>Ÿ¯I\0Øø}©®$`süéÀ‰$`³/‰ý$`Sàw¤RHÀæú·2„þI\0ØìÀ¤þ“$\0l\nükéÀ}HÀ \"ïlF÷\'	\0›xºÔ ’\00ˆtß·¤%	\0›ø—\"ñ’\0°)ðRcHÀ 2|+xI\0ØìÀ#¥&‘€A¤û“.<™$\0l¡‹ÄÓHÀfî¯\'s€ÍÜGO§$	\0ƒè…zAI\0ØìÀ?ÓK\nIÀfNÑ‹úIÀ z;½­I\0ØB\'êíHÀæº«ÞZ–$\0l¡;K^E\06‡Ð¥@\06;ð‹\"ð’\00HRRÒó\"q6I\0DºïHm&	\0›CèïŠÀ[IÀ >ŸïÛ\"ðv’\0°9„n-L\06;ð3\"ñý955µžüüx0|”d\0â³ãæH–*–rj1IÄ!~¿ÿÕ»ˆ«u]»0IÄ!			uË:p$ç‘€Í.L÷0Ò…ï ð\nÒ0€ÏçëTQ`éÌÏ‘€DÚ-aòf’€-Â:p‰\0Ø“8Wºï$`¤¤¤ŠÄ7H Î¹ºEEE+òòò¾øðÃ]ff&U…ÊÊÊr›7o>%•Ì§\nb†Ê»eËWRRâ®^½JU£Nž<é6mÚtNd~™OÄí¼ÈU‰¯JG.ä“1A‡ÍˆÝ¯óÉ‚˜ ó7¤‹ºÀŽOÄ•À>/vEù‹Ý¾¬7¼ÒŸuÂ\"0Ä¹À¥gº½c\\ÁÚ¡·”nÓ}H‹ÀÇÙ·ê6yCõ×}«‘!ž.Ì™Q`Ý‡´q,ðÞÌñÖ}H‹À€ÀPëªs$uÒ\"0Ä±ÀsçFX÷!-C|úèn·wÃ¸Û‡Ï²M÷!-C¬uxÇ;·	¬Û!Þ¾rÅÜ:ïöá³lÓ}H‹À§ë™VrçDœë>ÎÆB`ˆ7¥³Ìv{ÖŒ(o¨ô5úZº1Cü·º.Ý!Žþ2]÷nÝjQàªÊ*F`ˆ§Uh\n\0\0˜B`@`@`®Zåææê‡Ö-X° |ÛðáÃ½mÇ¯öû?ûì³Þ{U¬±cÇVú½Ö¯_ïý»ú<#ŽÀÙÙÙnåÊ•®GÞ{Îœ9Óûóž={¸¦>þ¼ëÙ³§kÞ¼¹kÑ¢…2dHùë&Mšäyä×¬Y37aÂo›>òå‰\'žpiiiîá‡öÖí3fÌðÞ³  à–ã8Ð=öØc®Q£F®k×®îôéÓ.°þ% Ç™={6GxáÂ…®^½zúN·xñb×¾}{÷É\'Ÿ¸x¯5j”×UõçU«V¹µk×z?·lÙÒÛwæÌ™ˆïØ±Ã=õÔSnéÒ¥åûß{ï½ˆÇ	<eÊW¿~}—’’â®DñJ*soß¾Ý“âí·ß.ß6tèPo›>ý0??ßÝÿý®qãÆž0999Þk&OžìxàO&•¯Aƒ^×\r	¼|ùò[Ž©zïÑ¡Co¿vÔHÇ	\\·n]ïØEEE¡áÞøÐ¡Cž:mëÕ«—\'Ð…¼?¯Y³ÆƒAo¸ê’ƒöDRÙ‡\ræUzzz¹Àÿûî$°¾Vß#99Ù-Z´ÈÛ?gÎœˆÇ	Ü¦Mox®Ãl†{Z`•T;]Ó¦M½a´vâ†\rºÖ­[{ûçÏŸïZµjåöïßï\rcëÔ©ãfÍšåÖ­[çÉ¤âmÛ¶ÍµmÛÖedd”šûÞMà#F¸|Ð9rÄ-Y²ÄÛ?}úôˆÇ	¬ÿïÓ¦Mó¶ïÜ¹áÞ844Õ…¤ûÊ¾âÑyéÖ­[½}\'Nœp/¼ð‚7\'Õar—.]ÜÙ³gÝÅ‹]jjª×Azè!×¹sgï/ƒÀ¡aïÝÖ•h]¤Òáp»ví\\“&M\\ïÞ½#3|«´´Ô[ÄÒù1Ã=-pØSê½yïö;wÎ[®¸]·…ªªZ*leŽÉ‰€À#0\0#0 0…À€À€À€ÀL!0 0 0#0SŒÀ\0ŒÀ€ÀC¼£wDº¨Öeø:Ÿ,ˆ	›7o.Žtñ=Uù:zôèïDàB>Y²³³²qãÆÏOœ8qÉ‚ Ñ¼ýk´;¯Ê›••õ™ÔË|² fÈ®“t|úéü-^kÃ†\rÎï÷{ÿŒÃÿ>Í®yîB·nÝ.vîÜùïIÀ¦À%‰‰‰IÀ¦À‡¥\'	\0›ï•yð7IÀ¦ÀÛÀwHÀ Ò}³“’’ž\'	\0›xµÏçëD\06þ”$\0l\n¼HªI\0D†Ï³eÜŸ$\0\"ò¾)¿N\06‡Ð£¥&’€MIM\'	\0›÷’šO\0‘ùoPæÁé$`‘÷%‘ø$`Sàe½$\0lÎ¿\'•K\06çÀÿ*ï\"	\0ƒ$&&>)$	\0ƒ$\'\'7‘€A‚ÁàWEàs$`„„„º\"0O>\0°Š|µcÇŽ_!	\0›ŸILLü\ZI\0ØøˆÔ?€Aü~ÿ~©§IÀfÞ¾E\06Þœ””ô}’\0°)ð:ŸÏ×‘$\0\"ò®”9ðOIÀ \"ïR‘ø’\0°9„þµÜ‡$\0l\n<EjI\0Øx¼Ô8’\00ˆŸ‡Ê<ø-’\00ˆÈ›&ÿŠ$\0l\nÜ]†ÐKHÀæøe©$`sÜQþ€$\0¢çAË0zI\0D¯D’¼ƒ$\0¢×‹À…$`½‡Ô_HÀ z?,ø4I\0DïH)_!	\0»ÃèÒ‰ë€MÏéS\ZHÀ¦ÀÇô9I$`Sàƒú¤B’\0°)ð.}V0I\0Ø8Wê{$`Sà\r~¿ÿE’\00ˆŸÿ(¿D\0yÓEâ I\0ØBÏ—êE\06ž.5ˆ$\0l¡ÿKM\06!õ¦T#ùq½F˜gÄ!Á`ðQ‘3SDÝ#uXªXÊU,ŸÏ×‰´\0âsÎ»îNÒ†Éû1)ÄïYo£sý.÷#%€øîÂs\"|255µ	Ä1\"iC•µ¢Àº˜E:\06ºð\n—êJ4É\0ØèÂõÊV¢Csßß\n€!¤ã¾\Z6|æ»_\0ƒCé<©«$`=iC¾D\0pÎÕ-**Z‘——÷Å‡~è233©*TVV–Û¼yó)©d>U3TÞ-[¶¸’’wõêUª\ZuòäI·iÓ¦s\"óË|² &hçEÞ¨J|U:2cƒØ ÃfÄ‹n‰À×ùdALÐùÒE]`Ç\'âJàŸ»¢üÅn_Ö^éÏº\raâ\\àÒ³GÝÞŒ1®`íÐ[J·é>¤E`ˆcì[u›¼¡úë¾ÕH‹ÀÏæLŽ(°îCZ†8xoæøˆë>¤E`@`¨	uÕ9’ÀºiâXàƒ¹s#\n¬û!Ž>}t·Û»aÜíÃgÙ¦û!ŽÖ:¼ãÛÖm‹Àï_¹ânwûðY¶é>¤E`ˆSõL«¹s\"Îugc!0Ä›ÀÒY‹f»=ëGF”7Tú\Z}-Ý!þ[]—nŒÀÇ™®{·nŒÀµ(pUå\r#0ÄÓ*4…À€À€À€ÀL!0 0 0W­rssõCë,XP¾møðáÞ¶ãÇWûýŸ}öYï½*ÖØ±c+ý^ë×¯÷þ]}žÇ@àììl·råJ×£Gï=gÎœéýyÏž=\\ÓŸ?ÞõìÙÓ5oÞÜµhÑÂ\r2¤üu“&Mr<òˆkÖ¬™›0a‚·MùòÄO¸´´4÷ðÃ{ëö3fxïYPPpËñè{ì1×¨Q#×µkWwúôéˆÇXÿÐãÌž=#	¼páBW¯^=}§[¼x±kß¾½ûä“OÜ¼×Œ\Z5ÊëªúóªU«ÜÚµk½Ÿ[¶léí;sæLDwìØážzê)·téÒòýï½÷^Äc†ž2eŠ«_¿¾KIIqW¢x%ƒ9·oßîIñöÛo—o:t¨·MŸ~˜ŸŸïî¿ÿ~×¸qcO˜œœï5“\'Ov<ð€\'“Ê× A¯ë†^¾|ù-Ç‰Ô½÷èÐ¡ƒ·_;j¤c†®[·®wì¢¢\"†Ðpo|èÐ!O\n‡¶õêÕËèÂ…ÞŸ×¬Yã‚Á 7\\uÉÁƒ{\"©ìÃ†\ró*==½\\àŠÿ}wX_«ï‘œœì-ZäíŸ3gNÄc†nÓ¦7<×a6Ã=-°Jª®iÓ¦Þ0Z;qÃ†\r]ëÖ­½ýóçÏw­Zµrû÷ï÷†±uêÔq³fÍrëÖ­ódRñ¶mÛæÚ¶më222ÊÍ}ï&ðˆ#Üƒ>èŽ9â–,YâíŸ>}zÄc†Öÿ÷iÓ¦yÛwîÜ‰Àpï\n\ZšêBÒ}e_ñè¼tëÖ­Þ¾\'N¸^xÁ›“ê0¹K—.îìÙ³îâÅ‹.55Õë =ôëÜ¹³÷—AHàÐ°÷nëJ´.Rép¸]»v®I“&®wïÞ¾ˆUZZê-béüáž8ì)õÞ¼÷NûÎ;ç­WÜ®ÛBUU-¶2ÇäD@`\n\0˜B`@`@`@`¦)F`\0F`@`\n!ÞÑ»?\"]Të²|OÄ„Í›7Gºøžª|=zôw\"p!Ÿ,ˆ	ÙÙÙ?Ù¸qãç\'Nœ¸„€Õë¼*oVVÖgR/óÉ‚˜!¸NÒ5òuè§ó·x¬nÝº¹xýo++Í®y*0~üøDà/HÀ 			uE`†\0,Ò±cÇ¯ˆÀWHÀ ‰‰‰\'_\"	\0ƒ¤¤¤Ô/€A‚ÁàWEàs$`ÔÔÔ†>Ÿï,I\0ØœM:ði’\0°)pc¸„$\0â÷û›ˆÀÇIÀ ÉÉÉÍDàc$``0ø¨|„$\0lÎ¿.F\0y—:L\0ñù|-DàOIÀ @àŸDà$`sü\r¿ß¿Ÿ$\0l\nü/\"ð>’\0°9~F†Ð{HÀ Ò}[ŠÀ$`‘·µÔÿ’€AÀ·Dà$`sümx;I\0Ø¸­üI\0ØœO*—$\0â÷ûŸ·€MÛ‰ÀIÀ IIIÏ‹ÄÙ$`sÜ^*‹$\0âóù:ˆÀ$`sü#xI\0$üXºðZ’\0°Ù;‹À«HÀæø\'2„þI\0Däí*õ>I\0Øøe©$`sœ$ÿž$\0lÎ»‰Äï’€Mƒ\"p:I\0Øœ§H½C\06çÀÝEà%$`³÷‰K\06;ð«2þ\rI\0ØìÀ½¤æ“€M{KÍ#	\0›÷•šK\06çÀýe<›$\0\"ò‰g’€M‹ÀÓHÀæxˆÔ’\0°9&]x2I\0Øx„tà_’€Í9ð(‘ø¿HÀæxŒÔ$`SàñRãHÀ¦Àoh&	\0ƒèüWçÁ$`Sà7Eà×IÀ ú°~L\06çÀSôl,’\0°)ðt©A$`s<S¯H\"	\0›sàÙzM0I\0ØøW\"p\ZI\0ØœÏÓûb‘€Mçë)IÀ¦À¥z’€Aô©2þI\0ØìÀKôùH$`Sàe\"p2I\0Øø¿¥$`sü®Ì»‘€Mÿ \'’€ADÞ•\"ñOIÀæø}©®$`Sàÿ‘êB\06^-ÃèN$`s¼6ü˜$\0l\n¼^þ!I\0ØBoðûý/’€M³¤Ú“€Ms¤HÀ 2|Þ”””ô}’\0°Ù·ˆÄÏ‘€M·ŠÀß%	\0›çIý;I\0Øx»Ïçû6I\0Øx§üo$`‘÷ã@ ÐŠ$\0lvà¿ßß’$\0l\n¼Wþ&I\0ØøÿdýÏ$`é¾û¿A\06;ðAøI’\0°)ð¡@ ð$`SàÃR“€Mÿ\"Cè¯“€Mÿ*7\'	\0›KNNnF\0qŽ>I„u£\nSSSë‘@ü	ü´zýnó¨Q€ø2/¾‹Àê’€Á.L÷°Ñ…—ÝiîK÷0€Ïç{¦bæ!ß\0¶$þc˜À;é¾\0¶nÖ}y:!€Á¹ðj©›Ò}ùÞ žÑ!²ßïÿ‘;Qj.ZIÝF‘ý™Roêj4\'s\0Ä‰‰‰MEÎñ\"å§_â,¬ð*–šÇ•J\0µÔqenûz ¸XIq+ÖuíÊtd€ØuÝ\'Eº‚Š2¦¥¥¹ùóç»¼¼<wôèQwùòe§è?KJJÜÎ;ÝÒ¥KÝÀoYo?«_?‘.@\r¢«ËÁ`ðd¸|C‡õä¼qã†û²ìÚµË9²¢È¥¬XÔ ¼2d¾NDv«W¯®”¸Y¿~½“áó-Cj$¨a³È{&|¸|àÀ\rþüç?»þýûWìÄ§¢AÙWDáòêœ6šèû…K¬sb¶\0¢3t~=|Ø­Î{§N\\a8=…ôª7tn\ZþU‘Îyk‡Ï‡¹§4@5Ð“4ÂW›¯]»æjšáÃ‡‡K<ß@Õç¾ågXéWE±`÷îÝ·œ±%]¸¿\r€ÊÏ};…/\\Uçë¢Ê~²wò\0¨ÚðybH¢…ºX’žž.ð›ü6\0*/ðºDzzd,ÑázØ0:‡ß@å>’¨¸¸8¦ë÷Âá—\"òÛ\0¨¼Àå÷µ\n]˜+ôxáçIóÛ\0¨¼ÀåÕ@`ÌÀžÀ¬B˜ï¬\"â¼T[gb\r0à&gbT=ZçŸœ\r`w=%üj¤Xtá\n÷Êâj$€ªRvßçR®°Û…\'ÆêŽÝ»w¿É9\0¢ˆÞ›JïQUÓ÷Äê×¯ßÜ ({æoiMÝ•2\\^îJ	P$%%ý \\âhÝºÂ°™ûBÄJâÐê´>i¡²_3†\'3\0ÔÆp:|N>¬Ö3¶òóó½s§+>I%×3¬ÂOÒàÙH\0µ€.0•­N_®îÓ	uµ™+€Z@¿\'–Î9#üŒ­Ê<Øï÷?MŠ\0µLÙ-h_*ëÊëÂ/E6G/LÐs›9=\0\0\0\0\0\0\0\0\0\0\0\0\0\0â‰ÿæž®d»à`\0\0\0\0IEND®B`‚',1),('2',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_7\" sourceRef=\"_3\" targetRef=\"_5\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"5.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"175.0\" y=\"310.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"210.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"182.5\" y=\"170.0\"/>\n        <omgdi:waypoint x=\"182.5\" y=\"210.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"191.0\" y=\"265.0\"/>\n        <omgdi:waypoint x=\"191.0\" y=\"310.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('22502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','22501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"userid\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('22503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','22501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('2502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <parallelGateway gatewayDirection=\"Unspecified\" id=\"_9\" name=\"ParallelGateway\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"_3\" targetRef=\"_9\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_11\" name=\"UserTask\"/>\n    <parallelGateway gatewayDirection=\"Unspecified\" id=\"_12\" name=\"ParallelGateway\"/>\n    <sequenceFlow id=\"_13\" sourceRef=\"_9\" targetRef=\"_5\"/>\n    <sequenceFlow id=\"_14\" sourceRef=\"_9\" targetRef=\"_11\"/>\n    <sequenceFlow id=\"_15\" sourceRef=\"_5\" targetRef=\"_12\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"_11\" targetRef=\"_12\"/>\n    <sequenceFlow id=\"_17\" sourceRef=\"_12\" targetRef=\"_4\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"30.0\" y=\"260.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_9\" id=\"Shape-_9\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_11\" id=\"Shape-_11\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"260.0\" y=\"260.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_12\" id=\"Shape-_12\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"335.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"_9\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"170.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"115.0\" y=\"287.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"_5\" targetElement=\"_12\">\n        <omgdi:waypoint x=\"115.0\" y=\"287.5\"/>\n        <omgdi:waypoint x=\"170.0\" y=\"351.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"_9\" targetElement=\"_11\">\n        <omgdi:waypoint x=\"202.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"260.0\" y=\"287.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"_12\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"367.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"_11\" targetElement=\"_12\">\n        <omgdi:waypoint x=\"260.0\" y=\"287.5\"/>\n        <omgdi:waypoint x=\"202.0\" y=\"351.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_3\" targetElement=\"_9\">\n        <omgdi:waypoint x=\"186.0\" y=\"170.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.myProcess_1.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0c\0\0¿\0\0\0>¶µ\0\0\"·IDATxÚíÝ\rt”ÕÇñð*\nÛÃ*(,žU®ív»XéJí’ŠZØBËd2“Gp#DÞ9ÔE^ÂÛ¡X@¨Ú\"µ\n1@X0©¼ÈA@‹H@„€¼ÊÝÿÿé39CÈ$3ÉÌ<!óýœó?	3aîûË;ÏsŸ„\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€zÎÓ,;;{ØÜ¹s·N:õ›gŸ}ö’Ïç3)))&--íÊ°aÃÎ?þÀÄ‰ÿ4xðàŸÓb\0A_}õÕ}K—.Ý<dÈï233Í¢E‹LAA)..6çÎ3êâÅ‹¦¤¤ÄšeË–™\\4hÐ‰1cÆ¼är¹ZÐŠ\0Pó™p‹¼¼¼xeÚ´if×®]Vè†jÏž=FfÑæ©§ž:;|øð´(\0Ô`6<kÖ¬SC‡5;vì0µ±wï^3xðàËO?ýôjŸÏ×ŒÖ€”••u;vìÅÙ³g›Ó§O›HÐåy¼KÏ<óÌF–-\0 „±ñ+¯¼b._¾l\"mÞ¼ye†œ›˜˜Ø˜Ö€Jè\Z±.MèŒ8\ZAì7sæÌoÓÒÒÞ¤Å úa®Gji¢ª%‹ÌÌÌS)))‰´:\0TXžÐ£&ôˆ‰XÐõRSS²~\0ô8b=|-–&Mšô™ÌŽGÐú\0ð·3ëô„ŽXÍŠýŠŠŠ.x½Þ/ø0\0DNNÎ=³.šÚãóùJÜnwgz@ÜÓ½&ôg\'deeíHII™D/\0ˆ{ºéî5á„?üð°„ñrz@ÜÓÝ×tÓ\'?~ü„„q½\0 î¥§§—ï¾kºñ„ñ9z@ÜÓýˆ¤ÏO/\0ˆ{O<ñÄgÆÇ™@‚µf|Î©5ã’’’ý¬€xñÅ÷9u4EvvöûM\0bÒ¤Io:uœñ¸qãVqœ1\0ˆAƒý»^³Î3ðÎééÐœ\0¶!C†”ÆzoŠ‚‚]¢8ÄÞ\0`;vì‹Ó¦M»Ë0~úé§W±k\0Ð…fdd”écaëÖ­Ù:+f?c\0¨`àÀÝ\r\Zt1ÚWúøöÛoz½Þ}\\é\0‚èß¿ÿŸ³²²ÎGñÃ¼²èZñRZ\0‚ÐÓd†œ=wîÜQä²1cÆüA+ÖeZ\0ª	äŒŒŒ÷§OŸ~æìÙ³[šxæ™gô»å¬@œžž¾¬ÿþ§vîÜy¹¶ÖÙkÄK™@\rè‡liiiGÆPB9œ¥‹s………kt\rZšàÃ:\0¨%ÍºÝîç³>}úŸ6mÚŽ7~qôèÑÝØ¿ûšnúóÁdë)ÎzfÂ#X–\0€ÈÏ”;I•`~SúcÝþR÷#¶¿éš°Ü÷²žâÌ™u\0Û€¾,³ßF´\08Æç»wï~-\0Î†ñ™ôôôæ´\08Æßø|¾–´\08Æ¥§-\0Î†q±ËåjCK\0€³a|855õvZ\0œ\rc=¹ãNZ\0œ\rãý.—ënZ\0œ\rã\"ÇóZ\0œ\rãÝn·ûG´\08H÷¨ðz½h	\0pvf\\¨Ñ\0àl¨»´Ñ\0àloòx<?¥%\0ÀÙ0ÎãJ\0à0™ç$\'\'?DK\0€³3ã5ÈÝh	\0p6ŒW¹Ýî´\08Æ’êEK\0€ƒ<Ïefì¢%\0ÀÙ™ñÈZ\0œ\rã×¥Òi	\0pLŠçv»Ÿ¤%\0ÀÙ™ñ©ÿ¢%\0ÀÙ0þÌŒÐ\0à 	âÙg-\0ÎÎŒgH\r£%\0ÀA2+~EfÇ#i	\0pvfük	äÑ´\08Æ/I£%\0ÀAn·{¼ÌŒ\'Ò\0àìÌxŒÔdZ\0$³âçdv<…–\0\0I—@žNK\0€³3ãAzâ-\0ÎÎŒè)Ñ´\08H7	ÒÍ‚h	\0pvfü¤n£IK\0€³3ãtÝ`ž–\0\0é%—ôÒK´\08H/Fª%¥%\0ÀA2+î%õ\'Z\0$³âž2;^IK\0€ƒ$ˆ»ËÌø}Z\0œ?,aü-\0JNNþ¹òzZ\0$³âŸIåÓ\0à ™ÿDÂx-\0r»Ý?–0ÞFK\0€ƒ$ˆ;J LK\0€³3ãI ïÖï}>_3ùþÎÔÔÔÛi\0ˆîL8OêT±”	R‹h)\0ˆ\"ÇóT!¬uIgÇ´\0DQbbbc{f,ŒçÑJ\0àìì˜Y1\0Äxv\\TI/§u\0 †ÜnwŠa,3æŸÒ2\0cÀ›‚8‡\0gÂ81`fœH‹\0€s¼YfÅßÑ\0à äää_H _¦%\0Ô[Æ˜Æ\\^PPðÝºuëLNNUƒÊÍÍ5ùùùÇ¥ÒxU›ñ¦M›LII‰¹páU‹*--57n<%ÁÜ›W€°èŒ˜ Žh _™r¯,\0aÑ¥	B4²%a|‰W€°èz\'\Zñ06¼²\0D%ŒÏ|Sl.2{r_²J¿×Û_Â@ŒÂ¸ìäóIö8³ó½‘W•Þ¦÷À„1€„ñá=+¯	b}¹gLˆEåM	\ZÆzLˆA’3!hë}0a€0&ŒÄGëÑÁÂXï#€	c\01ãý›ç\rc½\0&ŒÄ ŒOÙe>ùàÅk—(ä6½\0&ŒÄ Œµ}ôú5a¬·¾„1€X…ñùófÿ–y×.QÈmzLˆrëvû6Ï	ºf¬÷qa Za,3ÞâýëÍîµc‚±¿ôgôg™%Æ\0\"ÆÕÍ†™%Æ\0bÆ¡Ì†«š%Æ„1€„qMƒØ_„1a aLÆ\0cÂ\0aLÆ\0cÂ\0aLÆ\0cÂ\0aLÆ\0êAoÞ¼YÈ,X° ü¶Q£FY·=z´ÖÿÀXU±Æöc­]»Öú»¹¹¹„1\0Â8œZ¿~½yûí·Mß¾}­Çœ9s¦õçÝ»wÆ\0ãPÃøôéÓ¦_¿~¦]»v¦}ûöfÄˆå?7yòdsë­·š¶mÛš‰\'Z·­[·ÎÜu×]&33ÓÜrË-VëíYYYÖcîÜ¹óªç:t¨¹ãŽ;L«V­L¯^½Ì‰\'‚>g`k ëóÌž=›0PÿÃxáÂ…¦Y³f&??ß,Z´ÈtíÚÕ|úé§fß¾}ÖÏ¼ðÂÖlW¿_¹r¥yï½÷¬ïï½÷^ë¾¯¿þ:hôÑGæž{î1K–,)¿ÅŠAŸÓÆS§N5Í›77éééæ|wœ#Œ8ÆÛ¶m³îÕW_-¿mäÈ‘Öm%%%¦°°Ð4hÐÀ´nÝÚ\n¿¼¼<ëg¦L™b\Z6lh£i‹-¬Ù°?Œßxã«ž\'ØÌ¸¨¨ÈzŒGyÄº_gºÁžÓÆ7¶žûàÁƒ,S\0¨a|àÀ+àtÉÁ[FF††gÎœ±þ¼zõj“ššj-Iøg¯Ã‡·BQƒû¹çž³jÙ²eåa\\ñßWYëÏêc¤¥¥™×^{ÍºÎœ9AŸÓÆ:u²–@t)ƒ0P/ÂXWg mÚ´±–*t†Ü²eKÓ±cGëþùóç›:˜½{÷ZK\Z52³fÍ2kÖ¬±‚QCtëÖ­¦sçÎ&;;»<ŒýkÅU…ñèÑ£M“&MÌáÃ‡ÍâÅ‹­ûgÌ˜ô9ýa¬ÿ÷éÓ§[·oß¾0pý‡±ÿí¿~ˆ–`v¦ë¸[¶l±î;vì˜yðÁ­5\\]ŠHJJ2\'Ož4gÏž5>ŸÏšÙ6mÚÔôìÙÓ\nvû—ª\nc=¢B? Ó%‡.]º˜Ûn»Íôïß?ès~€WVVf}€§ëÉ„1€zÆþ*--µÖ‰+»ïÔ©SÖQo×ÛüÒÕ´4|ÃyNNú\0P¯Ã˜3ðc\0„1a€0¦c\0„1a€0¦c\0„1a€0¦c\0„1a€0¦c\0„1a€0¦c\0„1a€0¦c\0„1a€0¦c\0¤Wa&@#Zç$Œ/ñÊ–üüüâ`ÁSá×‘#GÞ’0.â• ,ë×¯tÃ†\rß;vì[Â´v3b\râÜÜÜ/¤zóÊ6	2›+Ô·×ºÞY—+%%¥®þÛ´íŠb\0qAÂø‚ËåjJK\0€ƒ<ÏéÔÔÔïÑ\0àìÌ¸DfÆ­i	\0p6ŒËÌøvZ\0œ\rãÏÜnw{Z\0äñxö¸\\®Ò\0àìÌø/Ri	\0p6Œ?t»Ýi	\0p6Œ7x<ž.´\08ÆÙ23~„–\0\0I¯”@N¢%\0ÀAçÈ.Z\0$³â¥Èi´\08Æ¥úÑ\0à ·Ûý?23Î¤%\0ÀÙ™ñ©a´\08HfÅ/ËìøyZ\0œOz‘–\0\0ggÆ£%ŒMK\0€ƒÜn÷p]7¦%\0ÀÙ™q¦QAK\0€ƒôc=Ö˜–\0\0ggÆiz-\0Ò})t\nZ\0¤;¶I½«ß»\\®òýòµ\r-\0Q¢a+3á%pI•J™ 5Ö€èÎ„\'UÂZe>Ÿ¯%-\0QžKàWÆSi%\0ˆÇ34HŸ“ûZÑB\0»Ùñ5kÆn·;‹Ö€ØÎŽÓ*†±×ëí@Ë\0@ŒÙGVøÃx9-\0\0NãDZ\0œä-R—ä[g\0§ôîÝ»{bb¢†±‘êA‹\0€3nÚ´©±Iq’@€Ø{¨B\0w#ÀÙ ®îv\0@Œ‚8ðþ2{¦\0p ˆýX²\0\0‡ƒ80K™!€sAø÷J™!€sAø÷YC€(±	¨`XC€(ÏˆC	ãÀÇc†\0âpÂØÿ¸eÌ ²An\'$°d\0âš„±ÿy8Ê\0\"Ä5\rãÀ@f\r\0ÂbS‹\n†%\0°µ´s^3àH…±zÞþ6¨ÀÌ8¡úÃÎ¢53Ö£+£\0 ô¥ŠêB:þ½+X¢\0€rM¦à\0¨&(Ã9Ê!Ü0î”ÀQ\0ë(‡›nºéÑH†±<Þ/íqoš\0ªáóùš=üðÃ‹“’’®ÜxãG\"Œ5ˆ}ôÑïºvíºÜårµ • \nn·ûÑ”””ƒRËÛµk×\'¡ú½$B>žXÏ\'ûºÔ©¾&LhH‹@\0™­~_‚x­„ä\'çÁ€»j{¦Ü5\'vÈst’Ê—Ú!Õ•Ö÷’’’þNÂ÷	Åù:411±q(\Z¢*Îð\\ž÷3ùºRÐ\0â’„oš„á—òõwééé·Ö&XkúóÂM%Œ‡ë/ù:»OŸ>·Ð3\0â‚_G©ÿ•Ú&u˜K¡,YtJó¨	\ra\rc;”‡kHÓS\0ê%	¸›%ìæIKõ“›\ZÔàaª›ñêýÅ	5<|Í^»^i/_<N¯¨7ô¨	·þRÇtöéóùj»)O°+vø×–k}B‡~ˆhÀ§ôu¢\\×’““\0þX-/55õ_#øÐ¯úêF¸¿DúÚ‡Â½.ÿþÛéQ\0×•´´´¶`K¥þ*åŽÒÓøgÂ¢¸ûZzzzsù?¼$u\\¿rÒ€:/##£‰Ì„GJh•JMÖ ‹òSêÙ$Ä`LsÒ€:ÏëõþÂãñì• Z%Ü>†OÓá9i@$oÛï’Pú³Ô>	äÿŒ—ÿ7\'\0¨+!|£½–Z*ô|<›ËI#\0åñx~%ô¹|}S©]¼·\'\0ˆõLð‡8¹R;“““ÿƒ¹¦}8i@ô¤¦¦~Of†=ó(¡ÓˆV©ò\'\0ˆ¨&ºðWR$dZÑ$¡á¤\0aÂU õ¡×ë½©N\ZP#­Ýn÷ou6,3á\'j¶¡*à¤\0¡†p#	ßAöFïÓu˜V‰Ú;N\Zp-	ß.2Þ%_säë?Ó\"ÑÇI#\0®zë¬Ç\nÛÇÿŠ‰ù»N\ZâY÷îÝoð­gÏÉ×‰z6­âN\Zâø_Jí—AÿŽî+A‹Ô©™2\'\0q0Ðï–A¾ZwV“þ-RwqÒpý\rÚjOÂ°sýµ½ÇðÝs˜–«ûjrÒÇ0ÐÓ’e.¯ægRì«m¼®Wß Õ®?áœ4b_]%‘VbÄ> LÊT6øôzsrû©¿èuèh±zÓçAO\Z±_¾$u(}\npkì 6zÁÏÄÄÄÆz»BûSùczEfÎòª—}_éI#zÑWÿkBW¤¥€èÆÞþAç/¯×;@àSò}±Ôoä­ìÍ´TýxÒˆ|\\ñ5¡¯Z	ˆî[ÕÃžñE{CŸ´RüÐã‘“““GHß_®$ŒKù@ˆ=]¹’Aç¯y´P\\Î{Mè†O´P3Æ4>xðàò‚‚‚ïÖ­[grrr¨\ZTnn®ÉÏÏ?.•f/Oøªb­KÌŒã‹~FPÙ;¥\nïšc\\Fo\\ÖiÚá›6m2%%%æÂ…T-ª´´ÔlÜ¸ñÔ[o½õ¤½lªx9DT\\ÍŠ³ª{MHu¹\\m—‘—Ìu{]^óÒáíøÃ†\rÓÃØÎéì×>ƒîù~‘Ô©	zuf9Ë}ÝüGV ~Ó~–>kï=½ÈÞðI¨ÈÓ#lô7ûÊÝWä¾ÃŒËÈK™)Õé‰¾¢³\"W§OŸ6ýúõÓÎ8y[ÚŒB8ü\'0.#_Æ—êtçëº\nÙZ³f!VÀ¸¬salêE§Ÿù¦Ø,\\döä¾d•~¯·ÑÉ×a§£Þ„1ã2ÎÂ¸ìäóIö8³ó½‘W•Þ¦÷ÑÑ„1—ŒËtúá=+¯ép}¹gMƒqÉ¸ŒE§åM	ÚézMƒqÉ¸ŒA§’3!h§ë}t4aÆ%ã’N§ÓA3.ã#ŒõSÚ`®÷ÑÑ„1—ŒËtúþÍsƒvºÞGGÆ`\\2.cÐé\'Žì2Ÿ|ðâµo…ä6½Ž&ŒÁ¸d\\Æ Óµ}ôú5®·ÑÉ„1—ŒËXuúùófÿ–y×¾’Ûô>:š0ã’qåN×3yömžtmJïãlÂŒKÆe´:]~³ï_ov¯´Ãý¥?£?ËocÂŒKÆe;½ºßºü6&ŒÁ¸d\\Æ ÓCù­[Õoc:0ã’qN¯i‡û‹N\'ŒÁ¸d\\FãS[Š0ã’qI§Óé Œ)Â˜\"ŒÁ¸d\\Òét:cŠ0¦c0.—t:Â˜\"Œ)ÂŒKÆåõ×é›7oÖÿ¨Y°`Aùm£F²n;zôh­ÿ°«b?>ìÇZ»v­õwsss	c0.—tz8µ~ýzóöÛo›¾}ûZ9sæLëÏ»wï¦ÓA3.	ãP;ýôéÓ¦_¿~¦]»v¦}ûöfÄˆå?7yòdsë­·š¶mÛš‰\'Z·­[·ÎÜu×]&33ÓÜrË-V§ëíYYYÖcîÜ¹óªç:t¨¹ãŽ;L«V­L¯^½Ì‰\'‚>g`§ëGŸgöìÙ„1—ŒËúßé.4Íš53ùùùfÑ¢E¦k×®æÓO?5ûöí³~æ…^°~«ê÷+W®4ï½÷žõý½÷ÞkÝ÷õ×_íô>úÈÜsÏ=fÉ’%å÷¯X±\"èsú;}êÔ©¦yóæ&==ÝœàÎV„1—ŒKÇ:}Û¶mVC¾úê«å·9Òº­¤¤Äš\r\Z˜Ö­[[œ——gýÌ”)SLÃ†\r­ÐkÑ¢…õ[×ßéo¼ñÆUÏì7pQQ‘õ<òˆu¿þF\röœþNoÜ¸±õÜd™ŒKÆeýèôX\r©omü·eddX~æÌëÏ«W¯6©©©Ö[ÿoÉáÃ‡[¯/çž{ÎªeË–•wzÅ_e®?«‘––f^{í5ëþ9sæ}N§wêÔÉz«¥o™c0.—õ¢Óµcõ7]›6m¬·Dú›¸eË–¦cÇŽÖýóçÏ7:t0{÷îµÞ’4jÔÈÌš5Ë¬Y³Æê\0í¬­[·šÎ;›ìììòN÷¯IUÕé£G6Mš41‡6‹/¶îŸ1cFÐçôwºþß§OŸnÝ¾}ûvÂŒKÆåõßéþ·ºXŸ`Þ¢ëE[¶l±î;vì˜yðÁ­µ\"}Ë“””dNž<iÎž=k|>Ÿõ´iÓ¦¦gÏžÖÈßéþ·0Uuº~r«è[›.]º˜Ûn»Íôïß?ès~PPVVf}P ëV„1—ŒËzÑéþ*--µÖ£*»ïÔ©SÖ§©o×ÛüÔ´´“ÃyNNú\0ã’qY¯;3}c0.—t:Â˜\"Œ)ÂŒKÆ%N§ƒ0¦cŠ0ã’qI§Óé Œ)Â˜\"ŒÁ¸d\\Òét:cŠ0¦c0.—t:Â˜\"Œ)ÂŒKÆ%N§ƒ0¦cŠ0ã’qI§×Ù²÷‚jL_CŒ%Â˜ªEé>¬z…‚”””I.—«±‚px½Þ¿w»ÝSô5¤¯%ÆT…±^í•ŽŠh{÷Ýw/y<ž%È_IeH(7\"fP•ž={Þ$¯™Ñòz)•0~uÕªUŒ¥K	ãKuúEŸŸ_lÃi*ü:räÈ[ÒéEÚ¶2°:Ê\0[/_?‘ÖÈAEMäµ1@^#G¤Þ’™ñ?1.£;.ë¬õë×?ºaÃ†oŽ;ö-V»ß¼Úá¹¹¹_Hõlc	äž2ÐŠ¤>ïï%‚ \ZÈkÁ#¯‰Ï$Œ×ê/nÆelÇe$ÿÈò[£P§ñº®BÕ¨´íŠ‚uxbbbc{™2èŠ¥^KKKkKÅ\'}—$õ±¼>”Jd\\:7.ÇRSS¿\'¡ü²ÂãR/¦§§7§UâƒôûO¤6Jí‘zŒê\0—ËõÆ¿—úRªï„	\ZÒ*õ6„ÿEúø]©Ï¥|ô5P7ß²þXh¾ÔN´Ó\"õ‡ôéöQ5GåëÐîÝ»ß@«\0uàö’Ú\'õ¾Î¤h‘ëú]OkéÇYöRÔ„¤¤¤¿£U€ëˆæ$ƒw°Ô1=ÖTBù6Zåú¡¡+}6QCX¾ÎÔP¦U€ë˜Ïçk)a<Í>àÔ7Ò*u—.?H_\rÓå©Å^¯÷Z¨_owï’Áý©¿J(÷‘›\ZÐ*uª\ZI¿<)ýó…ÔŸY^ê9=$Jû©íU—ŠØ±×øÿOjƒö-Ä™…¹dð¯+eVö}Z$ö’““.}P õ	án´¿o›J—0(‘š+ÐŠV‰É/Â“öÎ–Ú/ß§$°dÀå›õ{ýOj”ÏçkF«DžnÜc¯ÛëF>ýõ´vZ@e¡|·„Ä\n=»K7žaÆÒžÿ 5_ßÈLøyÝâ’VP-ÉáŸJpl•Ú&õ3Z¤Æ3akswû„ÿÖ?Ó*\0Âåß–Q÷@X¡³fš$47w×™1­ VtýX×‘5Xì3Án¦U*lsw\0ˆ=ÒB¸ÐuOùþY=ƒV¹æ]D¥›»@Äé1ÉöŽzŒ²+ÞÛ#ÔÍÝ *4xì³ø¶ÄãYclî N½=—0N×ý.ôøYÝÿ\"ÆÏßÒfsw\0u“î§;ÂÙGLÓâBø;-jù´I©5}€pNº`sw\0×Ó[÷ÛìC¹Žé^ÊztAá¶´k¬\ZÄ\'¥²ì¯a²}”Èòê™ÍÝ\\Ï3åêUFì«ôª$ˆ;I]’:Ê,:Hû¸[MYž{‘”Ñ¥†Êîgsw\0õFrròCf;ôº|z}¾€ Ì³ƒÐHÐ½Y‹ ®îö`AÜÛÿüºYOà^lî ^Ò¸ôŠÕö•«oŸa*TïZqàýeöL¹ª ¾ÓÞ)ðùû³¹;€¸žžÞ\\ÂNßö_®$ŒK«ù@/Ô™oµK²9Ÿ_n;)ÿ¶½lî .Hà\r¬$ˆ­’û~[Ë äÒÊfÈzD°ç—ú\r= ÞÓê$ðW†¦’“\'Â\râÀ¿W\Zø÷$ì;Û\Z{þâ\Z|˜\0×Ý¬8«ª ¶ë¬ËåjSË dk\rY_“Ç.\náùGÐS\0ê-;ÇêR„R¦GPØGTäÙû:ÒCÈäû+rßáV­ZyBbPU-Yœ¼ÿþûfß§í³çT‘ýoy‡«o\0ˆ{ú!Þ}÷Ý·¬I“&ß5mÚôñj~<”0N¸á†~©\'ûG6w€Ð—N†Ä!‡±?í%‹41\0„ÄafÈal«Ñ™z\0@G6ŒýÏSJ @d‚¸¦aÈÝhz\0=ˆM-*–,\0ÀÖÒÌyaÌ€#Æêyûg8Ñ\03c{†ÚÍ™±]Áå’\0 Œ¥ŠêB:þ½+X¢\0€rM¦¨n&\0qÈáånwJà(\n\0I·0f®á„±FÜ›&€ÐgÈ¡œºjÄ\0P‹ruÌñÄ\0£rmÖx	b\0ˆà¹¦Wú ˆ Â3äp‚• €(ÎCY²è”À‡u\0àèYï/&ˆ 6\\ÙQáŸ\0ˆ` wbÎ¬\0øgÂØ}\r\0œ!§¤¤‚\0f‡1\0€0\0Â˜0\0Â\0@\0a\0 Œ€0\0Æ\0@\0c\0 Œ\0„1\0Æ\0\0Â\0c\0\0a\0„1\0€0\0Â\0@\0a\0 Œ€0\0Æ\0@\0c\0¨ãÁ»JÃ·š*¤¥\0 ºaÜIêRUaìv»{ÐR\0ý@^SE˜˜˜Ø˜V€ØÌŽ+\rcÇó-\0±äÊÖŽ™@ìgÇ—X+\0‡Iø¾Ã¬\0œãÎkÅÝh\0pˆí˜Y1\0Äˆ®Î€%|\'Ù‡·I]Xª8,÷çH½,•æóùšÑj\0!.—«í	ØÏB8û.°Š¥æIÝI+@-fÂn·ûy¯×{6Ì®X—t¶ÌL\0ÂŸ\rß-º³b°fffšùóç›‚‚säÈsîÜ9£ôkII‰Ù¾}»Y²d‰:the§I,õ#Z\0B GI¤¦¦–éÈ‘#­ ½|ù²	ÕŽ;Ì˜1c*†rÇ#@Aìõz¿õ‡§„²YµjUX!\\ÑÚµkÏç»jÙ‚@€*–&$ˆ¿\\’Ø·oŸ‰„Ï?ÿÜ\Z4¨â™%\0d¶¶30ˆu\r8’ôñY×ùP\0®^žx>pi\"R3âÊfÈ–,¦Òú\0ð·å‰6‡¯é\Zq4é\Zràú±.Ð\0âžžÐxÔÄÅ‹M´\Z5*0çÑ\0âš½V\\~f¾»víºêL=™· 7\0Ä-=Ä,ðC»ÚÂ®ÀCt/z@</QLòâÂ…M,-[¶,0Œ_¦7\0Äs—_\\TOqŽ%]	XªÈ£7\0Äsï÷bqqqLÃX;Ü~“Þ\0Ïa\\~;ÿ¦?±¢Ï¸o½ žÃ¸<@\03c\0¨3aÌš1\0Ô0æh\n\0¨aÌqÆ\0à4	ÁÇœ:oÈ!W8\0þ¶7…®×²7\08¿T15p×¶XÌŽ+\\]Û\0@÷3ÖË ±Ÿ1\08?;ž«+}<ñÄW¸Ò\0TB¯E§×¤‹ö5ðø×À€*èÕš—+\"}uèÀ æêÐ\0P…äää‡Y—,t\r¹6êé\Zq…¥‰Kº©=­\r\0a²ÿ(‹;v„}øÚ¸qã®ÚÂžÄ\0ê’Eà\ZràÒ…ž©WXXhíeáß\\H¿êš°¶žYxBGà\Z1K\0&ýpÍ>Êâ\\Å`\r³tg¸©|X\0µ Ç!ËŒ6+ðL½«XOèðx<?  BôÔi{/‹Iönoû+	ß<ÝôG÷šàg\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@]õÿ„¡ª©¢!\0\0\0\0IEND®B`‚',1),('3',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.myProcess_1.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ë\0\0`\0\0\0Z\nŽz\0\0IDATxÚí{LU×šÀ«¢C¢™8ñïÄ:Þ˜þÑ1šëL¼ñÎÈÕŽÓNÔ[“Âáð¨T;>*¥¢kÓ±¨øÊøˆZ{çªwîø( ‚AÑ£©ˆÅJÛp)EE@Ä×šõípÈ=äpÎbøý’/ÂÞÇ³õ;û—ï[ë¬½÷k¯\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@—A)åŸžžþñ¶mÛÎ%&&Þûä“OGDD¨àà`öìã?~˜psõêÕüè£~KÆ\0¼ÌO?ýô«ýû÷ç-Z´èidd¤JNNVùùùª¼¼\\544(áÑ£GªªªJ9•’’¢,Xð,::º:>>þóÀÀÀ~d s+i¿ìììQQQÏÖ¯_¯._¾lIÙV®^½ªtV~øa}llì42\nÐIÕtóæÍ5111êÒ¥Kª#\\»vMé¶øÉ¼yóŽé¶ÙŸìxˆÚÚÚI+V¬x´eËuÿþ}å	¤]Öï÷xáÂ…9´Å\0ª¨\"ê—_~©ž<y¢<ÍöíÛé\n›àG¶:0F•ÖW*jgˆêdÓ¦MÂÂÂ¾&ã\0¯ˆL&ÉÕS­ok-qdddMppp\0Yx…öWf}eÆ×È¤ShhhãW€v\"ß£Ê×3ÞdÍš5ßéêº˜ì´}¬ê/¼UU5†„„üÈd@ÉÈÈX,+“:sRÉU6›mŸ@µ¾²„Ð$%%]Ò­ð\Z>€6 ‹òe­¯/8{öl©–õ Ÿ@«gdQ¾/¸}ûvµ–µˆO \r„‡‡7_=ãmäÂ\0-kŸ@ëQ}‰ŸO \rÌš5ë™+ëm*+@ÛÇ¬\r¾\Z³VUUÝ`Ì\nÐFV­ZUì«Ùàôôôo˜\rh#kÖ¬ùÚWß³®\\¹ò(ß³´‘èèè¿—{&ù`Sƒ,7d@;X´hÑ-o¯\rÖ­·´Àß³6 ¬X±bÕúõëŸySÖyóæåª€v\"72›;wn­Ü‘Ðœ;w.]ª*×³¼QQQïèñë£Î¾SÄƒ*ôXµ˜;E\0t€ùóçÿ)))éa\'N6Õ.X°@ÆªûÉ6@É]aÓ·mÛÖØ	ÂÖÆÇÇÿ·|¯Êýƒ<$¬¿~³aÃ†ºúúzµ¾.”	¥ƒŒS<,lxxxŠn‹k\n\n\nžtt2©iŒºŸŠ\nÐIÈ$PXXXYBBB‰–¶=­qƒÃáH•1°Ìú2™à¤\ZÚl¶(»ÝþÝûï¿{ýúõ—rrr~¬¨¨¨r>¨J®ž‘Eù\'NœH—%„²2©IÒÅ´½\0¾©´ãu¬Ðâ~­þV.o“ëQ›þ,’1©Þ÷…,!de€y?ÑÕ³™\00_Ö‡ï¼óÎ_	\0óe­ïK&\0Ì—õ^DDD2`¾¬·ìvû@2`¾¬åCÉ€ù²–†††þ‚L\0˜/«,~xL\0˜/ë\rÝÿ’L\0˜/k‘ÝnƒL\0˜/k¡Íf{“L\0Ž¬		K&\0Ì¯¬YàO&\0Ì—õ,7êè\Z²ž¶Ûí¿!\0æËšÍ \0º\0ºªf½E&\0Ì¯¬©ZØ·É€ù²µÙlÓÈ€ù²þQÇL2`þ˜õº²’	\0ó+ë-¬L\0˜/ëW:ÂÉ€ùmðê6ø2`~eÝ¥ã_É€ù²þ‡®¬È€áhQ·èV8šL\0˜_Y7êø˜L\0Ž®ª_êê\ZG&\0Ì¯¬ÿ¦…]F&\0Ì—õs+É€áè8AWÖÕdÀüÊ\Z¯c-™\00]U—èêºŽL\0˜ßÇja7	\0ó+k´,Œ \0æWÖ²äL\0Ž,â—ÅüdÀüÊú\\&G&\0Ì¯¬ár:™\00¹¥‹ÜÚ…L\0˜ßÊMÓÈ€ùmðL¹)™\00¿\rž®«ë2`~üŽ®¬ß	\0ó+ë?iYO	\0Ã	\n\nú­6‹L\0Ž®ªÿ #—L\0˜ßÿZËz†L\0ŽÍfû;-ëy2`~<Nû-™\00¿²¾©…-”Ÿ#\"\"üõÏ¯‡††þ‚Ì\0ø¾’fëø^G¹å&’É€±Ûí¶\"©Äc©®d\nÀÇø5UVw²n\'K\0æWWª*€Õµè%²$;\0†a³Ù¦µ”UWÜß\0Ñ‚žv5ƒŒ\0˜+k€Ke\r #\0f›§«êS2`8AAAÿ¬…}B& [£”ò+))9˜ŸŸÿôäÉ“*##ƒx…ÈÌÌT¹¹¹·u„qVA§ ¢ž>}ZUUU©ÆÆF¢qëÖ-•““S£Å}3<ŽTTDõ¨°ºÒqfÇ‘ÖÉ<ZÖÇœYàqd¼…`—UqfÏd­»W®JÉêjæçVÈÏ²\r9‘’µön™º’¾R{.d›ìCPdCd-½zäQñç«GYÁY‹²×¹•Uö!(²‚!²^ÉøÌ­¬²A‘YÚ#«Ìþº“Uö!(²‚!²ÞÈÛæVVÙ‡ È\n†ÈZ]vY]9±êÅXo“}Š¬`ˆ¬ß_øêYer\"+˜$ëÃ‡êÆ™í/¶Àz›ìCPdd•JÅy[ÝŽYe«˜|)«®˜å7²TaZ¼[Q!¯‘×Re‘¼,ëÏUSª,²‚!²¶¥š¶Ve‘YÁK²¾ª¨Î@Vd_ÍÈ\nÈŠ¬\0ÈŠ¬€¬²²\"+\0²\"+ +¬Ð•dÍËË“TíÚµ«yÛÒ¥K­m~ÿ‰\'ZïÕ2Úý^iiiÖß•çÓ + «‡eÍÊÊR‡R³gÏ¶ÞsÓ¦MÖï………È\nÈêIYïß¿¯æÌ™£†®F\Z¥/^Üüºµk×ªÁƒ«aÃ†©Õ«W[Ûä±#GŽT‘‘‘jÀ€–¬²=))ÉzÏ‚‚‚çŽ£FŒ¡¨fÎœ©ª««ÝÓUV^Ž³eËddYwïÞ­üýýå±ˆ*99YM™2E]¿~][¯Y¾|¹U-åç#GŽ¨ãÇ[?3ÆÚwçÎ·²^¸pA=ZíÛ·¯yÿáÃ‡ÝÓ)kbb¢êÛ·¯\nW=xÅ²‚Ñ²ž?Þ`ÇŽÍÛâââ¬mò”:‡Ã¡zôè¡\r\ZdÉ‘m½fÝºuªgÏž–8\"Z¿~ý¬jê”õÀÏÇ]e-**²ÞcêÔ©Ö~©”îŽé”ÕÏÏÏ:vII	m0tYoÞ¼i	 -­sÛÜ¹s-Yêêê¬ß;¦BCC­–×Yýbcc-iDì%K–X‘’’Ò,kËßËd•×Ê{„……©={öXû·nÝêö˜NYÇoµØÒ*#+tYEH©`C‡µZa©°ýû÷WãÆ³öïÜ¹S;V]»vÍjE{õê¥6oÞ¬RSS-qD²sçÎ©	&¨ôôôfYcÕÖd]¶l™êÝ»·*--U{÷îµöoÜ¸Ñí1²Êÿ}Ã†\rÖö‹/\"+tYí¥Lò¼ÖôµŠŒ#Ïœ9cí«¬¬T“\'O¶ÆÒêÎ˜1CÝ½{WÕ××«ˆˆ«2öéÓGMŸ>Ýß)«³umMV™–	$ii\'Mš¤†¢æÏŸïö˜®LµµµÖ“Œg‘º¬.OÿVîž¦^SScÍÒ¶Ü.Ûœ“H¯\Z\"g{ŽÉ¢èö²²‚	YY‘•@V@Vd@Vdd%YYY	ddEV\0dEV@VYY‘\0Y‘•@VðrAóh4hYsfÇÉÍÍ-ww¡8Ñþ(++û½–µˆ3<NVVÖïN:u¯²²ò²u¬¢Š¨™™™?êx3:}rMÓÕÀ!í›Œ·Làà`eð¿OrW„¨\0\Z‘•,\0 +\0 +\0²\0²\0² +\0 +\0 +\0²\0²\0² +\0 +\0 +\0²\0² +² +\0 +\0²\0²\0² +\0 +\0 +\0²\0²\0²t=1Šœ?2à{YÇëxÜš¬6›m\Z™0CØÔVd=àG–\0Ì©®/•Õn·¿K†\0Ì»:¨ª\0]`ìÊXÀP´œÿCUè\Z²Np«¾MF\0ºÀØ•ª\nÐ5Æ®¬`‚î‹RÊ¯¤¤ä`~~þÓ“\'OªŒŒâ\"33SåææÞÖÆY‚ˆzúôiUUU¥\Z‰Ä­[·TNNN÷=Î,ð8RQÕ£Â6êJ[Ä™GZ_$ólhYsfÇ‘ñ‚y\\V&ÂÀw²ÖÝ+W%Ždu5ós+ägÙ†œÈ\nÉZ{·L]I_©\nŽÇ=²Mö!(²‚!²–^=ò‚¨ÎøóÕ£Š¬`Š¬EÙëÜÊ*ûYÁY¯d|æVVÙ‡ È\nÈŠ¬\0í‘UfÝÉ*ûYÁYoäms+«ìCPdCd­.»¬®œXõb¬·É>EV0DV‰ï/|õ‚¬²\r9‘L’õáCuãÌö[`½Mö!(²‚²Ê\n¥â¼­nÇ¬²ULÈ\n¾”UWÌòYª0-Þ­¨Î×Èk©²È\n^–õçª)UYÁYÛRM[«²ÈŠ¬à%Y_UTg +²‚¯fƒ	ddEV\0dEV@VYY‘\0Y‘•@VèJ²æååÉ	ªvíÚÕ¼méÒ¥Ö¶ŠŠŠ¿ÿÄ‰­÷j			í~¯´´4ëïÊóiÕÃ²fee©C‡©Ù³g[ï¹iÓ&ë÷ÂÂBddõ¤¬÷ïßWsæÌQÃ‡W£FR‹/n~ÝÚµkÕàÁƒÕ°aÃÔêÕ«­mòX‘#GªÈÈH5`À\0KVÙž””d½gAAÁsÇ‰‰Q#FŒPT3gÎTÕÕÕné*«/ÇÙ²e²²Š¬»wïVþþþòXD•œœ¬¦L™¢®_¿®Š‹‹­×,_¾Üª–òó‘#GÔñãÇ­ŸÇŒcí»sçŽ[Y/\\¸ F­öíÛ×¼ÿðáÃné”511QõíÛW…‡‡«‡¼bYÁhYÏŸ?o	°cÇŽæmqqqÖ6yJÃáP=zôPƒ\r²äÈÎÎ¶^³nÝ:Õ³gOK­_¿~V5uÊzàÀçŽã®²Yï1uêTk¿TJwÇtÊêççg»¤¤„6º¬7oÞ´–Ö¹mîÜ¹–,uuuÖïÇŽS¡¡¡VËë¬~±±±–4\"ö’%K¬HIIi–µå¿ïe²Êkå=ÂÂÂÔž={¬ý[·nu{L§¬ãÇ·Zli•‘º¬\"¤T°¡C‡Z­°TØþýû«qãÆYûwîÜ©ÆŽ«®]»fµ¢½zõR›7oV©©©–8\"Ù¹sçÔ„	Tzzz³¬Î±jk².[¶LõîÝ[•––ª½{÷Zû7nÜèö˜NYåÿ¾aÃkûÅ‹‘º‡¬ÎöR&y^kúZEÆ‘gÎœ±öUVVªÉ“\'[cHiugÌ˜¡îÞ½«êëëUDD„Uûôé£¦OŸn‰ï”ÕÙº¶&«ÌË’´´“&MRC†QóçÏw{L×	¦ÚÚZk‚IÆ³È\nÝFV—§+wOS¯©©±fi[n—mÎI¤W\r‘³=ÇdQt{YYÁ„¬€¬È\nÈJ + +² +²²È\nÈŠ¬\0ÈŠ¬€¬²²\"+\0²\"+ +¬€¬È\n€¬È\nÈJ +x¹‹ ‚y4\Z´¬9³Àãäææ–»»Pœh”••ý^ËZÄ™\'++ëw§NºWYYù «áÉÛ†z²¢Š¨™™™?êx3:}rMÓÕÀ!í›Œ·L¹[¡ÿ.É]¢¸\\i·Û‡	\0óe-ÔÕõoÉ€ù²f½E&\0Ì—õ¿l6[(™\00_ÖZÖX2`8ZÔOµ°ÿN&\0Ì—õ-k2™\00œÑ²~C&\0Ì—õWZÖ‹dÀp´¨­£”L\0N```-k#™\0èØl¶»ºþ+2`8v»ýšŽ7È€ùãÖÜ   $\0æËzP·ÂdÀ|Y·iY£È€ù²®Ô±†L\0ŽÝnŸ§eÝI&\0Ì—õ]-ëŸÈ€ù²þZËz–L\0NHHÈßhYKÈ€áöÓ²Ö‘	€.€–µ><<¼/™\00_Öi‡É€ù²ž•‰&2`¾¬ÿk³Ù~G&\0Ì—u—Ž¹dÀ|Y×È²C2`8²_ô“	\0Ã±ÛíA:þ@&\0Ì—u’Ž2`¾¬oÈí]È€áÈ\rÓäÆid  ·$\r\r\rýKýçëZÜ	úÏ÷\"\"\"üÉ€oÛÞ0-ãvGu8t|¯ã©å\\6`@\rh!æ¡…Ž!S\0f»µY´¬É€èñh-å-7²î\'C\0a³Ù‚_&kPPÐ[dÀ¼vøtË‰¥€€\0?2`^uÐBÖ²`®°IM¢>â»U\0ƒiºiÚ--m5Ù\00›Úíö·›®g-hZñØ¥%.Õû3t|!)¨º\0Þ¯¤CµˆŸi¿û¹Å-¢¼iåÓëd “+©nu?\r		©o§¤-ã±T[*-@çTÓ_jÁ\nZŠ©vîÜ©òóóUYY™jhhP‚üYUU¥.^¼¨öíÛ§bbb^V‹ÿ­Ž7É.€‡¯gBCCŸ[­g‰øäÉÕV.]º¤âãã[J[«ß\ZYð€¨ºí}à”KK«Ž=Ú.I[’––¦tü\\[Œ°\0l}µ¨w\\[Þââbå	~øáÝ²ÂÒ´—¦¯e\n\\E•1¨\'‘÷sVÆ°L:´¿ýýÔµõõTE}Y…mÑ\'’}€¶·¿C]¿ž‘1jg\"cX×ñ«´ß|\n\0m@<¸Îú>zôHu6K—.uv;Ÿ@ÛÆªÍ+“äëopùòåçV:Ézc>\r€ÖÇªÓ\\\'•:òM{q]8!k‰ù4\0Zo×8…Ù½{·ò&)))®²~Á§Ðº¬©Nad	¡7‘–Û¥ÎæÓ\0h]ÖNaÊËË½*«|ïêzyŸ@ë²6_ê\\”ï-äx®ë†ù4\0Z—µY_€¬\0TV\0Æ¬ŒY|#+³Á\0]DV¾gè\nhIÞõÕ\n¦E‹=c@‘µÁ2^dm0@×h…]¯ºñFumqo&®ºhM÷®åzV€.6ÑÔÙwŠ˜5kÖ3îðŠÈ½äžH}¦¨¨¨§Üƒ	 ƒÈÝ]ÛaOßÝÐUTînÐAä)æ®Âzê¾Á-Z_îÐÂ:g‰åûíýzfåÊ•Ü‘ ³[b×1¬kk,+‡µ–¸å³nDhY™äºàgÝ\0t22ùÓ4KÜÐÑ§ÈÉ¬/“I\0Œ|«+b’ëJ§ö<ŸÕn·¿A¼HÓmKßmª¶©®—×¹È™í|ò9K\0\0\0\0\0\0\0\0\0\0\0\0\0þðE^éõëÚ\0\0\0\0IEND®B`‚',1),('30002',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','30001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('30003',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','30001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('40002',1,'leavework.bpmn','40001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('40003',1,'leavework.ac_leavework.png','40001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('42502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','42501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('42503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','42501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('45002',1,'leavework.bpmn','45001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('45003',1,'leavework.ac_leavework.png','45001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('47502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','47501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('47503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','47501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('50002',1,'leavework.bpmn','50001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('50003',1,'leavework.ac_leavework.png','50001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('52502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','52501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('52503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','52501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('55002',1,'leavework.bpmn','55001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('55003',1,'leavework.ac_leavework.png','55001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('57502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','57501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('57503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','57501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('60002',1,'leavework.bpmn','60001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('60003',1,'leavework.ac_leavework.png','60001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('62502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','62501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('62503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','62501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('65002',1,'leavework.bpmn','65001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('65003',1,'leavework.ac_leavework.png','65001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('67502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','67501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('67503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','67501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('70002',1,'leavework.bpmn','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70003',1,'leavework.ac_leavework.png','70001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('72502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','72501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('72503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','72501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('75002',1,'leavework.bpmn','75001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('75003',1,'leavework.ac_leavework.png','75001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('77502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','77501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('77503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','77501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('80002',1,'leavework.bpmn','80001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('80003',1,'leavework.ac_leavework.png','80001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('82502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','82501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('82503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','82501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('85002',1,'leavework.bpmn','85001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('85003',1,'leavework.ac_leavework.png','85001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('87502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','87501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('87503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','87501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('90002',1,'leavework.bpmn','90001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('90003',1,'leavework.ac_leavework.png','90001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('92502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','92501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('92503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','92501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1),('95002',1,'leavework.bpmn','95001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('95003',1,'leavework.ac_leavework.png','95001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0¿\0\0\0f,ZŸ\0\0\ZIDATxÚít”å™ÇÑ¥G¶‡S¹.ÝªK«­ÛåÀ–nÙê)QZZ[Å²u2™™¦è\"(ˆ\\¹ÊZ†;t\n”¬¶\\Ë¥‚@K@\Z	µˆp„›¼û<ßÉä¡&™Læ9ü~ç<‡äûÆüÏüxÞ÷ïrÓM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'œsÍrrrž™3gÎæ¬¬¬Ož}öÙ‹ápØ¥¥¥¹ôôôËÏ<óÌ¹qãÆí›8qâ›?ûÙÏ$1€$àã?þÆ’%K6<øÓÌÌL·páBWXXèÊÊÊ\\ee¥S.\\¸àÊËË]QQ‘ËÎÎvO?ýôåAƒ=zô>Ÿ¯9)$¾ã6/((X;pàÀËS¦Lq;vìðDý¬ìÚµËI·vO>ùä™¡C‡>B¢\0	ìº3gÎ<9dÈ·}ûvWvïÞídH}é©§žZ)Cîf¤Ð€TTTt3fÌ…Y³f¹S§N¹x Cmy¾‹XÇ\Z ;¯ÊûòË/»K—.¹x3wîÜÒ‰óRRRš’6@œç¼:lÖÎÛòF˜1cÆÙôôô×I Žè‚•Îyã5l¾Þp:33ódZZZ\n©Äiè¬«ÍºÒœta+\nb>ô{^ýª(‘Lš4ééÂÃH ~sßfzF¢ºo„’’’óÁ`ðC´\0êAnnî0=Âª!®b‡Ëý~WÞ€:¢Ç6ëá‘ÁôéÓ·Ë0zï@ÑôØæÆàÝwß= ¿Á»\0PGô¬\"=1¡18zôè1¸„w ŽdddTŸU”hôä¸’w Žèù¼‰¾>ï@éÓ§ÏåFìÀGéÀ\0õ›W6Ö¸¼¼|/s`€z0~üø=µ\n““ó{V¡êÁ¤I“^o¬ïÇŽ»‚ïêÁ AƒþM¯aÕGbUê¡”‰PO|$ÑÇBË°]‡Ïû9\Z žŒ3fü”)S.\'Rà§žzjg#Ä½Ø\\¿~ý*ôJ’‰`óæÍ9Ú}9 N8ða™_hè+rœ={öÌ}÷pE€8Ó¿ÿ·¦OŸ~®´*ž~úiû.!m€8£JÒ‰sæÌ™s¾$®=zôoô{_®\rÐ€Ë|ø÷S§N=}æÌ™¸\r› ‹Vo0ïH€ÄÙ2¤>Y\\\\|©¾VUsÞ%t^€¢MéééÇW*\"×fX]YTT´ZçÔºÚÌ‚@#¡]Óï÷ôîÝûè”)S¶¯[·îÃC‡•Gnv¦gé‰	k×®ÍÑÃ#õ«*q‡1dHžŽÜEjŒÈüºHý\'=PÏç­ú³Dç¸²ï%=<’#¬\0lH}Iºì-$`Sàó\"ðm$`Sà³\"ðçHÀ¦À,TÅï÷Ÿ‡Ã-HÀf>Ú»wï;HÀ¦À‡322Z“€M?–ú’\0°)ð_¥þ‘$\0l\n¬‡LÞE\06þÀï÷w 	\0ƒÝ>Ÿï^’\0°)ð.ø>’\00ˆŸw„B¡!	\0›ÿ)v\"	\0ƒ¤¥¥éyÂ$`SàB©o‘€M7J}›$\0Ö¥¦¦~‡$\0l\nœ/?H\06Î¿K\0ñûýk‚Áà÷IÀ iii+¥~D\06þTO’\0°)ð›R½HÀ @à·2ö‘€Mõ6+i$`Sàl8D\06^,÷&	\0ƒ¤¥¥-êK\06~Uê?IÀ¦Às¥ú“€MgËx I\0$Ì“€M§ŠÀCIÀ¦À/‹ÀÃIÀæøç\"ñ(’\0°)ð$©1$`Sà	RãIÀ¦Àc´“€Atþ«ó`’\0°)ð¿ß?™$\0l\nü¬<…$\0¢GaéÑX$`Sàz<4I\0Øøiø¿IÀ \"o?=\'˜$\0l\nÜW¯ÊA\0	}DàE$`Sàtx	I\0D¯	­×†&	\0›ûôî$`Sàÿ!ô2’\0°)ðc\"ð[$`½7°Þ#˜$\0\"óßˆÀ«IÀ¦Àß×’€ARSS‰óIÀ¦Àß×‘€Mï—!ôHÀ ~¿¿«ü.I\0Däí\"UD\06î,õG’\00H è(“€A|>ß}\"ñ.’\0°)ð½\"ðn’\0°)ð—e½W‡ÃÍäç»B¡ÐI 	A¤öK•I¹µ¤\0’.?yqµ.j&)€$$%%¥iUŽ%ð\\R°Ù…é¾\0FºpÉ5~ƒt\0à÷û©)°tæHÀ\"í†(ysIÀ–À)Q8…D\0ì\r¥ÿ Ý÷S’\0°)pé¾Pç\\ÓÒÒÒ7\n?}ûí·]nn.U‡ÊËËsë×¯?*•Î§\n†Ê»aÃW^^îÎŸ?OÕ£Ž9âÖ­[wRd~œO$í¼ÈW‰ÏKG.á“	A‡Íˆß/òÉ‚„ ó7¤‹»ÀŽO$•À§?)s¥EÝ®¼¼ÒŸuÂ\"0$¹À\'º÷rÆºâUÃ¯(Ý¦û!‰>°kùUòFê£]+!™.)˜S`Ý‡´I,ð{¹b\n¬û !ÖUçXë>¤E`Hb÷nœS`Ý‡´I,ð±ƒ;Ü{kÇ_=|–mºi’X`­ý[u•Àº\ra’]àsçÜÞMs¯>Ë6Ý‡´I*°iµgãì˜s`ÝÇÑXÉ&°tÖ²½ùnçšÑ1å”>FK7F`HÿV×¥#0$±ÀŸ¥ë^¯#0C#\n\\Wy#…ÀÉ´\nM!0 0 0 0SŒÀ\0ŒÀ€Àu«7ê‡Ö½úê«ÕÛFŽém;tèP½Ÿÿþûï÷ž«f7®ÖÏµfÍ\Zï¿Õû!0 pÎÏÏwK—.u}ûöõžsÆŒÞï;wîD`@à†øÔ©Sî‰\'žpíÛ·w:tpÃ†\r«~Ü‹/¾èZ·níÚµkç&NœèmÓ[¾Ü}÷Ý.33ÓÝqÇžÀº}úôéÞs_ñúC†qwÞy§kÙ²¥ëÕ«—;vìXÌ×ŒXÿÐ×™5kÇxþüù®Y³fzN·páB×½{w÷þûï»={öxyþùç½®ª?/_¾Ü­ZµÊû¹cÇŽÞ¾ãÇÇxëÖ­îž{îq‹/®Þ¿lÙ²˜¯8++ËÝ~ûí.##Ã‹ã™TæÞ²e‹\'Å+¯¼R½møðáÞ6½ûaQQ‘»ùæ›]«V­<a\n\n\n¼ÇLž<Ù5iÒÄ“IåkÞ¼¹×u#¿öÚkW¼N¬\\RRâ=G=¼ýÚQc½fDà¦M›z¯]ZZÊ\Znl÷íÛçI¡ÃáÈ¶~ýúy>}Úû}åÊ•.\nyÃåH—:t¨\'’Ê>bÄ¯²³³«®ù÷»–ÀúX}Žôôt·`ÁoÿìÙ³c¾fDà.]ºxÃsf#0ÜÐ«¤ÚéÚ¶më\r£µ·hÑÂuîÜÙÛ?oÞ<×©S\'·{÷no{Ë-·¸™3gºÕ«W{2©x›7ov]»vu999ÕGæ¾×xÔ¨QîÖ[oup‹-òöO›6-ækFÖÿ÷©S§zÛ·mÛ†Àpã\nšêBÒMU_ñè¼tÓ¦MÞ¾Ã‡»‡zÈ›“ê0¹gÏžîÄ‰îÌ™3.{ô¶Ûns>ú¨÷ADàÈ°÷zëJ´.Rép¸[·n®M›6®ÿþ1_3z«¢¢Â[ÄÒù1Ã\r-pÔ]ê½yïµö<yÒ[®¹]·EªêZ*lm^“9\0)F`\0F`@`\n\0\0˜B`@`@`F`¦)†dG¯þˆtq­Jø\"Ÿ,Hë×¯/‹uò=Uû:xðà¯Eà>Yòóó{çw>9|øðY‚Äóò¯ñî¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉZk×®u@Àû3	ÿ~š]	ò\\‡´´´JŸÏ÷9’\0°)ð1ø$`SàDàö$`Sà½Á`ð+$`Sàâ@ Ð‘$\0l\n\\(õ-’\0°)pAjjêƒ$`¿ß¿JæÀ?$	\0›/•9ðOHÀæz‰œN\06ž\'Õ$\0\"Ýw†£“€M_Ÿ#	\0ƒˆ¼ãdýI\0Øœ“Ê\"	\0›šC\06î+óà_’€Í9pšü:I\0Øø1éÂo‘€M{ˆÀkIÀ 2|~@Þ@\0	ƒß·’€A|>ß}Ò…w‘€A¤ûÞ%µŸ$\0lÎÛˆÀ‡HÀ ¡Pèó\"ðI’\00HJJJS˜»ÿž_T‘IÀæ<øTÏž=ÿž$\0lvàÃº˜E\06Þ¯_\'‘€Mÿì÷û¿F\06Þ¦‡T’€M7èI\r$`Sàµ\"ð÷HÀ¦À¿“êI\0ÑKêè¥uHÀ¦À¿J\0y!g’€Í9p–^à$\0l\nü‚ÔX’\0°9%ÿœ$\0l\n<Do3J\06‡ÐýôFß‘ß}>_[º%É\0$¡Pè‹\"g®»³ê,$­#R—¤\\T…I 9;îê\Z²Ö¬½\\¡ yç¼_ÕËèÄØï÷$%€äîÂ³c|$7#!€$F$mQ5÷­)pé\0ØèÂÃjÈ{‘Kë\0ØéÂÍªV¡=¹Ñ7€1DÚ\'£¯¾N\"\0Æqß‘/€A|>ßDâs$p\rœsMKKKß(,,üôí·ßv¹¹¹T*//Ï­_¿þ¨T:Ÿ*H*ï†\r\\yy¹;þ<U:räˆ[·nÝI‘ùq>Y´ó\"o\\%>/¹„O$6#^|Kæ–¨tþ†tqØñÉ‚¤øô\'e®´h¡Û•÷‚Wú³nCX†$¸âÄA÷^ÎXW¼jø¥ÛtÒ\"0$±Àv-¿JÞH}´kÒ\"0$³À%“c\n¬û!‰~/wBLuÒ\"0 04„ÀºêK`Ý‡´I,ðÞsb\n¬û!‰>vp‡{oíø«‡Ï²M÷!-C¬µë¯®X·!,C²|îœÛ»iîÕÃgÙ¦û!IÖ#­ölœs¬û8\Z!Ù–ÎZ¶7ßí\\3:¦¼‘ÒÇècéÆI ðßêºtc†$ø³tÝëucF`hDë*o¤!™V¡)F`\0F`\0F`@`\n\0¸nµqãFýÐºW_}µzÛÈ‘#½m‡ª÷óßÿýÞsÕ¬qãÆÕú¹Ö¬Yãý·z?#N€ÀùùùnéÒ¥®oß¾ÞsÎ˜1Ãû}çÎÜÐŸ:uÊ=ñÄ®}ûö®C‡nØ°aÕ{ñÅ]ëÖ­]»víÜÄ‰½mzË—»ï¾Ûeffº;î¸ÃX·OŸ>Ý{Îâââ+^È!îÎ;ït-[¶t½zõrÇŽ‹ùšÑë?ú:³fÍB`@àXÏŸ?ß5kÖLoÁé.\\èºwïîÞÿ}·gÏï1Ï?ÿ¼×UõçåË—»U«Vy?wìØÑÛwüøñ˜oÝºÕÝsÏ=nñâÅÕû—-[ó5#gee¹Ûo¿Ýedd¸sq<“\nÁœÀ[¶lñ¤xå•Wª·\r>ÜÛ¦w?,**r7ß|³kÕª•\'LAA÷˜É“\'»&Mšx2©|Í›7÷ºnDà×^{íŠ×‰ÕKJJ¼çèÑ£‡·_;j¬×ŒÜ´iSïµKKKBÃ-ð¾}û<)t8ÙÖ¯_?O Ó§O{¿¯\\¹Ò…B!o¸é’C‡õDRÙGŒáUvvvµÀ5ÿ~×X«Ï‘žžî,XàíŸ={vÌ×ŒÜ¥Kox®Ãl†Z`•T;]Û¶m½a´vâ-Z¸Î;{ûçÍ›ç:uêävïÞí\rco¹å7sæL·zõjO&oóæÍ®k×®.\'\'§ZàÈÜ÷z\Z5ÊÝzë­îÀnÑ¢EÞþiÓ¦Å|ÍˆÀúÿ>uêToû¶mÛn\\#CS]Hº©ê+—nÚ´ÉÛwøða÷ÐCysR&÷ìÙÓ8qÂ9sÆ…Ãa¯ƒÞvÛmîÑGõþ1ˆö^O`]‰ÖE*wëÖÍµiÓÆõïß?ækF/bUTTx‹X:?F`¸¡ŽºK½7ï½Ö¾“\'Oz«Ã5·ë¶ÈBU]K…­Íkr  0…À€À€ÀL!0 0 0 0SŒÀ\0ŒÀ€ÀŒÀ€À#0\0#0 0…ÀìèÕ‘.®U)_ä“	aýúõe±N¾§j_üµ\\Â\'B~~þcï¼óÎ\'‡>‹€õë¼*o^^Þ‡RóÉ‚„!¸G¤kéÐOçoÉXiii.YÿnU¥Ù• /@\r&L˜ÐDþ”$\0’’’ÒTfaÀ\"?üðß‰ÀçHÀ >Ÿïs\"ðY’\00HFFÆí\"ði’\00H(ú¼|’$\0‡[øýþ$`süéÀÇHÀ¦À­Dàr’\00H h#\"	\0ƒ¤§§·?&	\0ƒ„B¡/ŠÀHÀæøK\"ð‡$`‘÷.©ý$`¿ßßAþ€$\0¿\"ï!	\0›sà{Àn’\0°)ð}\"ð.’\0°9þº¡w’€A¤ûv‹IÀ \"og©?’€A‚Áà7Dà­$`süMxI\0Ø¸«ü.I\0Øœ[j#I\0$< o 	\0›wß!	\0ƒ¤¦¦>(ç“€Í9pw©<’\00ˆßïï!ç€Í9ðDàÕ$``0øCéÂ«HÀf~T^N\06çÀÉú-’\00ˆÈÛKêM’\0°)ðãRo€Í9pªü’\0°9N‰_\'	\0›‡Dàl’\0°9ÎúI\0Øœ÷‘€ÍÜW$þ%I\0ØìÀOÊ<øHÀfî\'5$\0l\nÜ_j.I\0Øx€Ô’\0°9$sàY$`‘w°H<ƒ$\0l\n<TžJ\06çÀÃ¤²HÀæx„táÉ$`SàQÒN\06çÀÏ‹ÄÿE\06çÀc¥^ 	\0›O\ZO\06~A»0I\0Dç¿:&	\0›¿$?G\0Ñï€õ»`’\0°9ÎÒ£±HÀ¦ÀÓ¤ž!	\0›sàzFI\0ØœÏÒs‚IÀ¦À¿3IÀæx®^‹$\0l\n<O¯LI\06ž/õI\0DïÊ óàŸ’€Í¼HïD\06^\"§“€MÿW*H\06çÀ¯Ë8$\0l\nü[ØG\0y—ŠÄ?!	\0›sà7¥z‘€M\'Õ“$\0l\n¼B†Ñ€Í9ðª`0øC’\0°)ð\Zøû$`s½6|$\0l\nœ\'Õ$\0l\n\\ •B\0‘áóºÔÔÔï€Í¼A$~€$\0l\n¼Iþw’\0°)p¡Ô·HÀ¦À[ü~ÿ7IÀ¦ÀÛDà%	\0ƒˆ¼\nƒHÀf.IÀ¦Àï‰ÀÿL\06þ³£¿F\0‘î»ÛçóÝK\06;ð^øË$`Sà}Á`ðŸHÀ¦Àû¥î\"	\0›ÿU†Ð_\"	\0›$·\'	\0›œžžÞŽ$\0’½’ëþF•„Ãáf¤|U½x=¹Õ(@r™^Gà½)))MI	À`¦ûØèÂK®5÷¥ûÀï÷½fæ&ß\0¶$þ¿(·Ñ}l	Ü5ªûrwB\0ƒsáR—¥ûò½/@2£Cä@ ðv’Ôj]´’º5Œ> ûs¥^ÒÕhæ\0H|>_[‘s‚HùÁg8\n+ºÊ¤ær¦@#u\\™Û>ÏÔRÜšuQ»2 q]÷Ë\"]qM333Ý¼yó\\aa¡;xð «¬¬tŠþY^^î¶mÛæ/^ì†r•ÈzùYýú‰t\Z]]…BG¢å>|¸\'ç¥K—ÜgeûöínôèÑ5E®`Å\Z å•!óÙˆp\"²[±bE­Ä­Éš5kœŸ¯R#1@›EÞãÑÃå={ö¸xð—¿üÅ\r\Z4¨f\'f8\rª¾\"*Ž–Wç´ñDŸ/Zb³°Ÿ¡ósÑÃæxuÞkuâ\ZÃé,Ò¨ßÐ¹môWE:çmHtN=æšÒ\0õ@Òˆ^m¾pá‚khFŽ-ñ\\Þ€ºÏ}«°Ò¯ŠÁŽ;®8bKºpsÞ\r€ÚÏ}‰^¸ªÏ×Eµ%ú`®äP·áó¤ˆDóçÏw‰$;;;Zà—x7\0j/ðêˆDzxd\"ÑázÔ0º€w öïHTVV–Põ{áèSy7\0j/põu­\"\'&$\n}½èã¤y7\0j/pµ@Ð˜3°\'0«Ð\0†æ{`\0«ˆ8?n¬#±|™#±\0ê­óOŽ…°;ŒÎŠ>)]¸Æµ²8	 ®T]÷¹‚óìváI‰º\"GŸ>}.sE€8¢×¦ÒkT5ô5±ø)×Äh\0ªîù[ÑPW¥Œ–—«R4\0©©©ß–8^×…®1læºÐ\0‰’8²:­wZ¨íWEcÇŽåÎ\01œŽžG«õˆ­¢¢\"ïØéš÷FRÉõ«èƒ4¸7@# LU«Ó•õ½;¡®6³`Ðè÷ÄÒ9§G±U›û¯’\"@#Su	ÚWuåÕÑ§\"F	[ \'&è±Í	\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉÄÿø¼<S‹©\0\0\0\0IEND®B`‚',1);
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_PROPERTY`
--

LOCK TABLES `ACT_GE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` DISABLE KEYS */;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('next.dbid','97501',40),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ACTINST`
--

LOCK TABLES `ACT_HI_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_ACTINST` VALUES ('17504','ac_leavework:2:12504','17501','17501','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2017-04-05 11:39:06.423','2017-04-05 11:39:06.464',41,''),('17505','ac_leavework:2:12504','17501','17501','_3','17506',NULL,'UserTask','userTask',NULL,'2017-04-05 11:39:06.465',NULL,NULL,''),('20004','ac_leavework:2:12504','20001','20001','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2017-04-14 17:03:05.531','2017-04-14 17:03:05.581',50,''),('20006','ac_leavework:2:12504','20001','20001','_3','20007',NULL,'UserTask','userTask',NULL,'2017-04-14 17:03:05.581',NULL,NULL,''),('22508','ac_leavework:3:22504','22505','22505','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2017-04-14 17:15:13.752','2017-04-14 17:15:13.858',106,''),('22509','ac_leavework:3:22504','22505','22505','_3','22510',NULL,'UserTask','userTask',NULL,'2017-04-14 17:15:13.862',NULL,NULL,''),('25004','ac_leavework:3:22504','25001','25001','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2017-04-18 11:58:56.054','2017-04-18 11:58:56.077',23,''),('25005','ac_leavework:3:22504','25001','25001','_3','25006',NULL,'UserTask','userTask',NULL,'2017-04-18 11:58:56.077',NULL,NULL,''),('27504','ac_leavework:3:22504','27501','27501','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2017-04-18 15:37:27.460','2017-04-18 15:37:27.502',42,''),('27505','ac_leavework:3:22504','27501','27501','_3','27506',NULL,'UserTask','userTask',NULL,'2017-04-18 15:37:27.502',NULL,NULL,''),('30008','ac_leavework:4:30004','30005','30005','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2017-04-18 15:44:36.546','2017-04-18 15:44:36.594',48,''),('30010','ac_leavework:4:30004','30005','30005','_3','30011',NULL,'UserTask','userTask',NULL,'2017-04-18 15:44:36.595',NULL,NULL,'');
/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ATTACHMENT`
--

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ATTACHMENT`
--

LOCK TABLES `ACT_HI_ATTACHMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_COMMENT`
--

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_COMMENT`
--

LOCK TABLES `ACT_HI_COMMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DETAIL`
--

LOCK TABLES `ACT_HI_DETAIL` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_IDENTITYLINK`
--

LOCK TABLES `ACT_HI_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` DISABLE KEYS */;
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('17503',NULL,'starter','1',NULL,'17501'),('17507','æ€»ç»ç†','candidate',NULL,'17506',NULL),('20003',NULL,'starter','3',NULL,'20001'),('20008','æ€»ç»ç†','candidate',NULL,'20007',NULL),('22507',NULL,'starter','3',NULL,'22505'),('22511','1','candidate',NULL,'22510',NULL),('25003',NULL,'starter','1',NULL,'25001'),('25007','1','candidate',NULL,'25006',NULL),('27503',NULL,'starter','3',NULL,'27501'),('27507','1','candidate',NULL,'27506',NULL),('30007',NULL,'starter','3',NULL,'30005'),('30012','1','candidate',NULL,'30011',NULL);
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_PROCINST`
--

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_PROCINST`
--

LOCK TABLES `ACT_HI_PROCINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_PROCINST` VALUES ('17501','17501',NULL,'ac_leavework:2:12504','2017-04-05 11:39:06.423',NULL,NULL,'1','_2',NULL,NULL,NULL,'',NULL),('20001','20001',NULL,'ac_leavework:2:12504','2017-04-14 17:03:05.530',NULL,NULL,'3','_2',NULL,NULL,NULL,'',NULL),('22505','22505',NULL,'ac_leavework:3:22504','2017-04-14 17:15:13.752',NULL,NULL,'3','_2',NULL,NULL,NULL,'',NULL),('25001','25001',NULL,'ac_leavework:3:22504','2017-04-18 11:58:56.054',NULL,NULL,'1','_2',NULL,NULL,NULL,'',NULL),('27501','27501',NULL,'ac_leavework:3:22504','2017-04-18 15:37:27.460',NULL,NULL,'3','_2',NULL,NULL,NULL,'',NULL),('30005','30005',NULL,'ac_leavework:4:30004','2017-04-18 15:44:36.546',NULL,NULL,'3','_2',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TASKINST`
--

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TASKINST`
--

LOCK TABLES `ACT_HI_TASKINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_TASKINST` VALUES ('17506','ac_leavework:2:12504','_3','17501','17501','UserTask',NULL,NULL,NULL,NULL,'2017-04-05 11:39:06.474',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('20007','ac_leavework:2:12504','_3','20001','20001','UserTask',NULL,NULL,NULL,NULL,'2017-04-14 17:03:05.596',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('22510','ac_leavework:3:22504','_3','22505','22505','UserTask',NULL,NULL,NULL,NULL,'2017-04-14 17:15:13.873',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('25006','ac_leavework:3:22504','_3','25001','25001','UserTask',NULL,NULL,NULL,NULL,'2017-04-18 11:58:56.080',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('27506','ac_leavework:3:22504','_3','27501','27501','UserTask',NULL,NULL,NULL,NULL,'2017-04-18 15:37:27.510',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('30011','ac_leavework:4:30004','_3','30005','30005','UserTask',NULL,NULL,NULL,NULL,'2017-04-18 15:44:36.604',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `ACT_HI_TASKINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_VARINST`
--

DROP TABLE IF EXISTS `ACT_HI_VARINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_VARINST`
--

LOCK TABLES `ACT_HI_VARINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_VARINST` DISABLE KEYS */;
INSERT INTO `ACT_HI_VARINST` VALUES ('17502','17501','17501',NULL,'applyUserId','string',0,NULL,NULL,NULL,'1',NULL,'2017-04-05 11:39:06.414','2017-04-05 11:39:06.414'),('20002','20001','20001',NULL,'applyUserId','string',0,NULL,NULL,NULL,'3',NULL,'2017-04-14 17:03:05.495','2017-04-14 17:03:05.495'),('20005','20001','20001',NULL,'userid','string',0,NULL,NULL,NULL,'3',NULL,'2017-04-14 17:03:05.531','2017-04-14 17:03:05.531'),('22506','22505','22505',NULL,'userid','string',0,NULL,NULL,NULL,'3',NULL,'2017-04-14 17:15:13.733','2017-04-14 17:15:13.753'),('25002','25001','25001',NULL,'userid','string',0,NULL,NULL,NULL,'1',NULL,'2017-04-18 11:58:56.050','2017-04-18 11:58:56.054'),('27502','27501','27501',NULL,'userid','string',0,NULL,NULL,NULL,'3',NULL,'2017-04-18 15:37:27.451','2017-04-18 15:37:27.460'),('30006','30005','30005',NULL,'${userid}','string',0,NULL,NULL,NULL,'3',NULL,'2017-04-18 15:44:36.535','2017-04-18 15:44:36.535'),('30009','30005','30005',NULL,'userid','string',0,NULL,NULL,NULL,'3',NULL,'2017-04-18 15:44:36.547','2017-04-18 15:44:36.547');
/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_GROUP`
--

DROP TABLE IF EXISTS `ACT_ID_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_GROUP` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_GROUP`
--

LOCK TABLES `ACT_ID_GROUP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_GROUP` DISABLE KEYS */;
INSERT INTO `ACT_ID_GROUP` VALUES ('1',4,'æ€»ç»ç†','assignment'),('2',3,'äººäº‹ç»ç†','assignment'),('3',3,'å‘˜å·¥','assignment');
/*!40000 ALTER TABLE `ACT_ID_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_INFO`
--

DROP TABLE IF EXISTS `ACT_ID_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_INFO`
--

LOCK TABLES `ACT_ID_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_ID_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_MEMBERSHIP`
--

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_MEMBERSHIP` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_MEMBERSHIP`
--

LOCK TABLES `ACT_ID_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `ACT_ID_MEMBERSHIP` VALUES ('3','1'),('4','1'),('3','2'),('5','2'),('3','3');
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_USER`
--

DROP TABLE IF EXISTS `ACT_ID_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_USER` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_USER`
--

LOCK TABLES `ACT_ID_USER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_USER` DISABLE KEYS */;
INSERT INTO `ACT_ID_USER` VALUES ('3',7,'lidongfeng',NULL,NULL,NULL,NULL),('4',4,'zongjingli',NULL,NULL,NULL,NULL),('5',1,'renshi',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_ID_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_PROCDEF_INFO`
--

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_PROCDEF_INFO`
--

LOCK TABLES `ACT_PROCDEF_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DEPLOYMENT`
--

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('1','SpringAutoDeployment',NULL,'','2017-03-26 07:40:38.984'),('10001','SpringAutoDeployment',NULL,'','2017-04-04 16:30:48.002'),('12501','SpringAutoDeployment',NULL,'','2017-04-04 17:09:14.172'),('22501','SpringAutoDeployment',NULL,'','2017-04-14 09:14:12.731'),('2501','SpringAutoDeployment',NULL,'','2017-04-04 04:49:13.212'),('30001','SpringAutoDeployment',NULL,'','2017-04-18 07:43:33.398'),('40001','SpringAutoDeployment',NULL,'','2017-05-30 06:16:57.265'),('42501','SpringAutoDeployment',NULL,'','2017-05-30 06:35:39.652'),('45001','SpringAutoDeployment',NULL,'','2017-05-30 06:36:08.471'),('47501','SpringAutoDeployment',NULL,'','2017-05-30 06:41:29.184'),('50001','SpringAutoDeployment',NULL,'','2017-05-30 06:46:08.571'),('52501','SpringAutoDeployment',NULL,'','2017-05-30 06:51:11.744'),('55001','SpringAutoDeployment',NULL,'','2017-05-30 06:52:31.014'),('57501','SpringAutoDeployment',NULL,'','2017-05-30 06:57:33.618'),('60001','SpringAutoDeployment',NULL,'','2017-05-30 06:58:05.647'),('62501','SpringAutoDeployment',NULL,'','2017-05-30 07:33:40.631'),('65001','SpringAutoDeployment',NULL,'','2017-05-30 07:34:15.762'),('67501','SpringAutoDeployment',NULL,'','2017-05-30 07:37:15.160'),('70001','SpringAutoDeployment',NULL,'','2017-05-30 12:41:33.676'),('72501','SpringAutoDeployment',NULL,'','2017-05-30 12:49:04.831'),('75001','SpringAutoDeployment',NULL,'','2017-05-30 14:24:55.280'),('77501','SpringAutoDeployment',NULL,'','2017-05-30 14:33:04.840'),('80001','SpringAutoDeployment',NULL,'','2017-05-30 15:25:26.545'),('82501','SpringAutoDeployment',NULL,'','2017-05-30 15:27:35.814'),('85001','SpringAutoDeployment',NULL,'','2017-06-05 10:33:38.079'),('87501','SpringAutoDeployment',NULL,'','2017-06-05 10:50:24.414'),('90001','SpringAutoDeployment',NULL,'','2017-06-05 10:51:10.786'),('92501','SpringAutoDeployment',NULL,'','2017-06-05 10:55:41.584'),('95001','SpringAutoDeployment',NULL,'','2017-06-07 09:40:40.206');
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_MODEL`
--

DROP TABLE IF EXISTS `ACT_RE_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_MODEL`
--

LOCK TABLES `ACT_RE_MODEL` WRITE;
/*!40000 ALTER TABLE `ACT_RE_MODEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_PROCDEF`
--

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_PROCDEF`
--

LOCK TABLES `ACT_RE_PROCDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` DISABLE KEYS */;
INSERT INTO `ACT_RE_PROCDEF` VALUES ('ac_leavework:10:52504',1,'http://www.activiti.org/test',NULL,'ac_leavework',10,'52501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:11:55004',1,'http://www.activiti.org/test',NULL,'ac_leavework',11,'55001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:12:57504',1,'http://www.activiti.org/test',NULL,'ac_leavework',12,'57501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:13:60004',1,'http://www.activiti.org/test',NULL,'ac_leavework',13,'60001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:14:62504',1,'http://www.activiti.org/test',NULL,'ac_leavework',14,'62501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:15:65004',1,'http://www.activiti.org/test',NULL,'ac_leavework',15,'65001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:16:67504',1,'http://www.activiti.org/test',NULL,'ac_leavework',16,'67501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:17:70004',1,'http://www.activiti.org/test',NULL,'ac_leavework',17,'70001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:18:72504',1,'http://www.activiti.org/test',NULL,'ac_leavework',18,'72501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:19:75004',1,'http://www.activiti.org/test',NULL,'ac_leavework',19,'75001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:1:10004',1,'http://www.activiti.org/test',NULL,'ac_leavework',1,'10001','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:20:77504',1,'http://www.activiti.org/test',NULL,'ac_leavework',20,'77501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:21:80004',1,'http://www.activiti.org/test',NULL,'ac_leavework',21,'80001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:22:82504',1,'http://www.activiti.org/test',NULL,'ac_leavework',22,'82501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:23:85004',1,'http://www.activiti.org/test',NULL,'ac_leavework',23,'85001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:24:87504',1,'http://www.activiti.org/test',NULL,'ac_leavework',24,'87501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:25:90004',1,'http://www.activiti.org/test',NULL,'ac_leavework',25,'90001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:26:92504',1,'http://www.activiti.org/test',NULL,'ac_leavework',26,'92501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:27:95004',1,'http://www.activiti.org/test',NULL,'ac_leavework',27,'95001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:2:12504',1,'http://www.activiti.org/test',NULL,'ac_leavework',2,'12501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:3:22504',1,'http://www.activiti.org/test',NULL,'ac_leavework',3,'22501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:4:30004',1,'http://www.activiti.org/test',NULL,'ac_leavework',4,'30001','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:5:40004',1,'http://www.activiti.org/test',NULL,'ac_leavework',5,'40001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:6:42504',1,'http://www.activiti.org/test',NULL,'ac_leavework',6,'42501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:7:45004',1,'http://www.activiti.org/test',NULL,'ac_leavework',7,'45001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:8:47504',1,'http://www.activiti.org/test',NULL,'ac_leavework',8,'47501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png',NULL,0,1,1,''),('ac_leavework:9:50004',1,'http://www.activiti.org/test',NULL,'ac_leavework',9,'50001','leavework.bpmn','leavework.ac_leavework.png',NULL,0,1,1,''),('myProcess_1:1:4',1,'http://www.activiti.org/test',NULL,'myProcess_1',1,'1','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.myProcess_1.png',NULL,0,1,1,''),('myProcess_1:2:2504',1,'http://www.activiti.org/test',NULL,'myProcess_1',2,'2501','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.myProcess_1.png',NULL,0,1,1,'');
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EVENT_SUBSCR`
--

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EVENT_SUBSCR`
--

LOCK TABLES `ACT_RU_EVENT_SUBSCR` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXECUTION`
--

LOCK TABLES `ACT_RU_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` DISABLE KEYS */;
INSERT INTO `ACT_RU_EXECUTION` VALUES ('17501',1,'17501',NULL,NULL,'ac_leavework:2:12504',NULL,'_3',1,0,1,0,1,2,'',NULL,NULL),('20001',1,'20001',NULL,NULL,'ac_leavework:2:12504',NULL,'_3',1,0,1,0,1,2,'',NULL,NULL),('22505',1,'22505',NULL,NULL,'ac_leavework:3:22504',NULL,'_3',1,0,1,0,1,2,'',NULL,NULL),('25001',1,'25001',NULL,NULL,'ac_leavework:3:22504',NULL,'_3',1,0,1,0,1,2,'',NULL,NULL),('27501',1,'27501',NULL,NULL,'ac_leavework:3:22504',NULL,'_3',1,0,1,0,1,2,'',NULL,NULL),('30005',1,'30005',NULL,NULL,'ac_leavework:4:30004',NULL,'_3',1,0,1,0,1,2,'',NULL,NULL);
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_IDENTITYLINK`
--

LOCK TABLES `ACT_RU_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` DISABLE KEYS */;
INSERT INTO `ACT_RU_IDENTITYLINK` VALUES ('17503',1,NULL,'starter','1',NULL,'17501',NULL),('17507',1,'æ€»ç»ç†','candidate',NULL,'17506',NULL,NULL),('20003',1,NULL,'starter','3',NULL,'20001',NULL),('20008',1,'æ€»ç»ç†','candidate',NULL,'20007',NULL,NULL),('22507',1,NULL,'starter','3',NULL,'22505',NULL),('22511',1,'1','candidate',NULL,'22510',NULL,NULL),('25003',1,NULL,'starter','1',NULL,'25001',NULL),('25007',1,'1','candidate',NULL,'25006',NULL,NULL),('27503',1,NULL,'starter','3',NULL,'27501',NULL),('27507',1,'1','candidate',NULL,'27506',NULL,NULL),('30007',1,NULL,'starter','3',NULL,'30005',NULL),('30012',1,'1','candidate',NULL,'30011',NULL,NULL);
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOB`
--

LOCK TABLES `ACT_RU_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TASK`
--

LOCK TABLES `ACT_RU_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TASK` DISABLE KEYS */;
INSERT INTO `ACT_RU_TASK` VALUES ('17506',1,'17501','17501','ac_leavework:2:12504','UserTask',NULL,NULL,'_3',NULL,NULL,NULL,50,'2017-04-05 03:39:06.465',NULL,NULL,1,'',NULL),('20007',1,'20001','20001','ac_leavework:2:12504','UserTask',NULL,NULL,'_3',NULL,NULL,NULL,50,'2017-04-14 09:03:05.582',NULL,NULL,1,'',NULL),('22510',1,'22505','22505','ac_leavework:3:22504','UserTask',NULL,NULL,'_3',NULL,NULL,NULL,50,'2017-04-14 09:15:13.863',NULL,NULL,1,'',NULL),('25006',1,'25001','25001','ac_leavework:3:22504','UserTask',NULL,NULL,'_3',NULL,NULL,NULL,50,'2017-04-18 03:58:56.078',NULL,NULL,1,'',NULL),('27506',1,'27501','27501','ac_leavework:3:22504','UserTask',NULL,NULL,'_3',NULL,NULL,NULL,50,'2017-04-18 07:37:27.503',NULL,NULL,1,'',NULL),('30011',1,'30005','30005','ac_leavework:4:30004','UserTask',NULL,NULL,'_3',NULL,NULL,NULL,50,'2017-04-18 07:44:36.595',NULL,NULL,1,'',NULL);
/*!40000 ALTER TABLE `ACT_RU_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_VARIABLE`
--

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_VARIABLE`
--

LOCK TABLES `ACT_RU_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` DISABLE KEYS */;
INSERT INTO `ACT_RU_VARIABLE` VALUES ('17502',1,'string','applyUserId','17501','17501',NULL,NULL,NULL,NULL,'1',NULL),('20002',1,'string','applyUserId','20001','20001',NULL,NULL,NULL,NULL,'3',NULL),('20005',1,'string','userid','20001','20001',NULL,NULL,NULL,NULL,'3',NULL),('22506',1,'string','userid','22505','22505',NULL,NULL,NULL,NULL,'3',NULL),('25002',1,'string','userid','25001','25001',NULL,NULL,NULL,NULL,'1',NULL),('27502',1,'string','userid','27501','27501',NULL,NULL,NULL,NULL,'3',NULL),('30006',1,'string','${userid}','30005','30005',NULL,NULL,NULL,NULL,'3',NULL),('30009',1,'string','userid','30005','30005',NULL,NULL,NULL,NULL,'3',NULL);
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Op_Bank`
--

DROP TABLE IF EXISTS `Base_Op_Bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Op_Bank` (
  `BOB_Tid` int(11) NOT NULL,
  `BOB_JobCode` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `BOB_Name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `BOB_AccountNo` varchar(50) DEFAULT NULL COMMENT 'å¸å·',
  `BOB_BOCTid` int(11) DEFAULT NULL COMMENT 'å¸åˆ«',
  `BOB_Address` varchar(100) DEFAULT NULL COMMENT 'åœ°å€',
  `BOB_Tel` varchar(50) DEFAULT NULL COMMENT 'ç”µè¯',
  `BOB_Fax` varchar(50) DEFAULT NULL COMMENT 'ä¼ çœŸ',
  `BOB_Man` varchar(50) DEFAULT NULL COMMENT 'è”ç³»äºº',
  `BOB_Del` int(11) DEFAULT NULL COMMENT 'å‡åˆ ',
  `BOB_AddPid` int(11) DEFAULT NULL COMMENT 'åˆ›å»ºäººå‘˜',
  `BOB_AddDate` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¥æœŸ',
  `BOB_Note` varchar(200) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`BOB_Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é“¶è¡Œè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Op_Bank`
--

LOCK TABLES `Base_Op_Bank` WRITE;
/*!40000 ALTER TABLE `Base_Op_Bank` DISABLE KEYS */;
INSERT INTO `Base_Op_Bank` VALUES (1,'001','æµ‹è¯•å•ä½','776655555577',0,'ä¸Šæµ·é“¶è¡Œæµ‹è¯•åœ°å€','88777777','88999999','æµ‹è¯•äºº',0,0,'2017-01-01 00:00:00','è¿™æ˜¯å¤‡æ³¨'),(2,'002','æµ‹è¯•å•ä½2','776655555577',0,'ä¸Šæµ·é“¶è¡Œæµ‹è¯•åœ°å€2','88777777','88999999','æµ‹è¯•äºº',0,0,'2017-01-01 00:00:00','è¿™æ˜¯å¤‡æ³¨'),(3,'003','æµ‹è¯•å•ä½3','776655555577',0,'ä¸Šæµ·é“¶è¡Œæµ‹è¯•åœ°å€3','88777777','88999999','æµ‹è¯•äºº',0,0,'2017-01-01 00:00:00','è¿™æ˜¯å¤‡æ³¨'),(4,'001','æµ‹è¯•å•ä½','776655555577',0,'ä¸Šæµ·é“¶è¡Œæµ‹è¯•åœ°å€','88777777','88999999','æµ‹è¯•äºº',0,0,'2017-01-01 00:00:00','è¿™æ˜¯å¤‡æ³¨'),(5,'002','æµ‹è¯•å•ä½2','776655555577',0,'ä¸Šæµ·é“¶è¡Œæµ‹è¯•åœ°å€2','88777777','88999999','æµ‹è¯•äºº',0,0,'2017-01-01 00:00:00','è¿™æ˜¯å¤‡æ³¨'),(6,'003','æµ‹è¯•å•ä½3','776655555577',0,'ä¸Šæµ·é“¶è¡Œæµ‹è¯•åœ°å€3','88777777','88999999','æµ‹è¯•äºº',0,0,'2017-01-01 00:00:00','è¿™æ˜¯å¤‡æ³¨');
/*!40000 ALTER TABLE `Base_Op_Bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('schedulerFactoryBean','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai'),('schedulerFactoryBean','TASK_2','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('schedulerFactoryBean','TASK_1','DEFAULT',NULL,'com.ruanchuangsoft.platform.utils.ScheduleJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\04com.ruanchuangsoft.platform.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0Xºõ“0xt\00 0/30 * * * ?sr\0java.lang.Long;‹äÌ#ß\0J\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0æœ‰å‚æ•°æµ‹è¯•sr\0java.lang.Integerâ ¤÷‡8\0I\0valuexq\0~\0\0\0\0\0x\0'),('schedulerFactoryBean','TASK_2','DEFAULT',NULL,'com.ruanchuangsoft.platform.utils.ScheduleJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\04com.ruanchuangsoft.platform.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0XÃwÄ`xt\00 0/30 * * * ?sr\0java.lang.Long;‹äÌ#ß\0J\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0\0\0\0\0\0t\0test2pt\0æ— å‚æ•°æµ‹è¯•sr\0java.lang.Integerâ ¤÷‡8\0I\0valuexq\0~\0\0\0\0x\0');
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS'),('schedulerFactoryBean','STATE_ACCESS'),('schedulerFactoryBean','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('schedulerFactoryBean','NON_CLUSTERED',1496829840444,7500);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('schedulerFactoryBean','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1496831400000,1496829600000,5,'WAITING','CRON',1490882999000,0,NULL,2,'¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\04com.ruanchuangsoft.platform.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0Xºõ“0xt\00 0/30 * * * ?sr\0java.lang.Long;‹äÌ#ß\0J\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0æœ‰å‚æ•°æµ‹è¯•sr\0java.lang.Integerâ ¤÷‡8\0I\0valuexq\0~\0\0\0\0\0x\0'),('schedulerFactoryBean','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1490884200000,-1,5,'PAUSED','CRON',1490883003000,0,NULL,2,'¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\04com.ruanchuangsoft.platform.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0XÃwÄ`xt\00 0/30 * * * ?sr\0java.lang.Long;‹äÌ#ß\0J\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0\0\0\0\0\0t\0test2pt\0æ— å‚æ•°æµ‹è¯•sr\0java.lang.Integerâ ¤÷‡8\0I\0valuexq\0~\0\0\0\0x\0');
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountcategory`
--

DROP TABLE IF EXISTS `accountcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL COMMENT 'ä¸Šçº§ç§‘ç›®',
  `code` varchar(50) DEFAULT NULL COMMENT 'ç§‘ç›®ç¼–å·',
  `name` varchar(20) DEFAULT NULL COMMENT 'ç§‘ç›®åç§°',
  `remark` varchar(50) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `status` bigint(20) DEFAULT NULL COMMENT 'çŠ¶æ€',
  `order_num` int(11) DEFAULT NULL COMMENT 'æŽ’åº',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='é¢„ç®—ç§‘ç›®';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountcategory`
--

LOCK TABLES `accountcategory` WRITE;
/*!40000 ALTER TABLE `accountcategory` DISABLE KEYS */;
INSERT INTO `accountcategory` VALUES (1,0,'001','é‡‡è´­',NULL,NULL,NULL);
/*!40000 ALTER TABLE `accountcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boxs`
--

DROP TABLE IF EXISTS `boxs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `box_size` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹å°ºå¯¸',
  `weight` varchar(10) DEFAULT NULL COMMENT 'é‡é‡',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ç®±åž‹åŸºç¡€ä¿¡æ¯è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxs`
--

LOCK TABLES `boxs` WRITE;
/*!40000 ALTER TABLE `boxs` DISABLE KEYS */;
INSERT INTO `boxs` VALUES (1,'001','dfd','1');
/*!40000 ALTER TABLE `boxs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgetdetail`
--

DROP TABLE IF EXISTS `budgetdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgetdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` int(11) DEFAULT NULL COMMENT 'åºå·',
  `accountid` bigint(20) DEFAULT NULL COMMENT 'é¢„ç®—ç§‘ç›®',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `usage` varchar(50) DEFAULT NULL COMMENT 'ç”¨é€”',
  `remark` varchar(20) DEFAULT NULL COMMENT 'è¯´æ˜Ž',
  `planmoney` double DEFAULT NULL COMMENT 'é¢„ç®—é‡‘é¢',
  `usagemoney` varchar(20) DEFAULT NULL COMMENT 'å·²ç”¨é¢„ç®—',
  `leftmoney` datetime DEFAULT NULL COMMENT 'å‰©ä½™é¢„ç®—',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='é¢„ç®—æ˜Žç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgetdetail`
--

LOCK TABLES `budgetdetail` WRITE;
/*!40000 ALTER TABLE `budgetdetail` DISABLE KEYS */;
INSERT INTO `budgetdetail` VALUES (1,'*',0,NULL,'sdfgsd',' 0',NULL,0,NULL,NULL,NULL),(2,'*',1,NULL,'dgdf',' 1',NULL,0,NULL,NULL,NULL),(3,'BG20170523000005',0,NULL,'sdfgsd',' 0',NULL,0,NULL,NULL,NULL),(4,'BG20170523000005',1,NULL,'dgdf',' 1',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `budgetdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgetform`
--

DROP TABLE IF EXISTS `budgetform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgetform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `begindate` varchar(20) DEFAULT NULL COMMENT 'è®¡åˆ’å¼€å§‹æ—¥æœŸ',
  `enddate` varchar(50) DEFAULT NULL COMMENT 'è®¡åˆ’ç»“æŸæ—¥æœŸ',
  `dept_id` bigint(20) DEFAULT NULL COMMENT 'éƒ¨é—¨',
  `billtype` varchar(50) DEFAULT NULL COMMENT 'é¢„ç®—ç±»åž‹',
  `billstatus` int(11) DEFAULT NULL COMMENT 'çŠ¶æ€',
  `mkuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `mkdate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `rzuser` varchar(20) DEFAULT NULL COMMENT 'ç­¾æ‰¹äºº',
  `rzdate` datetime DEFAULT NULL COMMENT 'ç­¾æ‰¹æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='é¢„ç®—è®¡åˆ’ä¸»è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgetform`
--

LOCK TABLES `budgetform` WRITE;
/*!40000 ALTER TABLE `budgetform` DISABLE KEYS */;
INSERT INTO `budgetform` VALUES (1,'BG20170523000004',NULL,NULL,NULL,NULL,NULL,'admin','2017-05-23 00:00:00',NULL,NULL,NULL,NULL,NULL),(2,'BG20170523000005',NULL,NULL,NULL,NULL,NULL,'admin','2017-05-23 00:00:00',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `budgetform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `containeryard`
--

DROP TABLE IF EXISTS `containeryard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `containeryard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `linkman` varchar(50) DEFAULT NULL COMMENT 'è”ç³»äºº',
  `phone` varchar(20) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `address` varchar(200) DEFAULT NULL COMMENT 'åœ°å€',
  `longitude` varchar(50) DEFAULT NULL COMMENT 'ç»åº¦',
  `latitude` varchar(50) DEFAULT NULL COMMENT 'çº¬åº¦',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='å †åœºç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containeryard`
--

LOCK TABLES `containeryard` WRITE;
/*!40000 ALTER TABLE `containeryard` DISABLE KEYS */;
INSERT INTO `containeryard` VALUES (1,'sdsdsd','sdfsdf','sdfsdf','sdfasd','sdfsadf','sdfasd',NULL);
/*!40000 ALTER TABLE `containeryard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(20) DEFAULT NULL COMMENT 'å§“å',
  `phone` varchar(20) DEFAULT NULL COMMENT 'ç”µè¯',
  `fleet` varchar(50) DEFAULT NULL COMMENT 'æ‰€å±žè½¦é˜Ÿ',
  `documentno` varchar(50) DEFAULT NULL COMMENT 'è¯ä»¶å·',
  `driveage` int(11) DEFAULT NULL COMMENT 'é©¾é¾„',
  `type` varchar(20) DEFAULT NULL COMMENT 'ç±»åž‹ï¼ˆæœ‰ã€æ— è½¦ï¼‰',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='å¸æœºåŸºç¡€ä¿¡æ¯è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'s','s','s','1','w',1,'1');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emptymain`
--

DROP TABLE IF EXISTS `emptymain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emptymain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `orgid` bigint(20) DEFAULT NULL COMMENT 'å®¢æˆ·id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT 'æå•å·',
  `shipname` varchar(20) DEFAULT NULL COMMENT 'èˆ¹å',
  `flight` varchar(50) DEFAULT NULL COMMENT 'èˆªæ¬¡',
  `portid` bigint(20) DEFAULT NULL COMMENT 'æ¸¯å£',
  `boxqty` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT 'æç®±åœºç«™',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'ç›®çš„åœ°',
  `bgnshipdate` datetime DEFAULT NULL COMMENT 'é›†æ¸¯æ—¶é—´',
  `endshipdate` datetime DEFAULT NULL COMMENT 'æˆªæ¸¯æ—¶é—´',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ—©åˆ°åœºæ—¶é—´',
  `endplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ™šåˆ°åœºæ—¶é—´',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstatus` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šå·²æ”¾ç®± 3ï¼šå·²æç®± 4:å·²åˆ°åœº 5ï¼šå·²å®Œæˆ',
  `makeuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `makedate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ç©ºç®±è®¡åˆ’';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emptymain`
--

LOCK TABLES `emptymain` WRITE;
/*!40000 ALTER TABLE `emptymain` DISABLE KEYS */;
INSERT INTO `emptymain` VALUES (1,'1',1,'1','11','1',1,1,'20GP',1,1,'1970-01-01 08:00:00','1970-01-01 08:00:00',NULL,NULL,'','1','',NULL,'admin','2017-05-30 13:42:43',NULL);
/*!40000 ALTER TABLE `emptymain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `linkman` varchar(50) DEFAULT NULL COMMENT 'è”ç³»äºº',
  `phone` varchar(20) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `address` varchar(200) DEFAULT NULL COMMENT 'åœ°å€',
  `longitude` varchar(50) DEFAULT NULL COMMENT 'ç»åº¦',
  `latitude` varchar(50) DEFAULT NULL COMMENT 'çº¬åº¦',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å·¥åŽ‚ç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factorymain`
--

DROP TABLE IF EXISTS `factorymain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factorymain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `orgid` bigint(20) DEFAULT NULL COMMENT 'å®¢æˆ·id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT 'æå•å·',
  `shipname` varchar(20) DEFAULT NULL COMMENT 'èˆ¹å',
  `flight` varchar(50) DEFAULT NULL COMMENT 'èˆªæ¬¡',
  `portid` bigint(20) DEFAULT NULL COMMENT 'æ¸¯å£',
  `boxqty` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT 'æç®±åœºç«™',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'è£…å¸åœ°',
  `backplaceid` bigint(20) DEFAULT NULL COMMENT 'è¿”å›žåœ°',
  `bgnshipdate` datetime DEFAULT NULL COMMENT 'é›†æ¸¯æ—¶é—´',
  `endshipdate` datetime DEFAULT NULL COMMENT 'æˆªæ¸¯æ—¶é—´',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ—©åˆ°åœºæ—¶é—´',
  `endplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ™šåˆ°åœºæ—¶é—´',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstatus` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šå·²æ”¾ç®± 3ï¼šå·²æç®± 4:å·²åˆ°åœº 5ï¼šå·²å®Œæˆ',
  `makeuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `makedate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é—¨ç‚¹è®¡åˆ’';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factorymain`
--

LOCK TABLES `factorymain` WRITE;
/*!40000 ALTER TABLE `factorymain` DISABLE KEYS */;
/*!40000 ALTER TABLE `factorymain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_id` bigint(20) DEFAULT NULL COMMENT 'çˆ¶èœå•IDï¼Œä¸€çº§èœå•ä¸º0',
  `name` varchar(50) DEFAULT NULL COMMENT 'èœå•åç§°',
  `price` decimal(10,0) DEFAULT NULL COMMENT 'èœå•URL',
  `gcount` int(11) DEFAULT NULL COMMENT 'ç±»åž‹   0ï¼šç›®å½•   1ï¼šèœå•   2ï¼šæŒ‰é’®',
  `icon` varchar(50) DEFAULT NULL COMMENT 'èœå•å›¾æ ‡',
  `order_num` int(11) DEFAULT NULL COMMENT 'æŽ’åº',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å•†å“è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heavymain`
--

DROP TABLE IF EXISTS `heavymain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heavymain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `orgid` bigint(20) DEFAULT NULL COMMENT 'å®¢æˆ·id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT 'æå•å·',
  `shipname` varchar(20) DEFAULT NULL COMMENT 'èˆ¹å',
  `flight` varchar(50) DEFAULT NULL COMMENT 'èˆªæ¬¡',
  `portid` bigint(20) DEFAULT NULL COMMENT 'æ¸¯å£',
  `boxqty` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT 'æç®±åœºç«™',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'ç›®çš„åœ°',
  `bgnshipdate` datetime DEFAULT NULL COMMENT 'é›†æ¸¯æ—¶é—´',
  `endshipdate` datetime DEFAULT NULL COMMENT 'æˆªæ¸¯æ—¶é—´',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ—©åˆ°åœºæ—¶é—´',
  `endplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ™šåˆ°åœºæ—¶é—´',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstatus` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šå·²æ”¾ç®± 3ï¼šå·²æç®± 4:å·²åˆ°åœº 5ï¼šå·²å®Œæˆ',
  `makeuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `makedate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é‡ç®±è®¡åˆ’';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heavymain`
--

LOCK TABLES `heavymain` WRITE;
/*!40000 ALTER TABLE `heavymain` DISABLE KEYS */;
/*!40000 ALTER TABLE `heavymain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveportmain`
--

DROP TABLE IF EXISTS `leaveportmain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaveportmain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `port` varchar(50) DEFAULT NULL COMMENT 'æ¸¯å£',
  `shipcompany` varchar(50) DEFAULT NULL COMMENT 'èˆ¹å…¬å¸',
  `boxqty` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT 'æç®±åœºç«™',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'ç›®çš„åœ°',
  `planarrporttime` datetime DEFAULT NULL COMMENT 'é¢„è®¡åˆ°æ¸¯æ—¶é—´',
  `planarrtime` datetime DEFAULT NULL COMMENT 'é¢„è®¡åˆ°åœºæ—¶é—´',
  `billuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `billdate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç–æ¸¯è®¡åˆ’';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveportmain`
--

LOCK TABLES `leaveportmain` WRITE;
/*!40000 ALTER TABLE `leaveportmain` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaveportmain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavework`
--

DROP TABLE IF EXISTS `leavework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leavework` (
  `leave_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT 'ç”³è¯·äºº',
  `start_time` datetime DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `end_time` datetime DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  `leavetype` int(11) DEFAULT NULL COMMENT 'ç±»åž‹   0ï¼šç”Ÿç—…   1ï¼šç»“å©š   2ï¼šå…¶ä»–',
  `reason` varchar(1000) DEFAULT NULL COMMENT 'è¯·å‡åŽŸå› ',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `realend_time` datetime DEFAULT NULL COMMENT 'å®Œç»“æ—¶é—´',
  `pocess_instanceid` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹ID',
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='è¯·å‡è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavework`
--

LOCK TABLES `leavework` WRITE;
/*!40000 ALTER TABLE `leavework` DISABLE KEYS */;
INSERT INTO `leavework` VALUES (1,1,'admin','2017-04-04 00:00:00','2017-04-25 00:00:00',2,'fffasdfaæµ‹è¯•gggg',NULL,NULL,NULL),(2,3,'lidongfeng','2017-04-10 00:00:00','2017-04-28 00:00:00',1,'dddddddd',NULL,NULL,NULL),(3,1,'admin','2017-04-11 00:00:00','2017-04-19 00:00:00',1,'dfdfdfdfd',NULL,NULL,NULL),(4,1,'admin','2017-04-11 00:00:00','2017-04-19 00:00:00',1,'dfdfdfdfd',NULL,NULL,NULL),(5,1,'admin','2017-04-04 00:00:00','2017-04-13 00:00:00',1,'eeeeeeee',NULL,NULL,NULL),(6,3,'lidongfeng','2017-04-05 00:00:00','2017-04-26 00:00:00',1,'fgfgf',NULL,NULL,'20001'),(7,3,'lidongfeng','2017-04-05 00:00:00','2017-04-20 00:00:00',1,'sfsdf',NULL,NULL,'22505'),(8,1,'admin','2017-04-04 00:00:00','2017-04-12 00:00:00',1,'sdfsd',NULL,NULL,'25001'),(9,3,'lidongfeng','2017-04-11 00:00:00','2017-04-13 00:00:00',0,'jjjj',NULL,NULL,'27501'),(10,3,'lidongfeng','2017-04-11 00:00:00','2017-04-06 00:00:00',1,'kkkk',NULL,NULL,'30005');
/*!40000 ALTER TABLE `leavework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'ä¸Šçº§ç»„ç»‡',
  `phone` varchar(20) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `address` varchar(200) DEFAULT NULL COMMENT 'åœ°å€',
  `longitude` varchar(50) DEFAULT NULL COMMENT 'ç»åº¦',
  `latitude` varchar(50) DEFAULT NULL COMMENT 'çº¬åº¦',
  `type` int(11) DEFAULT NULL COMMENT 'ç±»åž‹ 0ï¼šç›®å½•  1ï¼šæ¸¯å£  2ï¼šä»“åº“   3ï¼šå †åœº  4:èˆ¹å…¬å¸  5ï¼šæ”¾ç®±å…¬å¸',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ç»„ç»‡ç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'1','æµ‹è¯•å®¢æˆ·',0,NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `linkman` varchar(50) DEFAULT NULL COMMENT 'è”ç³»äºº',
  `phone` varchar(20) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `address` varchar(200) DEFAULT NULL COMMENT 'åœ°å€',
  `longitude` varchar(50) DEFAULT NULL COMMENT 'ç»åº¦',
  `latitude` varchar(50) DEFAULT NULL COMMENT 'çº¬åº¦',
  `placetype` int(11) DEFAULT NULL COMMENT 'åœ°ç‚¹ç±»åž‹ 0ï¼šä»“åº“ 1:å·¥åŽ‚ 2:å †åœº',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='åœ°ç‚¹ç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'001','å¸ä¹¡',NULL,NULL,NULL,NULL,NULL,NULL),(2,'002','é£Žå¯’',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_chongxiang_detailed`
--

DROP TABLE IF EXISTS `plan_chongxiang_detailed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_chongxiang_detailed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` bigint(20) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` bigint(20) DEFAULT NULL COMMENT 'åºå·',
  `plateno` varchar(20) DEFAULT NULL COMMENT 'è½¦ç‰Œå·',
  `driver` varchar(20) DEFAULT NULL COMMENT 'å¸æœº',
  `realarrporttime` datetime DEFAULT NULL COMMENT 'å®žé™…åˆ°æ¸¯æ—¶é—´',
  `boxno` bigint(20) DEFAULT NULL COMMENT 'ç®±å·',
  `goods` varchar(50) DEFAULT NULL COMMENT 'è´§å“',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é‡ç®±è®¡åˆ’æ˜Žç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_chongxiang_detailed`
--

LOCK TABLES `plan_chongxiang_detailed` WRITE;
/*!40000 ALTER TABLE `plan_chongxiang_detailed` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_chongxiang_detailed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_kongxiang_detailed`
--

DROP TABLE IF EXISTS `plan_kongxiang_detailed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_kongxiang_detailed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` bigint(20) DEFAULT NULL COMMENT 'åºå·',
  `risiboxplace` varchar(200) DEFAULT NULL COMMENT 'æç®±ç‚¹',
  `returnboxplace` varchar(200) DEFAULT NULL COMMENT 'è¿˜ç®±ç‚¹',
  `boxno` bigint(20) DEFAULT NULL COMMENT 'ç®±å·',
  `realarrtime` datetime DEFAULT NULL COMMENT 'å®žé™…åˆ°åœºæ—¶é—´',
  `trancompanycode` varchar(50) DEFAULT NULL COMMENT 'è¿è¾“å…¬å¸ç¼–ç ',
  `plateno` varchar(20) DEFAULT NULL COMMENT 'è½¦ç‰Œå·',
  `driver` varchar(20) DEFAULT NULL COMMENT 'å¸æœº',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç©ºç®±è®¡åˆ’ç”¨ç®±å•æ˜Žç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_kongxiang_detailed`
--

LOCK TABLES `plan_kongxiang_detailed` WRITE;
/*!40000 ALTER TABLE `plan_kongxiang_detailed` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_kongxiang_detailed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_kongxiang_main`
--

DROP TABLE IF EXISTS `plan_kongxiang_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_kongxiang_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `org_id` int(11) DEFAULT NULL COMMENT 'ç»„ç»‡id',
  `orgcode` varchar(50) DEFAULT NULL COMMENT 'ç»„ç»‡ç¼–ç ',
  `lazingno` varchar(50) DEFAULT NULL COMMENT 'æå•å·',
  `shipname` varchar(20) DEFAULT NULL COMMENT 'èˆ¹å',
  `voyage` varchar(50) DEFAULT NULL COMMENT 'èˆªæ¬¡',
  `portid` bigint(20) DEFAULT NULL COMMENT 'æ¸¯å£',
  `boxqty` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `startplace_id` bigint(20) DEFAULT NULL COMMENT 'æç®±åœºç«™',
  `endplace_id` bigint(20) DEFAULT NULL COMMENT 'æ”¾ç®±åœ°ç‚¹',
  `closedate` datetime DEFAULT NULL COMMENT 'æˆªæ¸¯æ—¶é—´',
  `client` varchar(200) DEFAULT NULL COMMENT 'å®¢æˆ·',
  `clerk` varchar(20) DEFAULT NULL COMMENT 'ä¸šåŠ¡å‘˜',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ—©åˆ°åœºæ—¶é—´',
  `endplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ™šåˆ°åœºæ—¶é—´',
  `trancompanyid` bigint(20) DEFAULT NULL COMMENT 'è¿è¾“å…¬å¸',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstate` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šå·²æ”¾ç®± 3ï¼šå·²æç®± 4:å·²åˆ°åœº 5ï¼šå·²å®Œæˆ',
  `billuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `billdate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ç©ºç®±è®¡åˆ’ç”¨ç®±å•ä¸»è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_kongxiang_main`
--

LOCK TABLES `plan_kongxiang_main` WRITE;
/*!40000 ALTER TABLE `plan_kongxiang_main` DISABLE KEYS */;
INSERT INTO `plan_kongxiang_main` VALUES (1,'q',11,'11','1','1','1',1,11,'11',2,2,'2017-05-24 00:00:00',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `plan_kongxiang_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_shugang_detailed`
--

DROP TABLE IF EXISTS `plan_shugang_detailed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_shugang_detailed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` bigint(20) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` bigint(20) DEFAULT NULL COMMENT 'åºå·',
  `boxno` bigint(20) DEFAULT NULL COMMENT 'ç®±å·',
  `trancompanycode` varchar(50) DEFAULT NULL COMMENT 'è¿è¾“å…¬å¸ç¼–ç ',
  `plateno` varchar(20) DEFAULT NULL COMMENT 'è½¦ç‰Œå·',
  `driver` varchar(20) DEFAULT NULL COMMENT 'å¸æœº',
  `realarrporttime` datetime DEFAULT NULL COMMENT 'å®žé™…åˆ°æ¸¯æ—¶é—´',
  `realarrtime` datetime DEFAULT NULL COMMENT 'å®žé™…åˆ°åœºæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç–æ¸¯è®¡åˆ’æ˜Žç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_shugang_detailed`
--

LOCK TABLES `plan_shugang_detailed` WRITE;
/*!40000 ALTER TABLE `plan_shugang_detailed` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_shugang_detailed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_shugang_main`
--

DROP TABLE IF EXISTS `plan_shugang_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_shugang_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` bigint(20) DEFAULT NULL COMMENT 'å•æ®å·',
  `port` varchar(50) DEFAULT NULL COMMENT 'æ¸¯å£',
  `shipcompany` varchar(50) DEFAULT NULL COMMENT 'èˆ¹å…¬å¸',
  `boxsize` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `placecode` varchar(50) DEFAULT NULL COMMENT 'åœºç«™ç¼–ç ',
  `planarrporttime` datetime DEFAULT NULL COMMENT 'é¢„è®¡åˆ°æ¸¯æ—¶é—´',
  `planarrtime` datetime DEFAULT NULL COMMENT 'é¢„è®¡åˆ°åœºæ—¶é—´',
  `billuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `billdate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `examuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `examdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç–æ¸¯è®¡åˆ’ä¸»è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_shugang_main`
--

LOCK TABLES `plan_shugang_main` WRITE;
/*!40000 ALTER TABLE `plan_shugang_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_shugang_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_yuyue_detailed`
--

DROP TABLE IF EXISTS `plan_yuyue_detailed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_yuyue_detailed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` bigint(20) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` bigint(20) DEFAULT NULL COMMENT 'åºå·',
  `risiboxplace` varchar(200) DEFAULT NULL COMMENT 'æç®±ç‚¹',
  `returnboxplace` varchar(200) DEFAULT NULL COMMENT 'è¿˜ç®±ç‚¹',
  `dockplace` varchar(200) DEFAULT NULL COMMENT 'è£…å¸åœ°',
  `plateno` varchar(20) DEFAULT NULL COMMENT 'è½¦ç‰Œå·',
  `driver` varchar(20) DEFAULT NULL COMMENT 'å¸æœº',
  `realarrtime` datetime DEFAULT NULL COMMENT 'å®žé™…åˆ°åœºæ—¶é—´',
  `shipname` varchar(20) DEFAULT NULL COMMENT 'èˆ¹å',
  `voyage` varchar(50) DEFAULT NULL COMMENT 'èˆªæ¬¡',
  `ladingno` bigint(20) DEFAULT NULL COMMENT 'æå•å·',
  `boxno` bigint(20) DEFAULT NULL COMMENT 'ç®±å·',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é¢„çº¦ç”¨ç®±å•æ˜Žç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_yuyue_detailed`
--

LOCK TABLES `plan_yuyue_detailed` WRITE;
/*!40000 ALTER TABLE `plan_yuyue_detailed` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_yuyue_detailed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_yuyue_main`
--

DROP TABLE IF EXISTS `plan_yuyue_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_yuyue_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` bigint(20) DEFAULT NULL COMMENT 'å•æ®å·',
  `useboxtime` datetime DEFAULT NULL COMMENT 'ç”¨ç®±æ—¶é—´',
  `shipcompany` varchar(50) DEFAULT NULL COMMENT 'èˆ¹å…¬å¸',
  `boxsize` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `risiboxplace` varchar(200) DEFAULT NULL COMMENT 'æç®±ç‚¹',
  `planarrtime` datetime DEFAULT NULL COMMENT 'è®¡åˆ’åˆ°åœºæ—¶é—´',
  `clientinfo` varchar(200) DEFAULT NULL COMMENT 'å®¢æˆ·ä¿¡æ¯',
  `losedate` datetime DEFAULT NULL COMMENT 'å¤±æ•ˆæ—¥æœŸ',
  `billstate` int(11) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€    0ï¼šæ–°å¢ž   1ï¼šå®¡æ ¸   2ï¼šé¢„çº¦ä¸­  3ï¼šå®Œæˆ   4ï¼šå¤±æ•ˆ',
  `billuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `billdate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `examuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `examdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é¢„çº¦ç”¨ç®±å•ä¸»è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_yuyue_main`
--

LOCK TABLES `plan_yuyue_main` WRITE;
/*!40000 ALTER TABLE `plan_yuyue_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_yuyue_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `port` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `linkman` varchar(50) DEFAULT NULL COMMENT 'è”ç³»äºº',
  `phone` varchar(20) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `address` varchar(200) DEFAULT NULL COMMENT 'åœ°å€',
  `longitude` varchar(50) DEFAULT NULL COMMENT 'ç»åº¦',
  `latitude` varchar(50) DEFAULT NULL COMMENT 'çº¬åº¦',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ¸¯å£ç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preemptymain`
--

DROP TABLE IF EXISTS `preemptymain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preemptymain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `orgid` bigint(20) DEFAULT NULL COMMENT 'å®¢æˆ·id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT 'æå•å·',
  `shipname` varchar(20) DEFAULT NULL COMMENT 'èˆ¹å',
  `flight` varchar(50) DEFAULT NULL COMMENT 'èˆªæ¬¡',
  `portid` bigint(20) DEFAULT NULL COMMENT 'æ¸¯å£',
  `boxqty` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT 'æç®±åœºç«™',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'ç›®çš„åœ°',
  `bgntakedate` datetime DEFAULT NULL COMMENT 'è®¡åˆ’å¼€å§‹æ—¥æœŸ',
  `endtakedate` datetime DEFAULT NULL COMMENT 'è®¡åˆ’æˆªæ­¢æ—¥æœŸ',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstatus` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šå·²æ”¾ç®± 3ï¼šå·²æç®± 4:å·²åˆ°åœº 5ï¼šå·²å®Œæˆ',
  `makeuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `makedate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é¢„çº¦ç”¨ç®±';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preemptymain`
--

LOCK TABLES `preemptymain` WRITE;
/*!40000 ALTER TABLE `preemptymain` DISABLE KEYS */;
/*!40000 ALTER TABLE `preemptymain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `regionalcode` varchar(50) DEFAULT NULL COMMENT 'ä¸Šçº§åŒºåŸŸç¼–ç ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŒºåŸŸç®¡ç†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_org_bk2`
--

DROP TABLE IF EXISTS `res_org_bk2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_org_bk2` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) DEFAULT NULL,
  `short_name` varchar(60) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `distict_id` varchar(32) DEFAULT NULL,
  `sup_res_org_id` int(11) DEFAULT NULL,
  `del_flg` varchar(2) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `notes` varchar(128) DEFAULT NULL,
  `create_uid` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_uid` int(11) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `org_code` varchar(32) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `phone3` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `phone_night` varchar(50) DEFAULT NULL,
  `post_code` varchar(6) DEFAULT NULL,
  `adress` varchar(512) DEFAULT NULL,
  `attri1` varchar(64) DEFAULT NULL,
  `attri2` varchar(218) DEFAULT NULL,
  `attri3` varchar(218) DEFAULT NULL,
  `attri4` varchar(64) DEFAULT NULL,
  `attri5` varchar(64) DEFAULT NULL,
  `attri6` varchar(64) DEFAULT NULL,
  `order_no` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_org_bk2`
--

LOCK TABLES `res_org_bk2` WRITE;
/*!40000 ALTER TABLE `res_org_bk2` DISABLE KEYS */;
INSERT INTO `res_org_bk2` VALUES (1,'å¸‚æ”¿åºœéƒ¨é—¨ä¸»è¦é¢†å¯¼',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'å¸‚æ”¿åºœéƒ¨é—¨åˆ†ç®¡é¢†å¯¼',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'å¸‚æ”¿åºœéƒ¨é—¨åŠžå…¬å®¤ä¸»ä»»',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'å¸‚åº”æ€¥åŠž',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'å¸‚ä¸»è¦åº”æ€¥è”åŠ¨å•ä½åº”æ€¥ç§‘å®¤è´Ÿè´£äºº',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'24å°æ—¶å€¼ç­ç”µè¯',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'å„é•‡(è¡—é“ã€å›­åŒº)ä¸»è¦é¢†å¯¼',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'å„é•‡(è¡—é“ã€å›­åŒº)åˆ†ç®¡é¢†å¯¼',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'å„é•‡(è¡—é“ã€å›­åŒº)å…šå§”ç§˜ä¹¦',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'å„é•‡(è¡—é“ã€å›­åŒº)24å°æ—¶å€¼ç­ç”µè¯',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `res_org_bk2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job`
--

DROP TABLE IF EXISTS `schedule_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ä»»åŠ¡id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring beanåç§°',
  `method_name` varchar(100) DEFAULT NULL COMMENT 'æ–¹æ³•å',
  `params` varchar(2000) DEFAULT NULL COMMENT 'å‚æ•°',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cronè¡¨è¾¾å¼',
  `status` tinyint(4) DEFAULT NULL COMMENT 'ä»»åŠ¡çŠ¶æ€',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='å®šæ—¶ä»»åŠ¡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job`
--

LOCK TABLES `schedule_job` WRITE;
/*!40000 ALTER TABLE `schedule_job` DISABLE KEYS */;
INSERT INTO `schedule_job` VALUES (1,'testTask','test','renren','0 0/30 * * * ?',0,'æœ‰å‚æ•°æµ‹è¯•','2016-12-01 23:16:46'),(2,'testTask','test2',NULL,'0 0/30 * * * ?',1,'æ— å‚æ•°æµ‹è¯•','2016-12-03 14:55:56');
/*!40000 ALTER TABLE `schedule_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job_log`
--

DROP TABLE IF EXISTS `schedule_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ä»»åŠ¡æ—¥å¿—id',
  `job_id` bigint(20) NOT NULL COMMENT 'ä»»åŠ¡id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring beanåç§°',
  `method_name` varchar(100) DEFAULT NULL COMMENT 'æ–¹æ³•å',
  `params` varchar(2000) DEFAULT NULL COMMENT 'å‚æ•°',
  `status` tinyint(4) NOT NULL COMMENT 'ä»»åŠ¡çŠ¶æ€    0ï¼šæˆåŠŸ    1ï¼šå¤±è´¥',
  `error` varchar(2000) DEFAULT NULL COMMENT 'å¤±è´¥ä¿¡æ¯',
  `times` int(11) NOT NULL COMMENT 'è€—æ—¶(å•ä½ï¼šæ¯«ç§’)',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='å®šæ—¶ä»»åŠ¡æ—¥å¿—';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job_log`
--

LOCK TABLES `schedule_job_log` WRITE;
/*!40000 ALTER TABLE `schedule_job_log` DISABLE KEYS */;
INSERT INTO `schedule_job_log` VALUES (1,1,'testTask','test','renren',0,NULL,1153,'2017-03-20 17:30:00'),(2,1,'testTask','test','renren',0,NULL,1016,'2017-03-20 18:00:00'),(3,1,'testTask','test','renren',0,NULL,1033,'2017-03-20 18:30:00'),(4,1,'testTask','test','renren',0,NULL,1034,'2017-03-20 19:00:00'),(5,1,'testTask','test','renren',0,NULL,1020,'2017-03-20 19:30:00'),(6,1,'testTask','test','renren',0,NULL,1029,'2017-03-21 17:30:00'),(7,1,'testTask','test','renren',0,NULL,1012,'2017-03-21 18:00:00'),(8,1,'testTask','test','renren',0,NULL,1012,'2017-03-21 18:30:00'),(9,1,'testTask','test','renren',0,NULL,1011,'2017-03-21 19:00:00'),(10,1,'testTask','test','renren',0,NULL,1013,'2017-03-21 19:30:00'),(11,1,'testTask','test','renren',0,NULL,1011,'2017-03-21 20:00:00');
/*!40000 ALTER TABLE `schedule_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship`
--

DROP TABLE IF EXISTS `ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(20) DEFAULT NULL COMMENT 'ä¸­æ–‡åç§°',
  `enname` varchar(20) DEFAULT NULL COMMENT 'è‹±æ–‡åç§°',
  `region` bigint(20) DEFAULT NULL COMMENT 'æ‰€å±žåŒºåŸŸ',
  `uncode` varchar(50) DEFAULT NULL COMMENT 'UNä»£ç ',
  `type` varchar(50) DEFAULT NULL COMMENT 'ç±»åž‹',
  `company` bigint(20) DEFAULT NULL COMMENT 'æ‰€å±žèˆ¹å…¬å¸',
  `coscode` varchar(50) DEFAULT NULL COMMENT 'COSä»£ç ',
  `cosshipenname` varchar(20) DEFAULT NULL COMMENT 'COSèˆ¹è‹±æ–‡å',
  `country` varchar(20) DEFAULT NULL COMMENT 'æ‰€å±žå›½å®¶',
  `contact` varchar(20) DEFAULT NULL COMMENT 'è”ç³»äºº ',
  `address` varchar(200) DEFAULT NULL COMMENT 'åœ°å€',
  `phone` varchar(20) DEFAULT NULL COMMENT 'ç”µè¯',
  `route` varchar(100) DEFAULT NULL COMMENT 'èˆªçº¿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='èˆ¹å…¬å¸';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship`
--

LOCK TABLES `ship` WRITE;
/*!40000 ALTER TABLE `ship` DISABLE KEYS */;
INSERT INTO `ship` VALUES (1,'f','f','g',1,'h','1',1,'h','h','h','h','h','h','h');
/*!40000 ALTER TABLE `ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipplan`
--

DROP TABLE IF EXISTS `shipplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enshipname` varchar(20) DEFAULT NULL COMMENT 'è‹±æ–‡èˆ¹å',
  `chshipname` varchar(20) DEFAULT NULL COMMENT 'ä¸­æ–‡èˆ¹å',
  `expvoyage` varchar(50) DEFAULT NULL COMMENT 'å‡ºå£èˆªæ¬¡',
  `Impvoyage` varchar(50) DEFAULT NULL COMMENT 'è¿›å£èˆªæ¬¡',
  `arrivalstate` varchar(50) DEFAULT NULL COMMENT 'åˆ°æ¸¯çŠ¶æ€',
  `arrivaldate` datetime DEFAULT NULL COMMENT 'é¢„è®¡åˆ°æ¸¯æ—¥æœŸ',
  `shipid` varchar(20) DEFAULT NULL COMMENT 'èˆ¹èˆ¶å‘¼å·',
  `imono` varchar(50) DEFAULT NULL COMMENT 'IMOç¼–å·',
  `dockcode` varchar(50) DEFAULT NULL COMMENT 'ç å¤´ä»£ç ',
  `dockname` varchar(50) DEFAULT NULL COMMENT 'ç å¤´åç§°',
  `dockunit` varchar(50) DEFAULT NULL COMMENT 'é æ³Šå•ä½',
  `route` varchar(50) DEFAULT NULL COMMENT 'èˆªçº¿',
  `arrivaltime` datetime DEFAULT NULL COMMENT 'é¢„è®¡åˆ°æ¸¯æ—¶é—´',
  `leavetime` datetime DEFAULT NULL COMMENT 'é¢„è®¡ç¦»æ¸¯æ—¶é—´',
  `shipment` varchar(20) DEFAULT NULL COMMENT 'èˆ¹æœŸ',
  `remark` varchar(50) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='èˆ¹èˆ¶è®¡åˆ’è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipplan`
--

LOCK TABLES `shipplan` WRITE;
/*!40000 ALTER TABLE `shipplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `linkman` varchar(50) DEFAULT NULL COMMENT 'è”ç³»äºº',
  `phone` varchar(20) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `address` varchar(200) DEFAULT NULL COMMENT 'åœ°å€',
  `longitude` varchar(50) DEFAULT NULL COMMENT 'ç»åº¦',
  `latitude` varchar(50) DEFAULT NULL COMMENT 'çº¬åº¦',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ä»“åº“ç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'001','dddd',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storecontractdetail`
--

DROP TABLE IF EXISTS `storecontractdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storecontractdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` bigint(20) DEFAULT NULL COMMENT 'åºå·',
  `lineid` bigint(20) DEFAULT NULL COMMENT 'çº¿è·¯',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `weighttype` varchar(50) DEFAULT NULL COMMENT 'ç©ºé‡ç±»åž‹ï¼š0-ç©ºç®± 1-é‡ç®±',
  `boxprice` double DEFAULT NULL COMMENT 'åº”æ”¶å•ä»·',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»“å‚¨åˆåŒæ˜Žç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storecontractdetail`
--

LOCK TABLES `storecontractdetail` WRITE;
/*!40000 ALTER TABLE `storecontractdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `storecontractdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storecontractmain`
--

DROP TABLE IF EXISTS `storecontractmain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storecontractmain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `orgid` bigint(20) DEFAULT NULL COMMENT 'å®¢æˆ·',
  `paytype` varchar(10) DEFAULT NULL COMMENT 'ä»˜æ¬¾æ–¹å¼',
  `boctid` bigint(20) DEFAULT NULL COMMENT 'å¸åˆ«',
  `rate` double DEFAULT NULL COMMENT 'æ±‡çŽ‡',
  `taxrate` double DEFAULT NULL COMMENT 'ç¨ŽçŽ‡',
  `takeboxfee` double DEFAULT NULL COMMENT 'æ”¾ç®±è´¹å•ä»·',
  `takeboxfeetax` double DEFAULT NULL COMMENT 'æ”¾ç®±è´¹å«ç¨Žå•ä»·',
  `bgndate` datetime DEFAULT NULL COMMENT 'ç”Ÿæ•ˆæ—¥æœŸ',
  `enddate` datetime DEFAULT NULL COMMENT 'å¤±æ•ˆæ—¥æœŸ',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstatus` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šä½œåºŸ',
  `makeuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `makedate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»“å‚¨åˆåŒ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storecontractmain`
--

LOCK TABLES `storecontractmain` WRITE;
/*!40000 ALTER TABLE `storecontractmain` DISABLE KEYS */;
/*!40000 ALTER TABLE `storecontractmain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT 'çŠ¶æ€   0ï¼šéšè—   1ï¼šæ˜¾ç¤º',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ç³»ç»Ÿé…ç½®ä¿¡æ¯è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'gg','gggeee',1,'gg');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'ä¸Šçº§éƒ¨é—¨IDï¼Œä¸€çº§éƒ¨é—¨ä¸º0',
  `name` varchar(50) DEFAULT NULL COMMENT 'éƒ¨é—¨åç§°',
  `type` int(11) DEFAULT NULL COMMENT 'ç±»åž‹   0ï¼šç›®å½•   1ï¼šèœå•   ',
  `order_num` int(11) DEFAULT NULL COMMENT 'æŽ’åº',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='éƒ¨é—¨ç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'dfd',0,0),(2,1,'sdfasd',0,0),(3,2,'fsdfd',0,0),(4,0,'sdf',1,0),(5,0,'asdfasdf',1,0),(6,0,'dgdf',1,0),(7,0,'fsdfg',1,0),(8,0,'sdfgsd',1,0),(10,0,'æµ‹è¯•',1,0),(11,0,'dfghdgh',1,0),(12,0,'dfghdfg',1,0),(13,0,'fgdghjgh',1,0),(14,0,'eee',1,0),(15,0,'rrr',1,0);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT 'ç”¨æˆ·å',
  `operation` varchar(50) DEFAULT NULL COMMENT 'ç”¨æˆ·æ“ä½œ',
  `method` varchar(200) DEFAULT NULL COMMENT 'è¯·æ±‚æ–¹æ³•',
  `params` varchar(5000) DEFAULT NULL COMMENT 'è¯·æ±‚å‚æ•°',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IPåœ°å€',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='ç³»ç»Ÿæ—¥å¿—';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,'admin','ä¿®æ”¹å¯†ç ','com.ruanchuangsoft.platform.controller.SysUserController.password()','\"admin\"','0:0:0:0:0:0:0:1','2017-04-04 22:24:27'),(2,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:35:14'),(3,'admin','æŸ¥è¯¢è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:35:17'),(4,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:35:27'),(5,'admin','æŸ¥è¯¢è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:36:23'),(6,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:34'),(7,'admin','æŸ¥è¯¢è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:36'),(8,'admin','ä¿®æ”¹è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.update()','{\"endTime\":\"2017-04-13\",\"leaveId\":1,\"leavetype\":2,\"name\":\"admin\",\"reason\":\"fffasdfaæµ‹è¯•gggg\",\"startTime\":\"2017-04-04\",\"userId\":1}','0:0:0:0:0:0:0:1','2017-04-04 22:40:41'),(9,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:42'),(10,'admin','æŸ¥è¯¢è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:47'),(11,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:49'),(12,'admin','æŸ¥è¯¢è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:44:32'),(13,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:47:21'),(14,'admin','æŸ¥è¯¢è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:47:23'),(15,'admin','ä¿®æ”¹è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.update()','{\"endTime\":\"2017-04-25\",\"leaveId\":1,\"leavetype\":2,\"name\":\"admin\",\"reason\":\"fffasdfaæµ‹è¯•gggg\",\"startTime\":\"2017-04-04\",\"userId\":1}','0:0:0:0:0:0:0:1','2017-04-04 22:47:30'),(16,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:47:31'),(17,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:49:14'),(18,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 23:14:20'),(19,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 23:15:26'),(20,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 23:18:02'),(21,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 23:19:06'),(22,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 01:09:56'),(23,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 01:10:07'),(24,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 01:12:41'),(25,'lidongfeng','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-28\",\"leavetype\":1,\"name\":\"lidongfeng\",\"reason\":\"dddddddd\",\"startTime\":\"2017-04-10\"}','0:0:0:0:0:0:0:1','2017-04-05 01:12:58'),(26,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 10:59:30'),(27,'admin','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-19\",\"leavetype\":1,\"name\":\"lidongfeng\",\"reason\":\"dfdfdfdfd\",\"startTime\":\"2017-04-11\"}','0:0:0:0:0:0:0:1','2017-04-05 11:00:08'),(28,'admin','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-19\",\"leavetype\":1,\"name\":\"lidongfeng\",\"reason\":\"dfdfdfdfd\",\"startTime\":\"2017-04-11\"}','0:0:0:0:0:0:0:1','2017-04-05 11:21:28'),(29,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 11:38:37'),(30,'admin','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-13\",\"leavetype\":1,\"reason\":\"eeeeeeee\",\"startTime\":\"2017-04-04\"}','0:0:0:0:0:0:0:1','2017-04-05 11:39:01'),(31,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-11 12:55:55'),(32,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-11 16:53:18'),(33,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-11 16:57:54'),(34,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 15:23:02'),(35,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:02:35'),(36,'lidongfeng','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-26\",\"leavetype\":1,\"reason\":\"fgfgf\",\"startTime\":\"2017-04-05\"}','0:0:0:0:0:0:0:1','2017-04-14 17:03:00'),(37,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:03:17'),(38,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:14:54'),(39,'lidongfeng','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-20\",\"leavetype\":1,\"reason\":\"sfsdf\",\"startTime\":\"2017-04-05\"}','0:0:0:0:0:0:0:1','2017-04-14 17:15:10'),(40,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:15:21'),(41,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:34:48'),(42,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:35:27'),(43,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:40:55'),(44,'zongjingli','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:49:28'),(45,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 20:59:39'),(46,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 21:01:46'),(47,'zongjingli','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 21:02:12'),(48,'zongjingli','æŸ¥è¯¢è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-15 21:02:26'),(49,'zongjingli','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 21:02:31'),(50,'renshi','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 21:09:01'),(51,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:58:40'),(52,'admin','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-12\",\"leavetype\":1,\"reason\":\"sdfsd\",\"startTime\":\"2017-04-04\"}','0:0:0:0:0:0:0:1','2017-04-18 11:58:53'),(53,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:58:58'),(54,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:00'),(55,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:00'),(56,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:01'),(57,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:02'),(58,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:03'),(59,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:03'),(60,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:03'),(61,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:04'),(62,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:04'),(63,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:04'),(64,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:18'),(65,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:25'),(66,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 12:12:29'),(67,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 15:35:35'),(68,'lidongfeng','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-13\",\"leavetype\":0,\"reason\":\"jjjj\",\"startTime\":\"2017-04-11\"}','0:0:0:0:0:0:0:1','2017-04-18 15:37:23'),(69,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 15:38:05'),(70,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 15:44:20'),(71,'lidongfeng','ä¿å­˜è¯·å‡','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-06\",\"leavetype\":1,\"reason\":\"kkkk\",\"startTime\":\"2017-04-11\"}','0:0:0:0:0:0:0:1','2017-04-18 15:44:32'),(72,'lidongfeng','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 15:50:00'),(73,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-20 23:17:52'),(74,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-20 23:29:21'),(75,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 13:07:11'),(76,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 14:41:13'),(77,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 14:43:03'),(78,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 15:14:32'),(79,'admin','æŸ¥è¯¢è¯·å‡åˆ—è¡¨','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 17:31:26');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(50) DEFAULT NULL COMMENT 'çˆ¶èœå•IDï¼Œä¸€çº§èœå•ä¸º0',
  `parent_id` varchar(50) DEFAULT NULL COMMENT 'çˆ¶èœå•IDï¼Œä¸€çº§èœå•ä¸º0',
  `name` varchar(50) DEFAULT NULL COMMENT 'èœå•åç§°',
  `url` varchar(200) DEFAULT NULL COMMENT 'èœå•URL',
  `perms` varchar(500) DEFAULT NULL COMMENT 'æŽˆæƒ(å¤šä¸ªç”¨é€—å·åˆ†éš”ï¼Œå¦‚ï¼šuser:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT 'ç±»åž‹   0ï¼šç›®å½•   1ï¼šèœå•   2ï¼šæŒ‰é’®',
  `icon` varchar(50) DEFAULT NULL COMMENT 'èœå•å›¾æ ‡',
  `order_num` int(11) DEFAULT NULL COMMENT 'æŽ’åº',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1670 DEFAULT CHARSET=utf8 COMMENT='èœå•ç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1466,'system','0','ç³»ç»Ÿç®¡ç†',NULL,NULL,0,'fa fa-cog',0),(1467,'user','system','äººå‘˜ç®¡ç†','sys/user.html',NULL,1,'fa fa-user',1),(1468,'role','system','è§’è‰²ç®¡ç†','sys/role.html',NULL,1,'fa fa-user-secret',2),(1469,'menu','system','èœå•ç®¡ç†','sys/menu.html',NULL,1,'fa fa-th-list',3),(1470,'dept','system','éƒ¨é—¨ç®¡ç†','sys/dept/index',NULL,1,'fa fa-th-list',3),(1471,'druid','system','SQLç›‘æŽ§','druid/sql.html',NULL,1,'fa fa-bug',4),(1472,'config','system','å‚æ•°ç®¡ç†','sys/config.html','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'fa fa-sun-o',6),(1473,'log','system','ç³»ç»Ÿæ—¥å¿—','sys/log.html','sys:log:list',1,'fa fa-file-text-o',7),(1474,'oss','system','æ–‡ä»¶ä¸Šä¼ ','sys/oss.html','sys:oss:all',1,'fa fa-file-image-o',6),(1475,'generator','system','ä»£ç ç”Ÿæˆå™¨','sys/generator.html','sys:generator:list,sys:generator:code',1,'fa fa-rocket',7),(1476,'user_view','user','æŸ¥çœ‹',NULL,'sys:user:list,sys:user:info',2,NULL,0),(1477,'user_add','user','æ–°å¢ž',NULL,'sys:user:save,sys:role:select',2,NULL,0),(1478,'user_edit','user','ä¿®æ”¹',NULL,'sys:user:update,sys:role:select',2,NULL,0),(1479,'user_delete','user','åˆ é™¤',NULL,'sys:user:delete',2,NULL,0),(1480,'role_view','role','æŸ¥çœ‹',NULL,'sys:role:list,sys:role:info',2,NULL,0),(1481,'role_add','role','æ–°å¢ž',NULL,'sys:role:save,sys:menu:perms',2,NULL,0),(1482,'role_edit','role','ä¿®æ”¹',NULL,'sys:role:update,sys:menu:perms',2,NULL,0),(1483,'role_delete','role','åˆ é™¤',NULL,'sys:role:delete',2,NULL,0),(1484,'menu_view','menu','æŸ¥çœ‹',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(1485,'menu_add','menu','æ–°å¢ž',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(1486,'menu_edit','menu','ä¿®æ”¹',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(1487,'menu_delete','menu','åˆ é™¤',NULL,'sys:menu:delete',2,NULL,0),(1488,'dept_view','dept','æŸ¥çœ‹',NULL,'sys:dept:list,sys:dept:info',2,NULL,0),(1489,'dept_add','dept','æ–°å¢ž',NULL,'sys:dept:save,sys:dept:select',2,NULL,0),(1490,'dept_edit','dept','ä¿®æ”¹',NULL,'sys:dept:update,sys:dept:select',2,NULL,0),(1491,'dept_delete','dept','åˆ é™¤',NULL,'sys:dept:delete',2,NULL,0),(1492,'base','0','åŸºç¡€èµ„æ–™',NULL,NULL,0,'fa fa-folder',0),(1493,'region','base','åŒºåŸŸç®¡ç†','region/index',NULL,1,'fa fa-circle-o',1),(1494,'boxs','base','ç®±åž‹ç®¡ç†','boxs/index',NULL,1,'fa fa-circle-o',1),(1495,'transline','base','çº¿è·¯ç®¡ç†','transline/index',NULL,1,'fa fa-circle-o',1),(1496,'transline_view','transline','æŸ¥çœ‹',NULL,'transline:list,transline:info',2,NULL,0),(1497,'transline_add','transline','æ–°å¢ž',NULL,'transline:save,transline:select',2,NULL,0),(1498,'transline_edit','transline','ä¿®æ”¹',NULL,'transline:update,transline:select',2,NULL,0),(1499,'transline_delete','transline','åˆ é™¤',NULL,'transline:delete',2,NULL,0),(1500,'transline_audit','transline','å®¡æ ¸',NULL,'transline:shenhe,transline:select',2,NULL,0),(1501,'transline_detail','transline','æ˜Žç»†',NULL,'transline:list,transline:info',2,NULL,0),(1502,'organization','base','ç»„ç»‡ç®¡ç†','organization/index',NULL,1,'fa fa-circle-o',1),(1503,'organization_view','organization','æŸ¥çœ‹',NULL,'organization:list,organization:info',2,NULL,0),(1504,'organization_add','organization','æ–°å¢ž',NULL,'organization:save,organization:select',2,NULL,0),(1505,'organization_edit','organization','ä¿®æ”¹',NULL,'organization:update,organization:select',2,NULL,0),(1506,'organization_delete','organization','åˆ é™¤',NULL,'organization:delete',2,NULL,0),(1507,'transteam','base','è½¦é˜Ÿç®¡ç†','transteam/index',NULL,1,'fa fa-circle-o',1),(1508,'transteam_view','transteam','æŸ¥çœ‹',NULL,'transteam:list,transteam:info',2,NULL,0),(1509,'transteam_add','transteam','æ–°å¢ž',NULL,'transteam:save,transteam:select',2,NULL,0),(1510,'transteam_edit','transteam','ä¿®æ”¹',NULL,'transteam:update,transteam:select',2,NULL,0),(1511,'transteam_delete','transteam','åˆ é™¤',NULL,'transteam:delete',2,NULL,0),(1512,'place','base','åœ°ç‚¹ç®¡ç†','place/index',NULL,1,'fa fa-circle-o',1),(1513,'place_view','place','æŸ¥çœ‹',NULL,'place:list,place:info',2,NULL,0),(1514,'place_add','place','æ–°å¢ž',NULL,'place:save,place:select',2,NULL,0),(1515,'place_edit','place','ä¿®æ”¹',NULL,'place:update,place:select',2,NULL,0),(1516,'place_delete','place','åˆ é™¤',NULL,'place:delete',2,NULL,0),(1517,'place_audit','place','å®¡æ ¸',NULL,'place:shenhe,place:select',2,NULL,0),(1518,'place_detail','place','æ˜Žç»†',NULL,'place:list,place:info',2,NULL,0),(1519,'ship','base','èˆ¹å…¬å¸','ship/index',NULL,1,'fa fa-circle-o',1),(1520,'ship_view','ship','æŸ¥çœ‹',NULL,'ship:list,ship:info',2,NULL,0),(1521,'ship_add','ship','æ–°å¢ž',NULL,'ship:save,ship:select',2,NULL,0),(1522,'ship_edit','ship','ä¿®æ”¹',NULL,'ship:update,ship:select',2,NULL,0),(1523,'ship_delete','ship','åˆ é™¤',NULL,'ship:delete',2,NULL,0),(1524,'ship_audit','ship','å®¡æ ¸',NULL,'ship:shenhe,ship:select',2,NULL,0),(1525,'ship_detail','ship','æ˜Žç»†',NULL,'ship:list,ship:info',2,NULL,0),(1526,'shipplan','base','èˆ¹èˆ¶è®¡åˆ’è¡¨','shipplan/index',NULL,1,'fa fa-circle-o',1),(1527,'shipplan_view','shipplan','æŸ¥çœ‹',NULL,'shipplan:list,shipplan:info',2,NULL,0),(1528,'shipplan_add','shipplan','æ–°å¢ž',NULL,'shipplan:save,shipplan:select',2,NULL,0),(1529,'shipplan_edit','shipplan','ä¿®æ”¹',NULL,'shipplan:update,shipplan:select',2,NULL,0),(1530,'shipplan_delete','shipplan','åˆ é™¤',NULL,'shipplan:delete',2,NULL,0),(1531,'shipplan_audit','shipplan','å®¡æ ¸',NULL,'shipplan:shenhe,shipplan:select',2,NULL,0),(1532,'shipplan_detail','shipplan','æ˜Žç»†',NULL,'shipplan:list,shipplan:info',2,NULL,0),(1533,'store','base','ä»“åº“ç®¡ç†','store/index',NULL,1,'fa fa-circle-o',1),(1534,'store_view','store','æŸ¥çœ‹',NULL,'store:list,store:info',2,NULL,0),(1535,'store_add','store','æ–°å¢ž',NULL,'store:save,store:select',2,NULL,0),(1536,'store_edit','store','ä¿®æ”¹',NULL,'store:update,store:select',2,NULL,0),(1537,'store_delete','store','åˆ é™¤',NULL,'store:delete',2,NULL,0),(1538,'store_audit','store','å®¡æ ¸',NULL,'store:shenhe,store:select',2,NULL,0),(1539,'store_detail','store','æ˜Žç»†',NULL,'store:list,store:info',2,NULL,0),(1540,'containeryard','base','å †åœºç®¡ç†','containeryard/index',NULL,1,'fa fa-circle-o',1),(1541,'containeryard_view','containeryard','æŸ¥çœ‹',NULL,'containeryard:list,containeryard:info',2,NULL,0),(1542,'containeryard_add','containeryard','æ–°å¢ž',NULL,'containeryard:save,containeryard:select',2,NULL,0),(1543,'containeryard_edit','containeryard','ä¿®æ”¹',NULL,'containeryard:update,containeryard:select',2,NULL,0),(1544,'containeryard_delete','containeryard','åˆ é™¤',NULL,'containeryard:delete',2,NULL,0),(1545,'containeryard_audit','containeryard','å®¡æ ¸',NULL,'containeryard:shenhe,containeryard:select',2,NULL,0),(1546,'containeryard_detail','containeryard','æ˜Žç»†',NULL,'containeryard:list,containeryard:info',2,NULL,0),(1547,'baseopbank','base','é“¶è¡Œè¡¨','baseopbank/index',NULL,1,'fa fa-circle-o',1),(1548,'baseopbank_view','baseopbank','æŸ¥çœ‹',NULL,'baseopbank:list,baseopbank:info',2,NULL,0),(1549,'baseopbank_add','baseopbank','æ–°å¢ž',NULL,'baseopbank:save,baseopbank:select',2,NULL,0),(1550,'baseopbank_edit','baseopbank','ä¿®æ”¹',NULL,'baseopbank:update,baseopbank:select',2,NULL,0),(1551,'baseopbank_delete','baseopbank','åˆ é™¤',NULL,'baseopbank:delete',2,NULL,0),(1552,'baseopbank_audit','baseopbank','å®¡æ ¸',NULL,'baseopbank:shenhe,baseopbank:select',2,NULL,0),(1553,'baseopbank_detail','baseopbank','æ˜Žç»†',NULL,'baseopbank:list,baseopbank:info',2,NULL,0),(1554,'port','base','æ¸¯å£ç®¡ç†','port/index',NULL,1,'fa fa-circle-o',1),(1555,'port_view','port','æŸ¥çœ‹',NULL,'port:list,port:info',2,NULL,0),(1556,'port_add','port','æ–°å¢ž',NULL,'port:save,port:select',2,NULL,0),(1557,'port_edit','port','ä¿®æ”¹',NULL,'port:update,port:select',2,NULL,0),(1558,'port_delete','port','åˆ é™¤',NULL,'port:delete',2,NULL,0),(1559,'port_audit','port','å®¡æ ¸',NULL,'port:shenhe,port:select',2,NULL,0),(1560,'port_detail','port','æ˜Žç»†',NULL,'port:list,port:info',2,NULL,0),(1561,'drivers','base','å¸æœºç®¡ç†','drivers/index',NULL,1,'fa fa-circle-o',1),(1562,'drivers_view','drivers','æŸ¥çœ‹',NULL,'drivers:list,drivers:info',2,NULL,0),(1563,'drivers_add','drivers','æ–°å¢ž',NULL,'drivers:save,drivers:select',2,NULL,0),(1564,'drivers_edit','drivers','ä¿®æ”¹',NULL,'drivers:update,drivers:select',2,NULL,0),(1565,'drivers_delete','drivers','åˆ é™¤',NULL,'drivers:delete',2,NULL,0),(1566,'drivers_audit','drivers','å®¡æ ¸',NULL,'drivers:shenhe,drivers:select',2,NULL,0),(1567,'drivers_detail','drivers','æ˜Žç»†',NULL,'drivers:list,drivers:info',2,NULL,0),(1568,'factory','base','å·¥åŽ‚ç®¡ç†','factory/index',NULL,1,'fa fa-circle-o',1),(1569,'factory_view','factory','æŸ¥çœ‹',NULL,'factory:list,factory:info',2,NULL,0),(1570,'factory_add','factory','æ–°å¢ž',NULL,'factory:save,factory:select',2,NULL,0),(1571,'factory_edit','factory','ä¿®æ”¹',NULL,'factory:update,factory:select',2,NULL,0),(1572,'factory_delete','factory','åˆ é™¤',NULL,'factory:delete',2,NULL,0),(1573,'factory_audit','factory','å®¡æ ¸',NULL,'factory:shenhe,factory:select',2,NULL,0),(1574,'factory_detail','factory','æ˜Žç»†',NULL,'factory:list,factory:info',2,NULL,0),(1575,'buss','0','ä¸šåŠ¡ç®¡ç†',NULL,NULL,0,'fa fa-folder',0),(1576,'emptymain','buss','ç©ºç®±è®¡åˆ’','emptymain/index',NULL,1,'fa fa-circle-o',1),(1577,'emptymain_view','emptymain','æŸ¥çœ‹',NULL,'emptymain:list,emptymain:info',2,NULL,0),(1578,'emptymain_add','emptymain','æ–°å¢ž',NULL,'emptymain:save,emptymain:select',2,NULL,0),(1579,'emptymain_edit','emptymain','ä¿®æ”¹',NULL,'emptymain:update,emptymain:select',2,NULL,0),(1580,'emptymain_delete','emptymain','åˆ é™¤',NULL,'emptymain:delete',2,NULL,0),(1581,'emptymain_takebox','emptymain','æ”¾ç®±',NULL,'emptymain:takebox,emptymain:update,emptymain:select',2,NULL,0),(1582,'emptymain_audit','emptymain','å®¡æ ¸',NULL,'emptymain:shenhe,emptymain:select',2,NULL,0),(1583,'emptymain_detail','emptymain','æ˜Žç»†',NULL,'emptymain:list,emptymain:info',2,NULL,0),(1584,'factorymain','buss','é—¨ç‚¹è®¡åˆ’','factorymain/index',NULL,1,'fa fa-circle-o',1),(1585,'factorymain_view','factorymain','æŸ¥çœ‹',NULL,'factorymain:list,factorymain:info',2,NULL,0),(1586,'factorymain_add','factorymain','æ–°å¢ž',NULL,'factorymain:save,factorymain:select',2,NULL,0),(1587,'factorymain_edit','factorymain','ä¿®æ”¹',NULL,'factorymain:update,factorymain:select',2,NULL,0),(1588,'factorymain_delete','factorymain','åˆ é™¤',NULL,'factorymain:delete',2,NULL,0),(1589,'factorymain_audit','factorymain','å®¡æ ¸',NULL,'factorymain:shenhe,factorymain:select',2,NULL,0),(1590,'factorymain_detail','factorymain','æ˜Žç»†',NULL,'factorymain:list,factorymain:info',2,NULL,0),(1591,'heavymain','buss','é‡ç®±è®¡åˆ’','heavymain/index',NULL,1,'fa fa-circle-o',1),(1592,'heavymain_view','heavymain','æŸ¥çœ‹',NULL,'heavymain:list,heavymain:info',2,NULL,0),(1593,'heavymain_add','heavymain','æ–°å¢ž',NULL,'heavymain:save,heavymain:select',2,NULL,0),(1594,'heavymain_edit','heavymain','ä¿®æ”¹',NULL,'heavymain:update,heavymain:select',2,NULL,0),(1595,'heavymain_delete','heavymain','åˆ é™¤',NULL,'heavymain:delete',2,NULL,0),(1596,'heavymain_audit','heavymain','å®¡æ ¸',NULL,'heavymain:shenhe,heavymain:select',2,NULL,0),(1597,'heavymain_detail','heavymain','æ˜Žç»†',NULL,'heavymain:list,heavymain:info',2,NULL,0),(1598,'preemptymain','preemptymain','é¢„çº¦ç”¨ç®±','preemptymain/index',NULL,1,'fa fa-circle-o',1),(1599,'preemptymain_view','preemptymain','æŸ¥çœ‹',NULL,'preemptymain:list,preemptymain:info',2,NULL,0),(1600,'preemptymain_add','preemptymain','æ–°å¢ž',NULL,'preemptymain:save,preemptymain:select',2,NULL,0),(1601,'preemptymain_edit','preemptymain','ä¿®æ”¹',NULL,'preemptymain:update,preemptymain:select',2,NULL,0),(1602,'preemptymain_delete','preemptymain','åˆ é™¤',NULL,'preemptymain:delete',2,NULL,0),(1603,'preemptymain_audit','preemptymain','å®¡æ ¸',NULL,'preemptymain:shenhe,preemptymain:select',2,NULL,0),(1604,'preemptymain_detail','preemptymain','æ˜Žç»†',NULL,'preemptymain:list,preemptymain:info',2,NULL,0),(1605,'leaveportmain','buss','ç–æ¸¯è®¡åˆ’','leaveportmain/index',NULL,1,'fa fa-circle-o',1),(1606,'leaveportmain_view','leaveportmain','æŸ¥çœ‹',NULL,'leaveportmain:list,leaveportmain:info',2,NULL,0),(1607,'leaveportmain_add','leaveportmain','æ–°å¢ž',NULL,'leaveportmain:save,leaveportmain:select',2,NULL,0),(1608,'leaveportmain_edit','leaveportmain','ä¿®æ”¹',NULL,'leaveportmain:update,leaveportmain:select',2,NULL,0),(1609,'leaveportmain_delete','leaveportmain','åˆ é™¤',NULL,'leaveportmain:delete',2,NULL,0),(1610,'leaveportmain_audit','leaveportmain','å®¡æ ¸',NULL,'leaveportmain:shenhe,leaveportmain:select',2,NULL,0),(1611,'leaveportmain_detail','leaveportmain','æ˜Žç»†',NULL,'leaveportmain:list,leaveportmain:info',2,NULL,0),(1612,'takeboxmain','buss','æ”¾ç®±è®¡åˆ’','takeboxmain/index',NULL,1,'fa fa-circle-o',1),(1613,'takeboxmain_view','takeboxmain','æŸ¥çœ‹',NULL,'takeboxmain:list,takeboxmain:info',2,NULL,0),(1614,'takeboxmain_add','takeboxmain','æ–°å¢ž',NULL,'takeboxmain:save,takeboxmain:select',2,NULL,0),(1615,'takeboxmain_edit','takeboxmain','ä¿®æ”¹',NULL,'takeboxmain:update,takeboxmain:select',2,NULL,0),(1616,'takeboxmain_delete','takeboxmain','åˆ é™¤',NULL,'takeboxmain:delete',2,NULL,0),(1617,'takeboxmain_audit','takeboxmain','å®¡æ ¸',NULL,'takeboxmain:shenhe,takeboxmain:select',2,NULL,0),(1618,'takeboxmain_detail','takeboxmain','æ˜Žç»†',NULL,'takeboxmain:list,takeboxmain:info',2,NULL,0),(1619,'transboxmain','buss','è¿è¾“è®¡åˆ’','transboxmain/index',NULL,1,'fa fa-circle-o',1),(1620,'transboxmain_view','transboxmain','æŸ¥çœ‹',NULL,'transboxmain:list,transboxmain:info',2,NULL,0),(1621,'transboxmain_add','transboxmain','æ–°å¢ž',NULL,'transboxmain:save,transboxmain:select',2,NULL,0),(1622,'transboxmain_edit','transboxmain','ä¿®æ”¹',NULL,'transboxmain:update,transboxmain:select',2,NULL,0),(1623,'transboxmain_delete','transboxmain','åˆ é™¤',NULL,'transboxmain:delete',2,NULL,0),(1624,'transboxmain_audit','transboxmain','å®¡æ ¸',NULL,'transboxmain:shenhe,transboxmain:select',2,NULL,0),(1625,'transboxmain_detail','transboxmain','æ˜Žç»†',NULL,'transboxmain:list,transboxmain:info',2,NULL,0),(1626,'finance','0','è´¢åŠ¡ç®¡ç†',NULL,NULL,0,'fa fa-folder',0),(1627,'accountcategory','finance','é¢„ç®—ç§‘ç›®','accountcategory/index',NULL,1,'fa fa-circle-o',1),(1628,'budgetform','finance','é¢„ç®—è®¡åˆ’','budgetform/index',NULL,1,'fa fa-circle-o',1),(1629,'costrequest','finance','è´¹ç”¨ç”³è¯·','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1630,'expense','finance','æŠ¥é”€ç®¡ç†','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1631,'entertain','finance','æ‹›å¾…è´¹ç”³è¯·','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1632,'accountcategory_view','accountcategory','æŸ¥çœ‹',NULL,'accountcategory:list,accountcategory:info',2,NULL,0),(1633,'accountcategory_add','accountcategory','æ–°å¢ž',NULL,'accountcategory:save,accountcategory:select',2,NULL,0),(1634,'accountcategory_edit','accountcategory','ä¿®æ”¹',NULL,'accountcategory:update,accountcategory:select',2,NULL,0),(1635,'accountcategory_delete','accountcategory','åˆ é™¤',NULL,'accountcategory:delete',2,NULL,0),(1636,'budgetform_view','budgetform','æŸ¥çœ‹',NULL,'budgetform:list,budgetform:info',2,NULL,0),(1637,'budgetform_add','budgetform','æ–°å¢ž',NULL,'budgetform:save,budgetform:select',2,NULL,0),(1638,'budgetform_edit','budgetform','ä¿®æ”¹',NULL,'budgetform:update,budgetform:select',2,NULL,0),(1639,'budgetform_delete','budgetform','åˆ é™¤',NULL,'budgetform:delete',2,NULL,0),(1640,'budgetform_audit','budgetform','å®¡æ ¸',NULL,'budgetform:shenhe,budgetform:select',2,NULL,0),(1641,'budgetform_detail','budgetform','æ˜Žç»†',NULL,'budgetform:list,budgetform:info',2,NULL,0),(1642,'askbill','finance','è¯·è´­å•','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1643,'buybill','finance','è®¢è´­å•','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1644,'paybill','finance','ä»˜æ¬¾å•','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1645,'askbill_view','askbill','æŸ¥çœ‹',NULL,'plankongxiangmain:list,plankongxiangmain:info',2,NULL,0),(1646,'askbill_add','askbill','æ–°å¢ž',NULL,'plankongxiangmain:save,plankongxiangmain:select',2,NULL,0),(1647,'askbill_edit','askbill','ä¿®æ”¹',NULL,'plankongxiangmain:update,plankongxiangmain:select',2,NULL,0),(1648,'askbill_delete','askbill','åˆ é™¤',NULL,'plankongxiangmain:delete',2,NULL,0),(1649,'askbill_audit','askbill','å®¡æ ¸',NULL,'plankongxiangmain:shenhe,plankongxiangmain:select',2,NULL,0),(1650,'buybill_view','buybill','æŸ¥çœ‹',NULL,'plankongxiangmain:list,plankongxiangmain:info',2,NULL,0),(1651,'buybill_add','buybill','æ–°å¢ž',NULL,'plankongxiangmain:save,plankongxiangmain:select',2,NULL,0),(1652,'buybill_edit','buybill','ä¿®æ”¹',NULL,'plankongxiangmain:update,plankongxiangmain:select',2,NULL,0),(1653,'buybill_delete','buybill','åˆ é™¤',NULL,'plankongxiangmain:delete',2,NULL,0),(1654,'buybill_audit','buybill','å®¡æ ¸',NULL,'plankongxiangmain:shenhe,plankongxiangmain:select',2,NULL,0),(1655,'paybill_view','paybill','æŸ¥çœ‹',NULL,'plankongxiangmain:list,plankongxiangmain:info',2,NULL,0),(1656,'paybill_add','paybill','æ–°å¢ž',NULL,'plankongxiangmain:save,plankongxiangmain:select',2,NULL,0),(1657,'paybill_edit','paybill','ä¿®æ”¹',NULL,'plankongxiangmain:update,plankongxiangmain:select',2,NULL,0),(1658,'paybill_delete','paybill','åˆ é™¤',NULL,'plankongxiangmain:delete',2,NULL,0),(1659,'paybill_audit','paybill','å®¡æ ¸',NULL,'plankongxiangmain:shenhe,plankongxiangmain:select',2,NULL,0),(1660,'contract','0','åˆåŒç®¡ç†',NULL,NULL,0,'fa fa-folder',0),(1661,'buycontract','contract','é‡‡è´­åˆåŒ','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1662,'rentcontract','contract','ç§ŸèµåˆåŒ','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1663,'shipcontract','contract','èˆ¹ä¸œåˆåŒ','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1664,'storecontract','contract','ä»“å‚¨å®¢æˆ·åˆåŒ','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1665,'transcontract','contract','è¿è¾“åˆåŒ','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1666,'mataincontract','contract','æœºæ¢°ç»´ä¿®åˆåŒ','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1667,'88','0','æ—¥å¸¸å·¥ä½œ',NULL,NULL,0,'fa fa-folder',0),(1668,'89','88','å¾…åŠžäº‹é¡¹','todulist/index',NULL,1,'fa fa-circle-o',1),(1669,'90','88','è€ƒå‹¤ç®¡ç†','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT 'è§’è‰²åç§°',
  `remark` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='è§’è‰²';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'æ€»ç»ç†','æ€»ç»ç†','2017-03-25 17:06:15'),(2,'äººäº‹ç»ç†','äººäº‹ç»ç†','2017-03-25 17:06:26'),(3,'å‘˜å·¥',NULL,'2017-04-05 01:11:16');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT 'è§’è‰²ID',
  `menu_id` varchar(50) DEFAULT NULL COMMENT 'èœå•ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²ä¸Žèœå•å¯¹åº”å…³ç³»';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT 'ç”¨æˆ·å',
  `password` varchar(100) DEFAULT NULL COMMENT 'å¯†ç ',
  `email` varchar(100) DEFAULT NULL COMMENT 'é‚®ç®±',
  `mobile` varchar(100) DEFAULT NULL COMMENT 'æ‰‹æœºå·',
  `status` tinyint(4) DEFAULT NULL COMMENT 'çŠ¶æ€  0ï¼šç¦ç”¨   1ï¼šæ­£å¸¸',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `dept_id` bigint(20) DEFAULT NULL COMMENT 'æ‰€å±žéƒ¨é—¨',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='ç³»ç»Ÿç”¨æˆ·';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7','root@renren.io','13612345678',1,'2016-11-11 11:11:11',NULL),(2,'test','7b3d979ca8330a94fa7e9e1b466d8b99e0bcdea1ec90596c0dcc8d7ef6b4300c','sdf','sdfsdf',1,'2017-03-25 17:56:40',13),(3,'lidongfeng','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','1111','1111',1,'2017-03-26 23:40:09',6),(4,'zongjingli','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,'2222',1,'2017-04-05 00:19:58',9),(5,'renshi','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,NULL,1,'2017-04-05 00:20:09',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'ç”¨æˆ·ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT 'è§’è‰²ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·ä¸Žè§’è‰²å¯¹åº”å…³ç³»';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (15,5,2),(19,4,1),(20,3,3),(27,2,2),(28,2,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takeboxdetail`
--

DROP TABLE IF EXISTS `takeboxdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takeboxdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` bigint(20) DEFAULT NULL COMMENT 'åºå·',
  `transcompanyid` bigint(20) DEFAULT NULL COMMENT 'è¿è¾“å…¬å¸',
  `startplaceid1` bigint(20) DEFAULT NULL COMMENT 'åŽŸèµ·è¿åœ°ç‚¹',
  `startplaceid2` bigint(20) DEFAULT NULL COMMENT 'çŽ°èµ·è¿ç‚¹',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'ç›®çš„åœ°',
  `boxno` varchar(50) DEFAULT NULL COMMENT 'ç®±å·',
  `fengno` varchar(50) DEFAULT NULL COMMENT 'é“…å°å·',
  `plantaketime` datetime DEFAULT NULL COMMENT 'è®¡åˆ’æç®±æ—¶é—´',
  `realtaketime` datetime DEFAULT NULL COMMENT 'å®žé™…æç®±æ—¶é—´',
  `planarrvetime` datetime DEFAULT NULL COMMENT 'è®¡åˆ’åˆ°åœºæ—¶é—´',
  `realarrvetime` datetime DEFAULT NULL COMMENT 'å®žé™…åˆ°åœºæ—¶é—´',
  `yingshou` double DEFAULT NULL COMMENT 'åº”æ”¶è´¹ç”¨',
  `yingfu` double DEFAULT NULL COMMENT 'åº”ä»˜è´¹ç”¨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ”¾ç®±è®¡åˆ’æ˜Žç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takeboxdetail`
--

LOCK TABLES `takeboxdetail` WRITE;
/*!40000 ALTER TABLE `takeboxdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `takeboxdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takeboxmain`
--

DROP TABLE IF EXISTS `takeboxmain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takeboxmain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `refbillno` varchar(50) DEFAULT NULL COMMENT 'å‚ç…§å•æ®å·',
  `refbilltype` int(11) DEFAULT NULL COMMENT 'å‚ç…§å•æ®ç±»åž‹:0:æ— å‚ç…§  1-ç©ºç®±è®¡åˆ’  2:é‡ç®±è®¡åˆ’  3:é—¨ç‚¹è®¡åˆ’ 4:å¸æœºé¢„çº¦',
  `orgid` bigint(20) DEFAULT NULL COMMENT 'å®¢æˆ·id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT 'æå•å·',
  `shipname` varchar(20) DEFAULT NULL COMMENT 'èˆ¹å',
  `flight` varchar(50) DEFAULT NULL COMMENT 'èˆªæ¬¡',
  `portid` bigint(20) DEFAULT NULL COMMENT 'æ¸¯å£',
  `boxqty` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT 'æç®±åœºç«™',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'ç›®çš„åœ°',
  `bgnshipdate` datetime DEFAULT NULL COMMENT 'é›†æ¸¯æ—¶é—´',
  `endshipdate` datetime DEFAULT NULL COMMENT 'æˆªæ¸¯æ—¶é—´',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ—©åˆ°åœºæ—¶é—´',
  `endplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ™šåˆ°åœºæ—¶é—´',
  `yingshou` double DEFAULT NULL COMMENT 'åº”æ”¶è´¹ç”¨',
  `yingfu` double DEFAULT NULL COMMENT 'åº”ä»˜è´¹ç”¨',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstatus` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šå·²æ”¾ç®± 3ï¼šå·²æç®± 4:å·²åˆ°åœº 5ï¼šå·²å®Œæˆ',
  `makeuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `makedate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ”¾ç®±è®¡åˆ’';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takeboxmain`
--

LOCK TABLES `takeboxmain` WRITE;
/*!40000 ALTER TABLE `takeboxmain` DISABLE KEYS */;
/*!40000 ALTER TABLE `takeboxmain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todolist`
--

DROP TABLE IF EXISTS `todolist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todolist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT 'å¾…åŠžåç§°',
  `todotype` int(11) DEFAULT NULL COMMENT 'å¾…åŠžç±»åž‹',
  `billdate` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¥æœŸ',
  `billdata` text COMMENT 'ä¸šåŠ¡æ•°æ®',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `todourl` varchar(500) DEFAULT NULL COMMENT 'åŠŸèƒ½è·¯å¾„',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å¾…åŠžäº‹é¡¹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todolist`
--

LOCK TABLES `todolist` WRITE;
/*!40000 ALTER TABLE `todolist` DISABLE KEYS */;
/*!40000 ALTER TABLE `todolist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transboxdetail`
--

DROP TABLE IF EXISTS `transboxdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transboxdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` bigint(20) DEFAULT NULL COMMENT 'åºå·',
  `transcompanyid` bigint(20) DEFAULT NULL COMMENT 'è¿è¾“å…¬å¸',
  `refbillno` varchar(50) DEFAULT NULL COMMENT 'æ”¾ç®±è®¡åˆ’å•æ®å·',
  `refserialno` bigint(20) DEFAULT NULL COMMENT 'æ”¾ç®±è®¡åˆ’åºå·',
  `startplaceid1` bigint(20) DEFAULT NULL COMMENT 'åŽŸèµ·è¿åœ°ç‚¹',
  `startplaceid2` bigint(20) DEFAULT NULL COMMENT 'çŽ°èµ·è¿ç‚¹',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'ç›®çš„åœ°',
  `lineid` bigint(20) DEFAULT NULL COMMENT 'çº¿è·¯',
  `boxno` varchar(50) DEFAULT NULL COMMENT 'ç®±å·',
  `fengno` varchar(50) DEFAULT NULL COMMENT 'é“…å°å·',
  `wendu` varchar(50) DEFAULT NULL COMMENT 'æ¸©åº¦',
  `plantaketime` datetime DEFAULT NULL COMMENT 'è®¡åˆ’æç®±æ—¶é—´',
  `realtaketime` datetime DEFAULT NULL COMMENT 'å®žé™…æç®±æ—¶é—´',
  `planarrvetime` datetime DEFAULT NULL COMMENT 'è®¡åˆ’åˆ°åœºæ—¶é—´',
  `realarrvetime` datetime DEFAULT NULL COMMENT 'å®žé™…åˆ°åœºæ—¶é—´',
  `carno` varchar(20) DEFAULT NULL COMMENT 'è½¦ç‰Œå·',
  `cartype` varchar(20) DEFAULT NULL COMMENT 'è½¦åž‹',
  `driversid` bigint(20) DEFAULT NULL COMMENT 'å¸æœºç¼–ç ',
  `driversname` varchar(20) DEFAULT NULL COMMENT 'å¸æœºå§“å',
  `feein` double DEFAULT NULL COMMENT 'åº”æ”¶è´¹ç”¨',
  `feeout` double DEFAULT NULL COMMENT 'åº”ä»˜è´¹ç”¨',
  `profit` double DEFAULT NULL COMMENT 'åˆ©æ¶¦',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¿è¾“è®¡åˆ’æ˜Žç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transboxdetail`
--

LOCK TABLES `transboxdetail` WRITE;
/*!40000 ALTER TABLE `transboxdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `transboxdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transboxmain`
--

DROP TABLE IF EXISTS `transboxmain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transboxmain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `refbillno` varchar(50) DEFAULT NULL COMMENT 'å‚ç…§å•æ®å·',
  `refbilltype` int(11) DEFAULT NULL COMMENT 'å‚ç…§å•æ®ç±»åž‹:0:æ— å‚ç…§  1-æ”¾ç®±è®¡åˆ’  2:é‡ç®±è®¡åˆ’  3:é—¨ç‚¹è®¡åˆ’ 4:å¸æœºé¢„çº¦',
  `orgid` bigint(20) DEFAULT NULL COMMENT 'å®¢æˆ·',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT 'æå•å·',
  `shipname` varchar(20) DEFAULT NULL COMMENT 'èˆ¹å',
  `flight` varchar(50) DEFAULT NULL COMMENT 'èˆªæ¬¡',
  `portid` bigint(20) DEFAULT NULL COMMENT 'æ¸¯å£',
  `boxqty` bigint(20) DEFAULT NULL COMMENT 'ç®±é‡',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT 'æç®±åœºç«™',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT 'ç›®çš„åœ°',
  `bgnshipdate` datetime DEFAULT NULL COMMENT 'é›†æ¸¯æ—¶é—´',
  `endshipdate` datetime DEFAULT NULL COMMENT 'æˆªæ¸¯æ—¶é—´',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ—©åˆ°åœºæ—¶é—´',
  `endplanarrtime` datetime DEFAULT NULL COMMENT 'æœ€æ™šåˆ°åœºæ—¶é—´',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstatus` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šå·²æ”¾ç®± 3ï¼šå·²æç®± 4:å·²åˆ°åœº 5ï¼šå·²å®Œæˆ',
  `makeuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `makedate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¿è¾“è®¡åˆ’';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transboxmain`
--

LOCK TABLES `transboxmain` WRITE;
/*!40000 ALTER TABLE `transboxmain` DISABLE KEYS */;
/*!40000 ALTER TABLE `transboxmain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcontractdetail`
--

DROP TABLE IF EXISTS `transcontractdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcontractdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `serialno` bigint(20) DEFAULT NULL COMMENT 'åºå·',
  `lineid` bigint(20) DEFAULT NULL COMMENT 'çº¿è·¯',
  `boxtype` varchar(50) DEFAULT NULL COMMENT 'ç®±åž‹',
  `weighttype` varchar(50) DEFAULT NULL COMMENT 'ç©ºé‡ç±»åž‹ï¼š0-ç©ºç®± 1-é‡ç®±',
  `boxprice` double DEFAULT NULL COMMENT 'åº”ä»˜å•ä»·',
  `boxpricetax` double DEFAULT NULL COMMENT 'å«ç¨Žåº”ä»˜å•ä»·',
  `cartype` varchar(20) DEFAULT NULL COMMENT 'è½¦åž‹',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¿è¾“åˆåŒæ˜Žç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcontractdetail`
--

LOCK TABLES `transcontractdetail` WRITE;
/*!40000 ALTER TABLE `transcontractdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcontractdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcontractmain`
--

DROP TABLE IF EXISTS `transcontractmain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcontractmain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) DEFAULT NULL COMMENT 'å•æ®å·',
  `orgid` bigint(20) DEFAULT NULL COMMENT 'å®¢æˆ·',
  `paytype` varchar(10) DEFAULT NULL COMMENT 'ä»˜æ¬¾æ–¹å¼',
  `boctid` bigint(20) DEFAULT NULL COMMENT 'å¸åˆ«',
  `rate` double DEFAULT NULL COMMENT 'æ±‡çŽ‡',
  `taxrate` double DEFAULT NULL COMMENT 'ç¨ŽçŽ‡',
  `bgndate` datetime DEFAULT NULL COMMENT 'ç”Ÿæ•ˆæ—¥æœŸ',
  `enddate` datetime DEFAULT NULL COMMENT 'å¤±æ•ˆæ—¥æœŸ',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `billstatus` varchar(50) DEFAULT NULL COMMENT 'å•æ®çŠ¶æ€:0ï¼šæ–°å¢ž 1ï¼šå®¡æ ¸ 2ï¼šä½œåºŸ',
  `makeuser` varchar(20) DEFAULT NULL COMMENT 'åˆ¶å•äºº',
  `makedate` datetime DEFAULT NULL COMMENT 'åˆ¶å•æ—¥æœŸ',
  `accuser` varchar(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `accdate` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `uptdate` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¿è¾“åˆåŒ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcontractmain`
--

LOCK TABLES `transcontractmain` WRITE;
/*!40000 ALTER TABLE `transcontractmain` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcontractmain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transline`
--

DROP TABLE IF EXISTS `transline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `startlocation` bigint(20) DEFAULT NULL COMMENT 'èµ·å§‹åœ°ç‚¹',
  `endlocation` bigint(20) DEFAULT NULL COMMENT 'ç»“æŸåœ°ç‚¹',
  `distance` double DEFAULT NULL COMMENT 'è·ç¦»',
  `helpcode` varchar(200) DEFAULT NULL COMMENT 'åŠ©è®°ç ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='çº¿è·¯ç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transline`
--

LOCK TABLES `transline` WRITE;
/*!40000 ALTER TABLE `transline` DISABLE KEYS */;
/*!40000 ALTER TABLE `transline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transteam`
--

DROP TABLE IF EXISTS `transteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transteam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) DEFAULT NULL COMMENT 'åç§°',
  `address` varchar(200) DEFAULT NULL COMMENT 'åœ°å€',
  `contact` varchar(20) DEFAULT NULL COMMENT 'è”ç³»äºº',
  `contact_number` varchar(20) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `vehicle_type` varchar(20) DEFAULT NULL COMMENT 'è½¦è¾†ç±»åž‹ï¼ˆæŒ‚é ã€è‡ªè¥ã€å¤–åï¼‰',
  `billing_information` varchar(1000) DEFAULT NULL COMMENT 'å¼€ç¥¨ä¿¡æ¯',
  `account_information` varchar(1000) DEFAULT NULL COMMENT 'è´¦æˆ·ä¿¡æ¯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='è½¦é˜Ÿç®¡ç†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transteam`
--

LOCK TABLES `transteam` WRITE;
/*!40000 ALTER TABLE `transteam` DISABLE KEYS */;
INSERT INTO `transteam` VALUES (1,'gh','hhh','hh','hh','hh','0','hh','hh'),(2,'jj','jj','jj','jj','jj','1','jj','jj'),(3,'001','rrrr','rrrr',NULL,NULL,'0',NULL,NULL);
/*!40000 ALTER TABLE `transteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_dist_identitylink`
--

DROP TABLE IF EXISTS `v_dist_identitylink`;
/*!50001 DROP VIEW IF EXISTS `v_dist_identitylink`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_dist_identitylink` AS SELECT 
 1 AS `TASK_ID_`,
 1 AS `USER_ID_`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_identitylink`
--

DROP TABLE IF EXISTS `v_identitylink`;
/*!50001 DROP VIEW IF EXISTS `v_identitylink`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_identitylink` AS SELECT 
 1 AS `TASK_ID_`,
 1 AS `USER_ID_`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_tasklist`
--

DROP TABLE IF EXISTS `v_tasklist`;
/*!50001 DROP VIEW IF EXISTS `v_tasklist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_tasklist` AS SELECT 
 1 AS `TASK_ID`,
 1 AS `PROC_INST_ID`,
 1 AS `ACT_ID`,
 1 AS `ACT_NAME`,
 1 AS `ASSIGNEE`,
 1 AS `DELEGATION_ID`,
 1 AS `DESCRIPTION`,
 1 AS `CREATE_TIME_`,
 1 AS `DUE_DATE_`,
 1 AS `CANDIDATE`,
 1 AS `BUSINESS_KEY_`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'renren-security'
--

--
-- Dumping routines for database 'renren-security'
--

--
-- Final view structure for view `v_dist_identitylink`
--

/*!50001 DROP VIEW IF EXISTS `v_dist_identitylink`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dist_identitylink` AS select distinct `v_identitylink`.`TASK_ID_` AS `TASK_ID_`,`v_identitylink`.`USER_ID_` AS `USER_ID_` from `v_identitylink` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_identitylink`
--

/*!50001 DROP VIEW IF EXISTS `v_identitylink`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_identitylink` AS select `I`.`TASK_ID_` AS `TASK_ID_`,`I`.`USER_ID_` AS `USER_ID_` from (`act_ru_identitylink` `I` join `act_ru_task` `T`) where ((`I`.`TASK_ID_` is not null) and (`I`.`USER_ID_` is not null) and (`I`.`TASK_ID_` = `T`.`ID_`) and isnull(`T`.`ASSIGNEE_`) and (`I`.`TYPE_` = 'candidate')) union select `I`.`TASK_ID_` AS `TASK_ID_`,`R`.`user_id` AS `USER_ID` from ((`act_ru_identitylink` `I` join `sys_user_role` `R`) join `act_ru_task` `T`) where ((`I`.`TASK_ID_` is not null) and (`I`.`GROUP_ID_` is not null) and (`I`.`TASK_ID_` = `T`.`ID_`) and isnull(`T`.`ASSIGNEE_`) and (`I`.`TYPE_` = 'candidate') and (`I`.`GROUP_ID_` = `R`.`role_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tasklist`
--

/*!50001 DROP VIEW IF EXISTS `v_tasklist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tasklist` AS select `A`.`ID_` AS `TASK_ID`,`A`.`PROC_INST_ID_` AS `PROC_INST_ID`,`A`.`TASK_DEF_KEY_` AS `ACT_ID`,`A`.`NAME_` AS `ACT_NAME`,`A`.`ASSIGNEE_` AS `ASSIGNEE`,`A`.`DELEGATION_` AS `DELEGATION_ID`,`A`.`DESCRIPTION_` AS `DESCRIPTION`,`A`.`CREATE_TIME_` AS `CREATE_TIME_`,`A`.`DUE_DATE_` AS `DUE_DATE_`,`i`.`USER_ID_` AS `CANDIDATE`,`P`.`BUSINESS_KEY_` AS `BUSINESS_KEY_` from ((`act_ru_task` `A` left join `act_ru_execution` `P` on((`A`.`PROC_INST_ID_` = `P`.`PROC_INST_ID_`))) left join `v_dist_identitylink` `I` on((`A`.`ID_` = `i`.`TASK_ID_`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-07 18:06:22
