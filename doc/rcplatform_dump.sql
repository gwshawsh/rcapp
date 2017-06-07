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
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('10002',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','10001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"总经理\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"人事经理\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"170.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('10003',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','10001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\Z IDATx��p���Uв�a*n�ŵ��aaK���%J��T�&�sN\")�ʥ\\���A��P@���].BHL�L0X	�\r��Z\n�p�����&\'sj�������3��;�O�9?��}�w��>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�ιz��Ν�mʔ)���������u�撓�o\Z4��رcM�0������ϓ@p�رo-[�,w��_����ŋ���<W\\\\�._��k׮����������]�>}n�����ȑ#�HLLl@�\0��\rrrr6�����ԩS��ݻ=Q�,���sҭݫ��zq����H �]w֬Y��v���������o���kkd�]�tj����v�G��6{�lw��y\rt�-�w�o߾�R�`�Uy�z�-w��\rm�͛wM:qVBBB]���W���ykB�3gμ����.�D]��9o���wN�����֭[�Di謫ͺ�ta+g>�{^��(�L�8�S��CH�zs�zz�F��o���«�@�3�\0�Aff�=ê&�\"���Z�����[\0�\"zn��Y̘1c��\'�[\0�\"za���\\|��GGD��\0��^U�&��N�:-�[\0�\")))�W�\Z�8B��o���������@�޽��Z�����\0՛_��9pII�A��\0�`ܸqjk:##�V���ĉ߭��ǌ����A���������3�.메��PMp2��B˰]�χ9\Z���=z�ԩSo�R��^{m5W#D��\\�^�J�N��`۶m�}� J��ׯ�̇���9.]�t\\��#@��ݻ��f̘q��J���s�e�\retAI:q�ܹs�րĥ#G���~����jPb�0mڴ/^�ڰ�o߾�h��y/@$NIII�!������]�*��.���]hJNN>:v��\"�2�������tN���,X��5}>_?����+��rj�ԩ�6m������KB;ӫ��\r6d��z�U��C2�OGn#5Zd~W��X/��y��Y�s\\�����V\06��!]�I\0��Jǎ�B\06����R�$\0l\n�yjjjC�\0�)�I��߈$\0l\n\\���ؔ$\0l\n|$>J\06�6\'	\0��!��$`S�B���4I\0�x���{�$\0��D�V$`���E$`S���9;�]������H���9�q�(�}3���~@\06;�:��G$`S��>��I\0��}��$`s����$`�/��$`S�w�RH����2��I\0������$\0l\n�k��}H� \"�lF�\'	\0�x�� �\00�t߷�%	\0���\"��\0�)�RcH� 2|+xI\0���#�&��A���.<�$\0l����H�f�\'s����GO�$	\0��zAI\0���?�K\nI�fNы�I� z;��I\0�B\'��H�����Z�$\0l�;K^E\06���@\06;��\"��\00HRR��\"q6I\0D��Hm&	\0�C���[I� >���\"�v�\0�9�n-L\06;�3\"��955����x0|�d\0���H�*�rj1I�!~��ջ��u]�0I�!			u�:p$����.L�0҅� �\n�0����TQ`��ϑ�D�-a�f��-��:p�\0ؓ8W��$`������7H�ι�EEE+������]ff&U����r�7o>%�̧\nb�ʻe�WRR�^�JU�N�<�6m�tNd~�O���U��JG.�1A�͈����ɂ���7�����Oĕ�>/vE��ݾ�7�ҟu�\"0Ĺ��g���c\\�ڡ��n�}H���ٷ�6yC��}���!�.̙Q`݇�q,�����}H����P�s$�u�\"0ı�s�FX�!-C|��n�wøۇϲM�!-C�ux�;�	���!��r��:���l�}H����Vr�D��>��B`�7����v{֏�(o��5�Z�1C���.��!��2]�n��jQ��*F`��Uh\n��\0�\0��B`@`@`�Z�����-X��|���ýmǏ���?���{U��c�V��֯_����<#������n�ʕ�G��{Μ9���={��>���ٳ�k޼�kѢ�2dH��&M��y�׬Y37a�o�>��\'�piii�����3f��޳�����8�=��c�Q�F�k׮�����.��%�Ǚ={6Gx��^�z�N�x�b׾}{��\'��x�5j��U��U�V��k�z?�l���w�̙��ر�=��Sn�ҥ���{ｈ�	<e�W�~}����D�J*so߾ݓ���.�6t�Po�>�0??�����q�ƞ0999�k&O��x�O&��A�^�\r	�|��[��z�ѡCo�v�H�	\\�n]��EEE����СC�:m�ի�\'Ѕ�?�Y���Ao�ꒃ�DRه\r�Uzzz�����$��V�#99�-Z���?gΜ��	ܦMox��l�{Z`�T;]ӦM�a�v�\r�֭[{��ϟ�Z�j�����\rc�ԩ�f͚�֭[�ɤ�m۶͵m��edd����M�#F�|�9r�-Y���?}���	���ӦM��ܹ���844Յ��ʾ��y�֭[�}\'N�p/���7\'�ar�.]�ٳg�ŋ]jj��Az�!׹sg�/����a��֕h]���p�v�\\�&M\\�޽#3|����[���1�=-p�S�y���;w�[��]����Z*le�ɉ��#0\0#0 0��������L!0 0 0#0S��\0����C��wD���e�:�,�	�7o.�t�=U�:z���D�B>Y����q���O�8qɂ Ѽ�k�;�ʛ������|� f���t�|���-^kÆ\r���{����>ͮy�B�n�.v����I���%����I�����\'	\0��y�7I������wH� �}�����\'	\0�x����D\06����$\0l\n�H�I\0D�ϳeܟ$\0\"�)�N\06�У�&��M�IM\'	\0����O\0��oP���$`��%���$`S�e��$\0l΁�\'�K\06���*�\"	\0�$&&>)$	\0�$\'\'7����A���WE�s$`�����\"0O>\0��|�cǎ_!	\0��ILL�\ZI\0����?��A�~�~��I�f��E\06ޜ���}�\0�)�:��ב$\0\"�9�OI� \"�R���\0�9���܇$\0l\n<EjI\0�x��8�\00����<�-�\00�ț&��$\0l\n�]��KH���e�$`s�Q��$\0��A�0zI\0D�D���$\0�����$`���_H� z?,�4I\0D�H)_!	\0���҉��M���S\ZH�����9I$`S����B�\0�)�.}V0I\0�8W�{$`S�\r~��E�\00���(�D\0y�E� I\0�Bϗ�E\06�.5�$\0l��KM\06!��T#�q�F�g�!�`�Q�3SD�#uX�X�U,��׉�\0�sλ�N҆��1)��Yo�s�.�#%����s\"|255�	�1\"iC������E:\06��\n��J4�\0�����V�Cs�ߐ\n�!��\Z6|�_\0�C�<��$`=iC�D\0p��-**Z����Ň~�233�*TVV�ۼy�)�d>U3T�-[����w��U�\Zu��I�iӦs\"��|� &h�EިJ|U:2c�ؠ�fċn����dAL���E]`�\'�J������n_�^�Ϻ\ra�\\�ҳG�ތ1�`��[J��>�E`�c���[u������H����L�(��CZ�8xo����>�E`@`�	�u�9���i�X���s#\n����!�>}t�ۻa���g٦���!��:����m���_��n�w��Y��>�E`�S��L��s\"΁ugc!0ě��Y�f�=�GF�7T�\Z}-��!�[]�n�����{�n���(pU�\r#0��*4��������L!0 0 0W�rss�C�,XP�m���޶�ǏW���}�Y�*�رc+�^�ׯ��]}��@���l�r�JףG�=gΜ��yϞ=\\��?�����5o�ܵh��\r2��u�&Mr�<�k֬��0a��M���O���4���{��3fx�YPPp���{�1רQ#׵kWw����X���̞=��#	�p�BW�^=}�[�x�k߾���O܁�׌\Z5����U��ڵk��[�l��;s�LD�w���z�)�t������^�c��2e��_��KIIqW�x%�9��o��I���o�o:t��M�~������~׸qcO����5�\'Ov<��\'��נA��^�|�-ǉԁ���С��_;j�c��[��w좢\"��po|��!O\n�������ޟ׬Y���7\\u���{\"��Æ\r�*==�\\���}wX_���-Z��3gN�c�nӦ�7<�a6�=-�J���iӦ�0Z;qÆ\r]�֭�����w�Z�r������u��q�f�r�֭�dR�m��ڶm�222��}�&��#܃>�9�,Y��>}z�c����iӦy�w�܉�p�\n\Z��B�}e_��t�֭޾\'N�^x����0�K�.��ٳ��ŋ.55��=���ܹ���AH�а�n�J�.R�p�]�v�I�&�w�����UZZ�-b����8�)�޼�N�Ν;�Wܮ�BUU-�2��D@`\n��\0��B`@`@`@`������)F`\0F`@`\n�!�ѻ?\"]T�|�OĄ͛7G����|=z�w\"p!�,�	���?ٸq��\'N������*oVV�gR/�ɂ�!�N�5�u��x�nݺ�x�o++ͮy*0~��D�/H� 			uE`�\0,ұcǯ��WH� ���\'_\"	\0������/��A���WE�s$`���Ԇ>��,I\0؜M:�i�\0�)pc��$\0�������I� ����D�c$`�`0��|�$\0l΁�.F\0y�:L\0��|-D�OI� �@��D�$`s�\r�߿�$\0l\n�/\"�>�\0�9~F��{H� �}[��$`�������A���D�$`s�mx;I\0����I\0؜O*�$\0��������M�ۉ�I� IIIϋ��$`s�^*�$\0���:��$`s�#xI\0$�X��Z�\0�ف;���H���\'2��I\0D��*�>I\0��e�$`s�$��$\0l΁�����M��\"p:I\0؜�H�C\06���E�%$`���K\06;�2�\rI\0�������M�{K�#	\0����K\06���e<�$\0\"��g��M����H��x���\0�9&]x2I\0�x�t�_���9�(���H��x��$`S��R�H���oh&	\0���W��$`S�7E��I� ��~L\06��S�l,�\0�)�t�A$`s<S�H\"	\0�s��zM0I\0��W\"p\ZI\0؜���b��M���)I����z��A��2�I\0���K��H$`S�e\"p2I\0����$`s��́���M�� \'��ADޕ\"�OI���}��$`S����B\06^-��N$`s�6��$\0l\n�^�!I\0�Bo���/��M���ړ�M�s�H� 2|ޔ���}�\0�ف���ϑ�M�����%	\0��I�;I\0�x����6I\0�x��o$`���@ Њ$\0lv���ߒ$\0l\n�W�&I\0���d��$`���A\06;�A�I�\0�)�@ ��$`S��R���M��\"C诓�M��*7\'	\0�KNNnF\0q�>I�u�\nSSS�@�	��z�n�Q��2/������.L��х��i�K�0���{�b�!�\0�$�c��;�\0�n�}y:!����j���}�� ��!�����;Qj�.ZI�F���Ro�j4\'s\0����ME��\"�_�,��*��ǕJ\0��qen�z �XIq+�u��td��u�\'E���2������综�<w��Qw��e��?KJJ�Ν;�ҥK���oYo?�_?�.@\r����`�d�|C���q����ڵˍ9��ȥ�XԠ�2d�NDv�W����Y�~����-Cj$��a��{&|�|��\r���?����W����A�WD���6����K�sb�\0�3t~=|���{�N\\a8=���7tn\Z�U��yk��χ��4@5Г4�W��]��j��Ç�K<��@���gX�WE�`��ݷ��%]��\r���};�/\\U���~�w�\0���ybH���X���.��6\0*/�Dzzd,��z�0:��@�>����8�����\"��\0������\n]�+�x��I��\0�����@`�����B���\"�T[gb\r0�&gbT=Z矜\r`w=%�j�Xt�\n���j$��Rv��R��ۅ\'��ݻw��9\0��ޛJ�QU����ׯ���({�oiMݕ2\\^�J	P$%%� \\�h��°��B�J���>i��_�3�\'3\0��p:|N>��3����s�+>I%�3��O���H\0��.0��N_���	u��+�Z@�\'��9#����<���?M�\0�L�-h_*����/E6G/L�s�9=\0\0\0\0\0\0\0\0\0\0\0\0\0\0��枮d��`\0\0\0\0IEND�B`�',1),('12502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','12501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"applyUserId\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"总经理\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"人事经理\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"170.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('12503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','12501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\Z IDATx��p���Uв�a*n�ŵ��aaK���%J��T�&�sN\")�ʥ\\���A��P@���].BHL�L0X	�\r��Z\n�p�����&\'sj�������3��;�O�9?��}�w��>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�ιz��Ν�mʔ)���������u�撓�o\Z4��رcM�0������ϓ@p�رo-[�,w��_����ŋ���<W\\\\�._��k׮����������]�>}n�����ȑ#�HLLl@�\0��\rrrr6�����ԩS��ݻ=Q�,���sҭݫ��zq����H �]w֬Y��v���������o���kkd�]�tj����v�G��6{�lw��y\rt�-�w�o߾�R�`�Uy�z�-w��\rm�͛wM:qVBBB]���W���ykB�3gμ����.�D]��9o���wN�����֭[�Di謫ͺ�ta+g>�{^��(�L�8�S��CH�zs�zz�F��o���«�@�3�\0�Aff�=ê&�\"���Z�����[\0�\"zn��Y̘1c��\'�[\0�\"za���\\|��GGD��\0��^U�&��N�:-�[\0�\")))�W�\Z�8B��o���������@�޽��Z�����\0՛_��9pII�A��\0�`ܸqjk:##�V���ĉ߭��ǌ����A���������3�.메��PMp2��B˰]�χ9\Z���=z�ԩSo�R��^{m5W#D��\\�^�J�N��`۶m�}� J��ׯ�̇���9.]�t\\��#@��ݻ��f̘q��J���s�e�\retAI:q�ܹs�րĥ#G���~����jPb�0mڴ/^�ڰ�o߾�h��y/@$NIII�!������]�*��.���]hJNN>:v��\"�2�������tN���,X��5}>_?����+��rj�ԩ�6m������KB;ӫ��\r6d��z�U��C2�OGn#5Zd~W��X/��y��Y�s\\�����V\06��!]�I\0��Jǎ�B\06����R�$\0l\n�yjjjC�\0�)�I��߈$\0l\n\\���ؔ$\0l\n|$>J\06�6\'	\0��!��$`S�B���4I\0�x���{�$\0��D�V$`���E$`S���9;�]������H���9�q�(�}3���~@\06;�:��G$`S��>��I\0��}��$`s����$`�/��$`S�w�RH����2��I\0������$\0l\n�k��}H� \"�lF�\'	\0�x�� �\00�t߷�%	\0���\"��\0�)�RcH� 2|+xI\0���#�&��A���.<�$\0l����H�f�\'s����GO�$	\0��zAI\0���?�K\nI�fNы�I� z;��I\0�B\'��H�����Z�$\0l�;K^E\06���@\06;��\"��\00HRR��\"q6I\0D��Hm&	\0�C���[I� >���\"�v�\0�9�n-L\06;�3\"��955����x0|�d\0���H�*�rj1I�!~��ջ��u]�0I�!			u�:p$����.L�0҅� �\n�0����TQ`��ϑ�D�-a�f��-��:p�\0ؓ8W��$`������7H�ι�EEE+������]ff&U����r�7o>%�̧\nb�ʻe�WRR�^�JU�N�<�6m�tNd~�O���U��JG.�1A�͈����ɂ���7�����Oĕ�>/vE��ݾ�7�ҟu�\"0Ĺ��g���c\\�ڡ��n�}H���ٷ�6yC��}���!�.̙Q`݇�q,�����}H����P�s$�u�\"0ı�s�FX�!-C|��n�wøۇϲM�!-C�ux�;�	���!��r��:���l�}H����Vr�D��>��B`�7����v{֏�(o��5�Z�1C���.��!��2]�n��jQ��*F`��Uh\n��\0�\0��B`@`@`�Z�����-X��|���ýmǏ���?���{U��c�V��֯_����<#������n�ʕ�G��{Μ9���={��>���ٳ�k޼�kѢ�2dH��&M��y�׬Y37a�o�>��\'�piii�����3f��޳�����8�=��c�Q�F�k׮�����.��%�Ǚ={6Gx��^�z�N�x�b׾}{��\'��x�5j��U��U�V��k�z?�l���w�̙��ر�=��Sn�ҥ���{ｈ�	<e�W�~}����D�J*so߾ݓ���.�6t�Po�>�0??�����q�ƞ0999�k&O��x�O&��A�^�\r	�|��[��z�ѡCo�v�H�	\\�n]��EEE����СC�:m�ի�\'Ѕ�?�Y���Ao�ꒃ�DRه\r�Uzzz�����$��V�#99�-Z���?gΜ��	ܦMox��l�{Z`�T;]ӦM�a�v�\r�֭[{��ϟ�Z�j�����\rc�ԩ�f͚�֭[�ɤ�m۶͵m��edd����M�#F�|�9r�-Y���?}���	���ӦM��ܹ���844Յ��ʾ��y�֭[�}\'N�p/���7\'�ar�.]�ٳg�ŋ]jj��Az�!׹sg�/����a��֕h]���p�v�\\�&M\\�޽#3|����[���1�=-p�S�y���;w�[��]����Z*le�ɉ��#0\0#0 0��������L!0 0 0#0S��\0����C��wD���e�:�,�	�7o.�t�=U�:z���D�B>Y����q���O�8qɂ Ѽ�k�;�ʛ������|� f���t�|���-^kÆ\r���{����>ͮy�B�n�.v����I���%����I�����\'	\0��y�7I������wH� �}�����\'	\0�x����D\06����$\0l\n�H�I\0D�ϳeܟ$\0\"�)�N\06�У�&��M�IM\'	\0����O\0��oP���$`��%���$`S�e��$\0l΁�\'�K\06���*�\"	\0�$&&>)$	\0�$\'\'7����A���WE�s$`�����\"0O>\0��|�cǎ_!	\0��ILL�\ZI\0����?��A�~�~��I�f��E\06ޜ���}�\0�)�:��ב$\0\"�9�OI� \"�R���\0�9���܇$\0l\n<EjI\0�x��8�\00����<�-�\00�ț&��$\0l\n�]��KH���e�$`s�Q��$\0��A�0zI\0D�D���$\0�����$`���_H� z?,�4I\0D�H)_!	\0���҉��M���S\ZH�����9I$`S����B�\0�)�.}V0I\0�8W�{$`S�\r~��E�\00���(�D\0y�E� I\0�Bϗ�E\06�.5�$\0l��KM\06!��T#�q�F�g�!�`�Q�3SD�#uX�X�U,��׉�\0�sλ�N҆��1)��Yo�s�.�#%����s\"|255�	�1\"iC������E:\06��\n��J4�\0�����V�Cs�ߐ\n�!��\Z6|�_\0�C�<��$`=iC�D\0p��-**Z����Ň~�233�*TVV�ۼy�)�d>U3T�-[����w��U�\Zu��I�iӦs\"��|� &h�EިJ|U:2c�ؠ�fċn����dAL���E]`�\'�J������n_�^�Ϻ\ra�\\�ҳG�ތ1�`��[J��>�E`�c���[u������H����L�(��CZ�8xo����>�E`@`�	�u�9���i�X���s#\n����!�>}t�ۻa���g٦���!��:����m���_��n�w��Y��>�E`�S��L��s\"΁ugc!0ě��Y�f�=�GF�7T�\Z}-��!�[]�n�����{�n���(pU�\r#0��*4��������L!0 0 0W�rss�C�,XP�m���޶�ǏW���}�Y�*�رc+�^�ׯ��]}��@���l�r�JףG�=gΜ��yϞ=\\��?�����5o�ܵh��\r2��u�&Mr�<�k֬��0a��M���O���4���{��3fx�YPPp���{�1רQ#׵kWw����X���̞=��#	�p�BW�^=}�[�x�k߾���O܁�׌\Z5����U��ڵk��[�l��;s�LD�w���z�)�t������^�c��2e��_��KIIqW�x%�9��o��I���o�o:t��M�~������~׸qcO����5�\'Ov<��\'��נA��^�|�-ǉԁ���С��_;j�c��[��w좢\"��po|��!O\n�������ޟ׬Y���7\\u���{\"��Æ\r�*==�\\���}wX_���-Z��3gN�c�nӦ�7<�a6�=-�J���iӦ�0Z;qÆ\r]�֭�����w�Z�r������u��q�f�r�֭�dR�m��ڶm�222��}�&��#܃>�9�,Y��>}z�c����iӦy�w�܉�p�\n\Z��B�}e_��t�֭޾\'N�^x����0�K�.��ٳ��ŋ.55��=���ܹ���AH�а�n�J�.R�p�]�v�I�&�w�����UZZ�-b����8�)�޼�N�Ν;�Wܮ�BUU-�2��D@`\n��\0��B`@`@`@`������)F`\0F`@`\n�!�ѻ?\"]T�|�OĄ͛7G����|=z�w\"p!�,�	���?ٸq��\'N������*oVV�gR/�ɂ�!�N�5�u��x�nݺ�x�o++ͮy*0~��D�/H� 			uE`�\0,ұcǯ��WH� ���\'_\"	\0������/��A���WE�s$`���Ԇ>��,I\0؜M:�i�\0�)pc��$\0�������I� ����D�c$`�`0��|�$\0l΁�.F\0y�:L\0��|-D�OI� �@��D�$`s�\r�߿�$\0l\n�/\"�>�\0�9~F��{H� �}[��$`�������A���D�$`s�mx;I\0����I\0؜O*�$\0��������M�ۉ�I� IIIϋ��$`s�^*�$\0���:��$`s�#xI\0$�X��Z�\0�ف;���H���\'2��I\0D��*�>I\0��e�$`s�$��$\0l΁�����M��\"p:I\0؜�H�C\06���E�%$`���K\06;�2�\rI\0�������M�{K�#	\0����K\06���e<�$\0\"��g��M����H��x���\0�9&]x2I\0�x�t�_���9�(���H��x��$`S��R�H���oh&	\0���W��$`S�7E��I� ��~L\06��S�l,�\0�)�t�A$`s<S�H\"	\0�s��zM0I\0��W\"p\ZI\0؜���b��M���)I����z��A��2�I\0���K��H$`S�e\"p2I\0����$`s��́���M�� \'��ADޕ\"�OI���}��$`S����B\06^-��N$`s�6��$\0l\n�^�!I\0�Bo���/��M���ړ�M�s�H� 2|ޔ���}�\0�ف���ϑ�M�����%	\0��I�;I\0�x����6I\0�x��o$`���@ Њ$\0lv���ߒ$\0l\n�W�&I\0���d��$`���A\06;�A�I�\0�)�@ ��$`S��R���M��\"C诓�M��*7\'	\0�KNNnF\0q�>I�u�\nSSS�@�	��z�n�Q��2/������.L��х��i�K�0���{�b�!�\0�$�c��;�\0�n�}y:!����j���}�� ��!�����;Qj�.ZI�F���Ro�j4\'s\0����ME��\"�_�,��*��ǕJ\0��qen�z �XIq+�u��td��u�\'E���2������综�<w��Qw��e��?KJJ�Ν;�ҥK���oYo?�_?�.@\r����`�d�|C���q����ڵˍ9��ȥ�XԠ�2d�NDv�W����Y�~����-Cj$��a��{&|�|��\r���?����W����A�WD���6����K�sb�\0�3t~=|���{�N\\a8=���7tn\Z�U��yk��χ��4@5Г4�W��]��j��Ç�K<��@���gX�WE�`��ݷ��%]��\r���};�/\\U���~�w�\0���ybH���X���.��6\0*/�Dzzd,��z�0:��@�>����8�����\"��\0������\n]�+�x��I��\0�����@`�����B���\"�T[gb\r0�&gbT=Z矜\r`w=%�j�Xt�\n���j$��Rv��R��ۅ\'��ݻw��9\0��ޛJ�QU����ׯ���({�oiMݕ2\\^�J	P$%%� \\�h��°��B�J���>i��_�3�\'3\0��p:|N>��3����s�+>I%�3��O���H\0��.0��N_���	u��+�Z@�\'��9#����<���?M�\0�L�-h_*����/E6G/L�s�9=\0\0\0\0\0\0\0\0\0\0\0\0\0\0��枮d��`\0\0\0\0IEND�B`�',1),('2',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_7\" sourceRef=\"_3\" targetRef=\"_5\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"5.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"175.0\" y=\"310.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"210.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"182.5\" y=\"170.0\"/>\n        <omgdi:waypoint x=\"182.5\" y=\"210.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"191.0\" y=\"265.0\"/>\n        <omgdi:waypoint x=\"191.0\" y=\"310.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('22502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','22501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"userid\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('22503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','22501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('2502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <parallelGateway gatewayDirection=\"Unspecified\" id=\"_9\" name=\"ParallelGateway\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"_3\" targetRef=\"_9\"/>\n    <userTask activiti:exclusive=\"true\" id=\"_11\" name=\"UserTask\"/>\n    <parallelGateway gatewayDirection=\"Unspecified\" id=\"_12\" name=\"ParallelGateway\"/>\n    <sequenceFlow id=\"_13\" sourceRef=\"_9\" targetRef=\"_5\"/>\n    <sequenceFlow id=\"_14\" sourceRef=\"_9\" targetRef=\"_11\"/>\n    <sequenceFlow id=\"_15\" sourceRef=\"_5\" targetRef=\"_12\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"_11\" targetRef=\"_12\"/>\n    <sequenceFlow id=\"_17\" sourceRef=\"_12\" targetRef=\"_4\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"30.0\" y=\"260.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_9\" id=\"Shape-_9\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_11\" id=\"Shape-_11\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"260.0\" y=\"260.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_12\" id=\"Shape-_12\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"335.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"_9\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"170.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"115.0\" y=\"287.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"_5\" targetElement=\"_12\">\n        <omgdi:waypoint x=\"115.0\" y=\"287.5\"/>\n        <omgdi:waypoint x=\"170.0\" y=\"351.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"_9\" targetElement=\"_11\">\n        <omgdi:waypoint x=\"202.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"260.0\" y=\"287.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"_12\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"367.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"_11\" targetElement=\"_12\">\n        <omgdi:waypoint x=\"260.0\" y=\"287.5\"/>\n        <omgdi:waypoint x=\"202.0\" y=\"351.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"115.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_3\" targetElement=\"_9\">\n        <omgdi:waypoint x=\"186.0\" y=\"170.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.myProcess_1.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0c\0\0�\0\0\0�>��\0\0\"�IDATx���\rt�՝���*\n��*(,�U��v�X�J�풊Z�B�d2�Gp#D�9�E^���X@��\"�\n1�@X0���A@�H@��������39C�$3��<!����?	3a��˝;�s��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�z��,;;{�ܹs�N�:��g�}����3)))&--�ʰa�Ώ?��ĉ�4x����b\0A_}��}K�.�<dȐ�233͢E�LAA�)..6�Ν3��ŋ�����e˖�\\4hЉ1cƼ�r�ZЊ\0P�p����xeڴif׮]V�jϞ=Ff�橧�:;|���(\0�`6<k֬SC�5;v�0��w�^3x���O?��j��׌�����u;v��ٳg�ӧO�H��y�K�<��F�-\0 ���+��b._�l\"m޼ye�����ؘ��J�\Z�.M�8\ZA�7s��o���ޤ���a��Gji��%����S)))��:\0TX�У&�X��RSS��~\0�8b=|-�&M���̎G��\0��3��X͊����.x��/�0\0DNN�=�.�����J�nwgz@�ӽ&�g\'dee�HII�D/\0�{���5�?���rz@����t�\'?~���q�\0 ���k���9z@�������O/\0�{O<��g�Ǚ@��f|Ω5㒒����x���9u4Evv��M\0bҤIo:u��q�Vq�1\0�A���^�΁3����М�\0�!C���zo���]�8��\0`;v�ӦM��0~��W�k\0��fdd���ca�֭�:+f?c\0�`����\r\Zt1�W����o�z��}\\�\0��߿������G�ü��Z�RZ\0���d��=w��Q�1c��A�+�eZ\0�	䌌���O�~��ٳ[�x�g���@���������v��y����k�K�@\r�liiiGƏPB9���s���kt\rZ����:\0�%�ͺ����>}��6mڎ�7~q���ݏؿ��n���d�)�zf��#X�\0��ϔ;I��`~S�c��R�#��隰�����̙u\0ۀ�,��F�\08��w�~-\0Ά�����\08���|���\08ƥ��-\0Άq���jCK\0��a|855�vZ\0�\rc=��NZ\0�\r��.��nZ\0�\r�\"���Z\0�\r��n��G�\08H���z�h	\0pvf\\��\0�l����\0�lo�x<?�%\0��0��J\0�0��$\'\'?DK\0��3�5��h	\0p6�W����\08���EK\0��<�ef�%\0�ٙ��Z\0�\r�ץ�i	\0p�L��v���%\0�ٙ����%\0��0��̌�\0� 	���g-\0�ΌgH\r�%\0�A2+~Ef�#i	\0pvf�k	�Ѵ\08�/I��%\0�An�{�̌\'�\0���x��dZ\0$���dv<��\0\0I�@�NK\0��3�Az�-\0�Ό�)Ѵ\08H7	�͂h	\0pvf��n�IK\0��3�t�`��\0\0�%���K�\08H/F�%�%\0�A2+�%�\'Z\0$��2;^IK\0��$�����}Z\0��?,a�-\0JNN���zZ\0$��I��\0� ��D�x-\0r��?�0�FK\0��$�;J LK\0��3�I ���}>_3�������i\0��L8O�T��	R�h)\0�\"���T!�uIgǴ\0DQbbbc{f,���J\0���Y1\0�xv\\TI/�u\0 ��nw��a,3��2\0c���8�\0g�81`f�H�\0�s��Yf���\0����_H _�%\0�[Ƙ�\\^PP�ݺu�LNNU����5���ǥ�xU��M�LII��p�U�*--57n<%�ܛW��茘 �h _��r�,\0aѥ	B4�%a|�W���z\'\Z�06��\0D%��|Sl.2{r_�J���_�@�¸���I�8��W�ަ���1����=+�	b}�gL�E�M	\Z�zL�A�3!h�}0a�0&��G����X�#�	c\01����\rc��\0&�� �O�e>���k�(�6��\0&�� ��}��5a����1�X����f��y�.Q�mzL�r�v�6�	�f��qa Za,3������c����g�g�%�\0\"��͆�%�\0bơ̆��%Ƅ1��qM��_�1a aL�\0c�\0aL�\0c�\0aL�\0c�\0aL�\0�Ao޼Y�,X����Q�FY�=z�֏��X�U�Ə�c�]��������1\0�8�Z�~�y��M߾}�ǜ9s���ݻw�\0�P����Ӧ_�~�]�v�}��fĈ�?7y�ds뭷��mۚ�\'Z��[���u�]&33��r�-V��YYY�c�ܹ��:t���;L�V�L�^�̉\'�>g`k���̞=�0P��x��Y�f&??�,Z��t���|��f߾}�ϼ���lW�_�r�y������^뾯��:h��G�{�1K�,)�ŊA���S�N5͛77����|w�#�8�۶m���W_-�m�ȑ�m%%%����4h���n��\n���<�g�L�b\Z6lh�i�-�ٰ?��x㍫�\'�̸���z�Gyĺ_g����ƍ7������,S\0�a|��+�t��[FF��gΜ���z�j���j-I�g�Ç�BQ���瞳jٲe�a\\��WY���c�����^{ͺΜ9A��Ɲ:u��@t)�0P/�XWg�mڴ��*t�ܲeKӱcG�����:��{�ZK�\Z52�f�2k֬��QCt�֭�s��&;;�<��k�U���ѣM�&M��Ç��ŋ��g̘�9�a����ӧ[�o߾�0p�����~��`v��[�l��;v�y���5\\]�HJJ2\'O�4gϞ5>�Ϛ�6m������\nv���\nc=�B?��%�.]���n�����?�s~�WVVf}���Ʉ1�z��*--�։+��ԩS�Qo����մ4|�yNN�\0P�Ø3�c\0�1a�0�c\0�1a�0�c\0�1a�0�c\0�1a�0�c\0�1a�0�c\0�1a�0�c\0�1a�0�c\0�Wa&@#Z�$�/�������`�S�ב#Gޒ0.� ,�ׯtÆ\r�;v�[´v3b\r����/�z��6	�2�+Է׺�Y�+%%���۴�b\0qA�����jJK\0��<�������\0��̸Dfƭi	\0p6����vZ\0�\r���nw{Z\0��x��\\��\0����/Ri	\0p6�?t�ݝi	\0p6�7x<�.�\08��23~��\0\0I��@N�%\0�A���.Z\0$���i�\08����\0� ���?23Τ%\0�ٙ��a�\08Hf�/���yZ\0��O�z��\0\0ggƣ%�MK\0���n�p]7�%\0�ٙq�QAK\0���c=֘�\0\0gg�iz-\0�})t\nZ\0�;�I��߻\\�����\r-\0Q�a+3�%pI�J� 5����΄\'U�Ze>��%-\0Q�K�W�Si%\0���34H���Z�B\0���5k�n�;����Ύ�*�����@�\0@��GV��x9-\0�\0N�DZ\0��-R��[g\0���ݻ{bb�����A�\0�3nڴ��Iq�@��{�B\0w#��� ��v\0@��8��2{�\0p ��X�\0\0��80�K�!�sA��J�!�sA��YC�(�	�`XC�(ψC	���c�\0�p����e̐ �An\'$�d\0⚄��y8�\0\"�5\r��@f\r\0�bS�\n�%\0���s^3�H��z��6���8���΢53֣+�\0 ����B:��+X�\0�rM���\0�&(�9�!�0��Q\0�(��n���H��<�/�qo�\0�����=��Ë�����x㍏G\"�5�}���v���r����\nn��є���R�۵k�\'���$B>�X�\'������&LhH�@\0��~_�x���\'�����j{��5\'v�st�ʗ�!Օ������N��	��:411�q(�\Z�*�ΐ�\\��3��R�\0⒄o�����w����&Xk���M%���/�:�O�>��3\0�_G����&u�K�,YtJ�	\ra\rc;��kH�S\0�%	��%��IK���\Z��a������	5<|�^�^i/_<N��7��	��R�t����j�)O�+v�זk}B�~�h���u�\\ג���\0�X-/55�_#�����F��D�ڇ½.����Q\0ו����`K��*����g����Zzzzs�?�$u\\�r��:/##��̄GJh�JM� ��S��$�`L�s��:�������애Z%��>�OӍ�9i@�$o��P���>	�����7\'�\0�+!|���Z*��|<��I#\0��x~%��|}S�]��\'�\0��L��8�R;�������}8i@����~Of�=�(�ӈV��\'�\0��&��WR$dZ�$��\0a�U ���뽏�N\ZP#��n�ou6,3�\'j��*�\0��p#	�A�F��u��V��;N\Zp-	�.2�%_s��?�\"��I#\0�z��\n�������N\Z�Y���o���g��׉z6��N\Z��_J�A���+A�ԩ�2\'�\0q0��A�ZwV���-Rwq�p�\r�jO°�s������s����jr��0�Ӓe�.��gR�m��Wߠծ?�4b_]%�Vb�>��L�T6��zsr����u�h�z��AO\Z��_�$u(}\npk� 6z������z�B�S�czEf��}_�I#z�W�kBW�������A�/��;@�S�}��o��ʹT�x҈|\\�5��Z	��[����E{C��R��㑓��GH�_�$�K�@�=]��A�y�P\\ΐ{M�O�P3�4>x��򂂂�֭[grrr�\ZTnn����?.�f/O��b�Ǩ�~FP�;�\n�c\\Fo\\�i��6m2%%%�T-����lܸ��[o����l�x9DT\\͊��{MH�u�\\m����u{]^�����Æ\r�������>���~���	zuf�9�}��GV�~�~�>k�=����I����#l�7���W�Ì�ȏK�)������\"W�O�6�����8y[ڌB8�\'�0.#_Ɨ�t��\n�Z�f�!V���sal�E�����,\\d��d�~�����a��ބ1�2�¸���I�8��W�ަ��ф1���t��=+��p}�gM�qɸ�E��M	��zM�qɸ�A��3!h��}t4a�%�N��A3.�#��S�`����ф1���t���s�v��GG�`\\2.c��\'��2�|��o��6���&���d\\Ơӵ}��5����Ʉ1���Xu���f��y׾���>:�0�q�N�3y�m�tmJ��l��K�e�:]~��_ov�����?�?�oc��K�e;��ߺ�6&���d\\Ơ�C��[�oc:�0�q�N�i���N\'���d\\F�S[�0�qI��� �)\"���d\\��t:c�0�c0.�t:�\"�)��K�����7o���Y�`A�m�F��n;z�h�����b�?>��Z�v��wsss	c0.�tz8�~�z���o��}�Z�9s�L�ϻw��A3.	�P;���Ӧ_�~�]�v�}��fĈ�?7y�ds뭷��mۚ�\'Z��[���u�]&33��r�-V���YYY�c�ܹ��:t���;L�V�L�^�̉\'�>g`��G�g��ل1������.4͚53���fѢE�k׮��O?5���~�^�~���+W�4��������k����_��>���s�=fɒ%���X�\"�s�;}�ԩ�y��&==ݜ���V�1��K�:}۶mVC���巍9Һ�����\r\Z�֭[[����g�̔)SLÆ\r��kѢ��[���o���U��7pQQ���<�u��F\r���Noܸ���d��K�e���X\r�om��eddX�~���ϫW�6����[�o��Ç[��/��{Ϊe˖�wz�_e��?�����f^{�5��9s�}N�w���z��o�c0.���ӵc�7]�6m��D���e˖�cǎ�����7:t0{��ޒ4j��̚5ˬY���\0�[��Ν;�����N��IU��G�6M�41�6�/��1cF���w��ߧO�nݾ}�v��K��������X�`ޢ�E[�l��;v�y����\"}˓��dN�<iΞ=k|>���iӦ�gϞ������0Uu�~r��[�.]���n�����?�s~PPVVf}P��V�1���z���*--�֣*��ԩS֧�o���Դ���yNN�\0�qY�;�3}c0.�t:�\"�)��K�%�N��0�c�0�qI��� �)\"���d\\��t:c�0�c0.�t:�\"�)��K�%�N��0�c�0�qI��ٲ��jL_C�%�E�>�z�����I.����px�޿w��S�5��%�T��^핎�h�{��w/y<�%�_IeH(7\"fP��={�$����z)�0~uժU���K	�Ku�E���_l�i*�:r��[��Eڶ2�:�\0[/_?�֝�AEM�1@^#G�ޒ��?1.�;.����?�aÆo�;�-�V�߼�ṹ�_H�lc	�2Њ�>���%� \Z�k�#���$���/n�el�e�$���[�P��Bը�튂uxbbbc{�2芥^KKKkK�\'}�$���>�Jd\\:7.�RSS�\'�����R/���7�U���O�6J�z��\0����ƿ��R��	\Z�*�6��E��]�ϥ|�5P7߲�Xh��N��\"�����Q5G����ݻ�@�\0u����\'��Τh���]Ok��Y�RԄ�����U���$�w��1=�TB�6Z����+}6QCX���P�U����k)a<�>��7�*u�.?H_\r����^��Z�_ow�����J(���\Z�*u�\ZI�<)��ԟY^�9=$J���U��ر���Oj��-����d���+eV�}Z$����.}P �	�n��o��J�0(��+�ЊV��/���Ζ�/ߧ$�d���{��Oj���kF�D�n�c���F>���vZ@e�|���\n=�K7�a�Ҟ� 5_߁�L�y��VP-��Jpl��&�3Z��3aksw�����?�*\0��ߖQ�@X��f�$47wי1��Vt�Xב5X�3�n�U*lsw\0�=�B���uO��Y=�V��]D���@��1���z��+��#��� *4x�����Ycl��N�=�0N��.��Y��\"���ҁfsw\0u���;��GLӝ�B�;-j��I�5}�pN�`sw\0��[���C���^�ztAᶴk�\Z�\'���a�}�������\\�3��UF쫍��$�;I]�:�,:H��[MY�{��ѥ���gsw\0�Frr�Cf;��|z}�� ̳��HнY� ���`A�����YO�^l��^�������o�a*T�Zq��e�L�� ���)�����;������\\�N��_�$�K��@/ԙo�K�9�_n;)���l� .H�\r�$����~[� ���f�zD���\r=����$�W����\'�\r���W\Z��$�;�\Z{��\Z|�\0�ݬ8�� ����jS� dk\rY_��.\n��G�S\0�-;��R�R�GP�GT���:�C���+r��V�ZyBbPU-Y�����fߧ��T��oy��o\0�{�!�}�ݷ�I�&�5m���j~<�0N��~��\'��G6w�ЗN��!��?��%�41\0��af�al�љz\0@G6���SJ @d���a��hz\0=�M-*�,\0����yà#��y�g8�\03c{��́��]��\0 ����B:��+X�\0�rM���n&\0q���nwJ�(\n\0I�0f�ᄱFܛ&��gȡ��j�\0P�ru����\0�rm�x	b\0����W� � �3�p�� �(ΐCY����u\0��Y�/&� 6�\\�Q��\0�` wbά\0�g��}\r\0��!����\0f�1\0�0\00\0�\0@\0a\0 ��0\0�\0@\0c\0 �\0�1\0�\0\0�\0c\0\0a\0�1\0�0\0�\0@\0a\0 ��0\0�\0@\0c\0����J÷�*��\0 �a�I�RUa�v�{�R\0�@^SE���ؘV��̎+\rc���-\0���֎�@�gǗX+\0�I��ì\0���k��h\0p��Y1\0Ĉ�΀%|\'ه�I]X�8,��H�,������j\0!.����	��B8�.����I�I+@-f�n��y��{6��X�t��L\0\r�-��b�fff���盂�s��s��9��kII�پ}�Y�d�:the�I,�#Z\0B�GI�����ȑ#���|��	Վ;̘1c*�r�#@A��z������Y�jUX!\\�ڵk���jق@�*�&$��\\�طo����?��\Z4���%\0d��30�u\r8���Yא�P\0�^�x>pi\"R3��f��,���\0��6����\Zq4�\Zr���.��\0➞�x��ŋM��\Z5*0���\0⚽V\\~f���v��L=���7\0�-=�,�C�����Ct/z@</QL��M,-[�,0�_�7\0�s�_\\TOq�%]	X�ȣ7\0�s��bqqqL�X�;�~��\0�a\\~;��?����o� �ø<�@\03c\0�3a̚1\0ԁ0�h\n\0�a�q�\0�4	�ǜ:oȐ!W8\0��7��ײ7\08�T15p׶X̎+\\�]�\0@�3�� ��1\08?;��+}<��W��\0TB�E�פ��5�����*�՚�+\"}u�� ���\0P����Y�,t\r�6��\Zq���K��=�\r\0a��(�;v�}�ڸq���\0�E�\Zr�҅��WXXh�e��\\H�ꚰ��YxBG�\Z1K\0&�p�>��\\�`\r�tg��|X\0���!ˌ6+�L��XO��x<?� B��i{/�I�no�+	�<��G���g\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@]�������!\0\0\0\0IEND�B`�',1),('3',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.myProcess_1.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0`\0\0\0Z\n�z\0\0�IDATx��{LUך���C��8���:ޘ��1��L����Վ�N�[����T;>*��k�ӱ�����Z{�w��( �Aѣ���J�p)EE@�ך��p�=�p�b���/��ǳ�;���[묽�k�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@�A)埞���m��%&&���OGDD���`���?~���ps����裏~K�\0��O?�������-Z��idd�JNNV������\\544(�ѣG���J9����,X�,::�:>>�����~d�s+i����QQQ�֯_�._�lI�V�^��tV~�a}ll�42\n�I�t���5111�ҥK�#\\�vM��ɼy��ٟ�x����I+V�x�e�u��}�	�]���x�9��\0��\"�_~��<y�<�����\n��G�:0F��W*jg��dӦM��¾&�\0��L&��S�ok-qdddMppp\0Yx��Wf}e��ȤShhh�W�v\"ߣ��3�d͚5��꺘��}��/�UU�5�����d@���X,+�:sR�U6�m�@������$%%]ҭ�\Z>�6 ��e��/8{�l��� �@��gdQ�/�}�v����O�\r���7_=�m��\0-k�@��Q}��O�\r̚5�+�m*+@�Ǭ\r�\Z�VUU�`�\n�FV�ZU������o�\rh#k֬��W߳�\\��(߳����迗{&�`S�,7d@;X�h�-o�\r֭���߳6��X�b����yS�y����v\"72�;wn�ܑ��;w.]�*׳�QQQ����ξSă*�X��;E\0t�����)))�a\'N6�.X�@ƪ��6@��]aӷm���	�������|����<$��~�aÆ���z���.�	���S<,lxxx�n�k\n\n\n�tt2�i����\n�I�$PXXXYBBB���=�q���H�1���2���\Z�l�(������{����rrr~����r>�J���E�\'N�H�%��2�I�Ŵ�\0����u���~��V.o��Q��,�1����,!de�y?�ճ�\00_և���_�	\0�e��K&\0̗�^DDD2`����v�@2`��偁�C����������L\0�/�,~x�L\0�/�\r���L\0�/k��n�L\0�/k��f{�L\0��		K&\0̯�Y�O&\0̗�,7��\Z�����!\0�˚͝ \0�\0��f�E&\0̯��Zط������l������Q�L2`������	\0�+�-��L\0�/�W:����m��6�2`~eݥ�_�����������hQ��V8�L\0�_Y7���L\0���_��\ZG&\0̯����]F&\0̗�s+����8AW��d���\Z�c-�\00]U��꺎L\0���ja7�	\0�+k�,� \0�W���L\0�,���d�����\\&G&\0̯��r:�\00����څL\0���M����m�L�)�\00�\r����2`~����ߐ	\0�+�?iYO�	\0�	\n\n��6�L\0�����#�L\0���Z�z�L\0��f�;-�y2`~<N�-�\00�����-��#\"\"��ϯ������\0���f��^G��&��������\"��c��d\n���5UVw�n\'K\0�WW�*��յ�%�$;\0�a�٦��UW�ߐ\0т�v5��\0�+k�Ke\r #\0f����S2`8AAA���}B&�[���+))9������ɓ*##�x����T����u�qVA� ��>}ZUUU���F�q��-���S��}�3<�TTD������qf�Ǒ��<Z�ǜY�qd��`�Uqf��d��W�J��j��V�ϲ\r9����n����R�{.d��CPdCd-�z�Q���GY�Y��׹�U�!(��!�^��̭��A��Y�#�����U�!(��!�����VVه��\n��Z]vY]9���Xo�}��`���_��Yer\"+�$�Ç�ƙ�/��z��CPdd�J�y[ݎYe���|)����7�TaZ�[Q�!���Re��,��US�,��!�����Ve�Y�K�����@Vd_��\nȊ�\0Ȋ�����\"+\0�\"+ +��Еd��˓T�ڵ�y�ҥK�m~��\'Z��2��^iii�ߕ�� + ��e���R�R�g϶�sӦM���\n��IY�߿��̙���F�\Z�/^����kת���aÆ�իW[��#G�T���j�����=))�zς����F���fΜ������UV^��e�ddYw�ޭ���屈*99YM�2E]�~][�Y�|�U-��#G���Ǐ[?�3��w����^�pA�=Z�۷�y��Ç��)kbb��۷�\nW=x���Ѳ�?�`ǎ�����m�:�áz��\r\Zdɑ��m�fݺu�gϞ�8\"Z�~��j������]e-**��c�ԩ�~��������:vII	m0tYo޼i	 -�s�ܹs-Y���ߏ;�BCC���Y�bcc-iD�%K�X����,k���d���{����={�X��n����NYǏo���*#+tYEH�`C��Za�����W�ƍ���ܹS�;V]�v�jE{��6oެRSS-qD�s�Ω	&����fY�c��d]�l��ݻ�*--U{���oܸ��1����}Æ\r���/\"+tY��L������#Ϝ9c��T�\'O�Ɛ��Θ1Cݽ{W��׫���2���GM�>��)��umMV��	$ii\'M�����ϟ����L������g����.O�V^SSc�Ҷ�.ۜ�H�\Z\"g{�ɢ�����	YY���@V@Vd@Vdd%��Y�YY	ddEV\0dEV@VYY�\0Y���@V�rA�h4hYsf�����-ww�8��(++�����3<NVV��N�:u�����u�������?�x�3:}rM���!훌�L���`e�OrW��\0\Z��,\0 +\0 +\0�\0�\0� +\0 +\0 +\0�\0�\0� +\0 +\0 +\0�\0� +� +\0 +\0�\0�\0� +\0 +\0 +\0�\0�\0�t=1���?2�{Y��xܚ�6�m\Z�0C��Vd=�G�\0̩�/��n��K�\0��:��\0]`��X�P���CU�\Z�Np��MF\0��ؕ�\n�5Ʈ�`��Rʯ���`~~�ӓ\'O����\"33S������Y���z��iUUU�\Z�ĭ[�TNNN��=�,�8RQգ�6�J[ęGZ_$�lhYsf�Ǒ��y\\V&��w���+W%�du5�s+�gن��\n�Z{�L]I_�\n��=�M�!(��!��^=����գ��`��E����*�Y�Y�d|�VVه��\nȊ�\0�Uf��*�Y�Yo�ms+��CPdCd�.����X�b���>EV0DV��/|����\r9�L���Cu���[`�M�!(����\n�⼭nǬ��UL�\n��UW��Y�0-ޭ�ΐ��k���\n^���)UY�Y�RM[��Ȋ��%Y_UTg +���f�	ddEV\0dEV@VYY�\0Y���@V�J�����	�v��ռm�ҥֶ�����ĉ��j			�~���4����i���òfee�C��ٳg[�i�&����Bdd������Ws��QÇW�F�R�/n~�ڵk����հa���ի�m�X��#G���H5`�\0KVٞ��d�gAA�sǏ��Q#F�PT3g�T���n��*�/�ٲe�����w�V����XD�����L���_�������,_�ܪ���#G���ǭ�ǌc�s�[Y/\\��F�����׼����n��511Q���W������bY�hYϟ?o	�cǎ�mqqq�6yJ���P=z�P�\r����ζ^�n�:ճgOK�_�~V5u�z����㮲Y�1u�Tk�TJw�t����g����6���7o޴��ֹm�ܹ�,uuu��ǎS���V��~����4\"��%K�HIIi����e��k�=���Ԟ={��[�nu{L���Ǐ�Zli�����\"�T��C�Z��T�����q��Y�w�ܩƎ��]�f���z�R�7oV����8\"ٹs�Ԅ	Tzzz��αjk�.[�L���[�����{�Z�7n����NY���a�k�ŋ������R&y^k�ZEƑgΜ��UVV�ɓ\'[cHiug̘��޽����UDD�U��飦O�n���ٺ�&�������&MRC�Q���w{L�	���Zk�IƳ�\n�FV��+wOS����fi[n�m�I�W\r��=�dQt{YY������\n�J + +� +���\nȊ�\0Ȋ�����\"+\0�\"+ +�����\n���\n�J +x�� �y4\Z���9�����斻�P�h����^�Zę\'++�w�N��WYY�����ۆz�������?�x�3:}rM���!훌�L�[���.�]��\\i�ۇ�	\0�e-���o����f�E&\0̗��l6[(�\00_֍Z�X2`8Z�O���N&\0̗�-k2�\00����Ѳ~C&\0̗�WZ֋d�p�����L\0N```-k#�\0��l����+2`8v����7�����ܠ��$\0��zP�d�|Y�iY������Ա�L\0��n��e�I&\0̗�]-������Z�z�L\0NHH��hYK����Ӳ֑	�.���><<�/�\00_�i��������&2`���k��~G&\0̗u���d�|Y�ȲC2`8��_��	\0ñ��A:�@&\0̗u��2`��o��]����\r���id� �$\r\r\r�K���Z�	���\"\"\"���o��0-�vGu8t|���\\6`@\rh!����!S\0f��Y������h-�-7��\'C\0a�ق_&kPP�[d��v�tˉ���\0?2`^u��B��`��IM�>�U\0�i�i�--m5�\00�������g-hZ�إ%.��3t|!)��\0ޯ�C���i����-��i���d��+�nu?\r		�o��-�T[*-@�T�_j�\nZ��v�ܩ���UYY�jhhP��YUU�.^����ۧbbb^�V����7�.����gBCC�[�g�����V.]�����[J[��\ZY�����}��KK��=�.I[����t�\\[��\0l}��w\\[���b�	~��ݲ������e\n\\E�1�\'��sVưL:����Ե��TE}Y�m�\'�}����C]���1jg\"cX���|\n\0m@<���>z�Hu6K�.uv;�@�ƪ�+���op����V:�zc>\r��Ǫ�\\\'�:�M{q]8!k��4\0Zo��8�ٽ{��&)))��~��к��Nad	�7��ۥ���\0h]�Na��˽*�|��zy�@�6_��\\��-�x���4\0Z��Y_��\0TV\0Ƭ�Y|#+��\0]DV�g�\nhI���\n�E�=c@���2^dm0@�h�]���Fumqo&��hM���zV�.6���w��5k�3���Ƚ��H�}�����܃	����]�aO���UT�n�A�)��z��-Z_���:g�����zf�ʕܑ��[b�1�kk,+������nDhY����g�\0t22��4K��ѧ�ɬ/�I\0��|�+b��J��<��n��A�H�mK�m�����׹ș�|�9K\0\0\0\0\0\0\0\0\0\0\0\0\0��E^����\0\0\0\0IEND�B`�',1),('30002',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','30001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('30003',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','30001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('40002',1,'leavework.bpmn','40001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('40003',1,'leavework.ac_leavework.png','40001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('42502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','42501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('42503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','42501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('45002',1,'leavework.bpmn','45001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('45003',1,'leavework.ac_leavework.png','45001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('47502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','47501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('47503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','47501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('50002',1,'leavework.bpmn','50001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('50003',1,'leavework.ac_leavework.png','50001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('52502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','52501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('52503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','52501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('55002',1,'leavework.bpmn','55001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('55003',1,'leavework.ac_leavework.png','55001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('57502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','57501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('57503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','57501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('60002',1,'leavework.bpmn','60001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('60003',1,'leavework.ac_leavework.png','60001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('62502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','62501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('62503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','62501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('65002',1,'leavework.bpmn','65001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('65003',1,'leavework.ac_leavework.png','65001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('67502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','67501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('67503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','67501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('70002',1,'leavework.bpmn','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70003',1,'leavework.ac_leavework.png','70001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('72502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','72501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('72503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','72501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('75002',1,'leavework.bpmn','75001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('75003',1,'leavework.ac_leavework.png','75001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('77502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','77501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('77503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','77501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('80002',1,'leavework.bpmn','80001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('80003',1,'leavework.ac_leavework.png','80001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('82502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','82501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('82503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','82501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('85002',1,'leavework.bpmn','85001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('85003',1,'leavework.ac_leavework.png','85001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('87502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','87501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('87503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','87501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('90002',1,'leavework.bpmn','90001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('90003',1,'leavework.ac_leavework.png','90001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('92502',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.bpmn','92501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('92503',1,'/Users/lidongfeng/Documents/code/projects/rcplatform/src/rcplatform/target/classes/processes/leavework.ac_leavework.png','92501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1),('95002',1,'leavework.bpmn','95001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1490513717690\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"ac_leavework\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent activiti:initiator=\"${userid}\" id=\"_2\" name=\"StartEvent\"/>\n    <userTask activiti:candidateGroups=\"1\" activiti:exclusive=\"true\" id=\"_3\" name=\"UserTask\"/>\n    <endEvent id=\"_4\" name=\"EndEvent\"/>\n    <userTask activiti:candidateGroups=\"2\" activiti:exclusive=\"true\" id=\"_5\" name=\"UserTask\"/>\n    <sequenceFlow id=\"_6\" sourceRef=\"_2\" targetRef=\"_3\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"_5\" targetRef=\"_4\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"_3\" targetRef=\"_5\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"ac_leavework\">\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"165.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"170.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"145.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"181.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"181.0\" y=\"130.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"186.0\" y=\"295.0\"/>\n        <omgdi:waypoint x=\"186.0\" y=\"405.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"185.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"185.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('95003',1,'leavework.ac_leavework.png','95001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0�\0\0\0f,Z�\0\0\ZIDATx��t���ѥG��S�.ݪK������n��)QZZ[Ųu2����\"(�\\��Z�;t\n���\\˥���@K@\Z	���p����<�����&�L�9�~�<�������x����r�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\'�s�rrr��3g�欬�O�}�ً�pإ��������<�̹q���8q�?���$1�$��?�ƒ%K6<����L�p�BWXX����\\ee�S.\\�����]QQ����vO?���A�=z�>��9)$��6/((X;p���S�Lq;v��D���ڵ�I�vO>�䙡C�>B�\0	�3g�<9d��}�vWv���dH}驧�Z)C�f�ЀTTTt3f̅Y�f�S�N�x�Cmy��Xǐ\Z�;�����/�K�.�x3w��҉�RRR��6@��:l����F�1c������I �肕�y�5l��p:33�dZZZ\n��i謫ͺҜta+\nb>�{^��(�L�4����H�~s�fz�F��o������`�C�\0�Ann�0=ª!�b���~W��:��6�ᑍ���ӷ�0z�@�������w�= ���\0PG��\"=1�18z��1��w��dddT�U�h����w��������>�@�ӧ��F��G��\0��W6����|/s`�z0~��=��\n����{V����I�^o��ǎ������A��M�a�GbUꡔ�PO|$��B˰]���9\Z���3f��)S.\'R৞zjg#���\\�~�*�J��`���9�}9 N8�a�_h�+r�={���}�pE�8ӿ���O�~��*�~�i��.!m�8�J҉s�̙s�$�=z�o�{_�\rЀ�|��S�N=}�̙�\r���Vo0�H���2�>Y\\\\|��VUs�%t^��M���ǍW*\"�fX]YTT�Z�Ժ�̂@#�]��������)S��[���C��Gnv�g�	k׮���#��*q�1dH���Ej����H�\'=P����D縲�%=<�#�\0lH}I��-$`S��\"�m$`S�\"��H���,T������-H�f>ڻw�;H����322Z��M�?���\0�)�_���$\0l\n��L�E\06����w 	\0���>��^�\0�)�.�>�\00��w�B�!	\0��)v\"	\0�����y�$`S�B�o��M�7J}�$\0֥��~�$\0l\n�/?H\06���K\0���k����I� iii+�~D\06��TO�\0�)�R�H� �@�2���M��6+i$`S�l8D\06^,�&	\0����-��K\06~U�?I���s����M�g�x I\0$����M����CI���/���I����\"�(�\0�)�$�1$`S�	R�I���c���At���`�\0�)���?�$\0l\n��<�$\0�Ga��X$`S��z<4I\0��i��I� \"o?=\'�$\0l\n�W��A\0	}D�E$`S�tx	I\0D�	�׆&	\0����$`S���!�2�\0�)�c\"�[$`�7��#�$\0\"�����I�����ג�ARSS��I�����ב�M��!�H� ~����.I\0D��\"UD\06�,�G�\00H �(��A|>�}\"�.�\0�)�\"�n�\0�)�e�W�����B��I 	A��K�I����\0�.?yq�.j&)�$$%%�iU�%�\\R�م�\0F�p�5~�t\0����)�t�H�\"�(ysI���)Q8�D\0�\r�� ��S�\0�)p�P�\\����7\n?}��]nn.U����s�ׯ?*�Χ\n�ʻa�W^^�Ο?Oգ�9�֭[wRd~�O$��W��KG.�	A�͈��/�ɂ���7�����O$���?)s�Eݮ��ҟu�\"0$��\'��rƺ�Uï(ݦ���!�>�k�U�F�]+��!�.)�S`݇�I,�{�b\n������!�U�X�>�E`Hb��n�S`݇�I,�;�{k�_=|�m�i�X`��[u���\ra�]�s���Ms�>�6݇�I*�i�g��s`���X�&�tֲ��n��1協>FK7F`H��Vץ#0$�����^�#0C#\n\\Wy#��ɴ\nM!0 0 0 0S��\0����u��7�ֽ����F��m;t�P���������f�7��ϵf�\Z���!0 p���wK�.u}����sƌ��;w�D`@���ԩS�\'�p�۷w:tpÆ\r�~܋/��Z�n�ڵk�&N��m�[��}��.33��q����}����s_��C�qw�y�kٲ��ի�;v�X�׌X��י5k�x����Y�fzN�p�B׽{w����={�x�y��置�?/_�ܭZ����cǎ޾�Ǐ�x�֭�{�q�/�޿lٲ��8++��~��.##Ý��T�޲e�\'�+��R�m����6��aQQ����]�V�<a\n\n\n��L�<�5i�ēI�k޼��u#���kW�N�\\RR�=G�=���Qc�fD�M�z�]ZZ�\Znl�����I���ȶ~��y�>}��}�ʕ.\ny��H�:t�\'��>b�������������X}���t�`�o��ٳc�fD�.]�x�sf#0������ڶm�\r���h��u����?o�<שS\'�{�no{�-���3g�իW{2�x�7ov]�vu999�G��xԨQ��[oup�-��O�6-�kF����S�z۷mۆ�p�\n��B�MU_��tӦM޾Ç��zț��0�gϞ�ĉ�̙3.{���ns�>����AD�Ȱ�z�J�.R�p�[�n�M�6���1_3z����[���1�\r-p�]�y���<y�[��]�E��Z*lm^�9\0�)F`\0F`@`\n��\0�\0��B`@`@`F`����)�dG���tq�J�\"�,H�ׯ/�u�=U�:x��E�>Y����{�w>9|��Y������*o^^އR��ɂ�!�G�k��O�o�Zk׮u�@��3	�~�]	�\\����J���9�\0�)�1�$`S��D��$`S��`�+$`S��@ Б$\0l\n\\(�-�\0�)pAjj�$`�߿J��?$	\0�/�9�OH��z��N\06�\'Տ$\0\"�w����M�_��#	\0����d�I\0؜��\"	\0���C\06�+��_���9p��:I\0��1��o��M�{��kI� 2|~@�@\0	������A|>�}҅w��A���%��$\0l΁ۈ��H� �P��\"�I�\00HJJJS����_T�I��<�TϞ=��$\0lv�ú�E\06ޯ_\'��M������F\06ަ�T��M�7�I\r$`S�\"��H������I\0�K��uH�����J\0y!g���9p�^��$\0l\n���X�\0�9%��$\0l\n<Do3J\06����Fߑ�}>_[�%�\0$�P�\"g����,$�#R��\\T�I 9;��\Z�֬�\\� y�_�������$%���³c|$7#!�$F$mQ5��)p�\0����j�{�K�\0���ͪV�=���7�1D�\'���N\"\0�q��/��A|>ߏD�s$p\r�sMKKK�(,,����v���T*//ϭ_���T:�*H*�\r\\yy�;�<U�:r�[�n�I��q>Y���\"o\\%>/��O$6#^|K斨�t��tq��ɂ���\'e��h�ە��W��nCX�$���A�^�XW�j���t�\"0$��v-�J�H}�k�\"0$��%�c\n����!�~/wBL�u�\"0 04����K`݇�I,�ލsb\n����!�>vp�{o����ϲM�!-C��믮X�!,C�|�ۻi���g٦���!I�#��l�s��8\Z�!���Z�7��\\3:������c��I ���tc�$��t��ucF`hD��*o��!�V�)F`\0F`\0F`@`\n��\0��n�q�F�кW_}�z�ȑ#�m��������sլq�����֬Y���z?#N�����n�ҥ�o߾�sΘ1��}�Ν���:u�=���}���C�nذaՏ{��]�֭]�v��ĉ�mz˗���eff�;��X�O�>�{����+^Ȑ!��;�t-[�t�z�rǎ�����?�:�f�B`@�Xϟ?�5k�Lo��.\\�w����}�g��1�?���U���˗�U�Vy?w����w���oݺ��s�=n������-[�5#gee��o��edd�sq<�\n����[�l�x�W��\r>�ۦw?,**r7�|�kժ�\'LAA���ɓ\'�&M�x2�|͛7��nD��^{�׉ՁKJJ���ѣ��_;j�׌ܴiS�KKKBÍ-�}�<)t8�֯_?O�ӧO{��\\�҅B!o��C��DR�G��Uvvv��5�~�X�ϑ���,X��={v�׌ܥKox��l�Z`�T;]۶m�a�v�-Z�Ν;{��͛�:u��v���\rco��7s�L�z�jO&o��ͮk׮.\'\'�Z����z�\Z5��z����nѢE��iӦ�|͈���>u�To��m�n\\�#CS]H���+��nڴ��w��a��CysR&���ӝ8q9sƅ�a���v�m��G��1��^O`]��E*w��͵i�����?�kF/bUTTx�X:?F`����K�7�־�\'Oz��5���BU]K���kr  0������L!0 0 0 0S��\0��������#0\0#0 0�������.�U)_�	a���e�N��j_��\\�\'B~~�c���\'�>����*o^^އR��ɂ�!�G�k��O�o�Xiii.Y�nU�ٕ /@\r&L��D��$\0����Tfa�\"?��߉��H� >��s\"�Y�\00HFF��\"�i�\00H(��|�$\0�[���$`s����H����D�r�\00H h#\"	\0������?&	\0��B�/��H���K\"��$`��.��$`���A��$\0�\"�!	\0�s�{��n�\0�)�}\"�.�\0�9���w��A��v��I� \"og�?��A���7D�$`s�MxI\0����.I\0؜[j#I\0$< o 	\0�w��!	\0����>(���9pw�<�\00����!���9�D��$`�`0�C�«H�f~T^N\06�����-�\00���K�M�\0�)��Ro���9p���\0�9N�_\'	\0��D�l�\0�9ΐ�I\0؜������W$�%I\0���O�<�H�f�\'5�$\0l\n�_j.I\0�x���\0�9$s�Y$`�w�H<�$\0l\n<T�J\06��ä�H��x�t��$`S�QҁN\06��ϋ��E\06��c�^ 	\0�O�\ZO\06~A�0I\0D�:&	\0��$?G\0����`�\0�9�ң�H���Ӥ�!	\0�s�zFI\0؜��s�I�����3I��x�^�$\0l\n<O�LI\06�/�I\0D�� �������H�D\06^\"���M��W*H\06����8�$\0l\n�[�G\0y���?!	\0�s�7�z��M�\'Փ$\0l\n�B�я���9�`0�C�\0�)�\Z��$`s�6|�$\0l\n�\'՝$\0l\n\\ �B\0����������A$~�$\0l\n�I�w�\0�)p�ԷH���[�~�7I����D�%	\0���\n��H�f.I������L\06����F\0������K\06;�^��$`S�}�`�H������\"	\0��U��_\"	\0�$�\'	\0����ގ$\0�����F����f��|U�x=���(@r�^G�)))MI	�`�����K�5�������f�&�\0�$��(���}l	�5��rwB\0�s�R����/@2�C�@ �v��j]���5�> �s�^��h�\0H|>_[�s�H��g8\n+�ʤ�r�@#u\\��>��RܚuQ�2 q]��\"]qM333ݼy�\\aa�;x𠫬�t��Y^^�m��/^�r��z�Y���t\Z]]�BG��>|�\'�K��ge���n���5E�`�\Z��!�وp\"�[�bE�ĭɚ5k���R#1@�E�����={��x���\r\Z4�f\'f8\r��\"*��W��D�/Zb������s���xu�ku�\Z��,���йm�WE:�mHtN=��\0�@҈^m�p�khF�-�\\����}���ү���;�8bK�ps�\r���}�^����E�%�`��P���D���w�$;;;Z��x7\0j/��Dzxd\"��z�0��w���HTVV�P��{��Sy7\0j/p�u�\"\'&$\n}���y7\0j/p�@�Ё�3�\'0��\0��{`\0��8?n�#�|�#�\0���O���;�Ί>)]�Ƶ�8	��T]�����v�I��\"G�>}.sE�8�צ�kT5�5��)��h\0���[�PW�����R4\0���ߍ�8^ׅ�1l��\0��8�:�wZ��WEcǎ��\0�1���G������\"����FR����4�7@#�LU�ӕ��;��6�`�����9�G�U�����\"@#Su	�Wu��ѧ\"F	[�\'&��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0������<S��\0\0\0\0IEND�B`�',1);
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
INSERT INTO `ACT_HI_IDENTITYLINK` VALUES ('17503',NULL,'starter','1',NULL,'17501'),('17507','总经理','candidate',NULL,'17506',NULL),('20003',NULL,'starter','3',NULL,'20001'),('20008','总经理','candidate',NULL,'20007',NULL),('22507',NULL,'starter','3',NULL,'22505'),('22511','1','candidate',NULL,'22510',NULL),('25003',NULL,'starter','1',NULL,'25001'),('25007','1','candidate',NULL,'25006',NULL),('27503',NULL,'starter','3',NULL,'27501'),('27507','1','candidate',NULL,'27506',NULL),('30007',NULL,'starter','3',NULL,'30005'),('30012','1','candidate',NULL,'30011',NULL);
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
INSERT INTO `ACT_ID_GROUP` VALUES ('1',4,'总经理','assignment'),('2',3,'人事经理','assignment'),('3',3,'员工','assignment');
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
INSERT INTO `ACT_RU_IDENTITYLINK` VALUES ('17503',1,NULL,'starter','1',NULL,'17501',NULL),('17507',1,'总经理','candidate',NULL,'17506',NULL,NULL),('20003',1,NULL,'starter','3',NULL,'20001',NULL),('20008',1,'总经理','candidate',NULL,'20007',NULL,NULL),('22507',1,NULL,'starter','3',NULL,'22505',NULL),('22511',1,'1','candidate',NULL,'22510',NULL,NULL),('25003',1,NULL,'starter','1',NULL,'25001',NULL),('25007',1,'1','candidate',NULL,'25006',NULL,NULL),('27503',1,NULL,'starter','3',NULL,'27501',NULL),('27507',1,'1','candidate',NULL,'27506',NULL,NULL),('30007',1,NULL,'starter','3',NULL,'30005',NULL),('30012',1,'1','candidate',NULL,'30011',NULL,NULL);
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
  `BOB_JobCode` varchar(50) DEFAULT NULL COMMENT '编码',
  `BOB_Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `BOB_AccountNo` varchar(50) DEFAULT NULL COMMENT '帐号',
  `BOB_BOCTid` int(11) DEFAULT NULL COMMENT '币别',
  `BOB_Address` varchar(100) DEFAULT NULL COMMENT '地址',
  `BOB_Tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `BOB_Fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `BOB_Man` varchar(50) DEFAULT NULL COMMENT '联系人',
  `BOB_Del` int(11) DEFAULT NULL COMMENT '假删',
  `BOB_AddPid` int(11) DEFAULT NULL COMMENT '创建人员',
  `BOB_AddDate` datetime DEFAULT NULL COMMENT '创建日期',
  `BOB_Note` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`BOB_Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Op_Bank`
--

LOCK TABLES `Base_Op_Bank` WRITE;
/*!40000 ALTER TABLE `Base_Op_Bank` DISABLE KEYS */;
INSERT INTO `Base_Op_Bank` VALUES (1,'001','测试单位','776655555577',0,'上海银行测试地址','88777777','88999999','测试人',0,0,'2017-01-01 00:00:00','这是备注'),(2,'002','测试单位2','776655555577',0,'上海银行测试地址2','88777777','88999999','测试人',0,0,'2017-01-01 00:00:00','这是备注'),(3,'003','测试单位3','776655555577',0,'上海银行测试地址3','88777777','88999999','测试人',0,0,'2017-01-01 00:00:00','这是备注'),(4,'001','测试单位','776655555577',0,'上海银行测试地址','88777777','88999999','测试人',0,0,'2017-01-01 00:00:00','这是备注'),(5,'002','测试单位2','776655555577',0,'上海银行测试地址2','88777777','88999999','测试人',0,0,'2017-01-01 00:00:00','这是备注'),(6,'003','测试单位3','776655555577',0,'上海银行测试地址3','88777777','88999999','测试人',0,0,'2017-01-01 00:00:00','这是备注');
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
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('schedulerFactoryBean','TASK_1','DEFAULT',NULL,'com.ruanchuangsoft.platform.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\04com.ruanchuangsoft.platform.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X���0xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0有参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),('schedulerFactoryBean','TASK_2','DEFAULT',NULL,'com.ruanchuangsoft.platform.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\04com.ruanchuangsoft.platform.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X�w�`xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0无参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0x\0');
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
INSERT INTO `QRTZ_TRIGGERS` VALUES ('schedulerFactoryBean','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1496831400000,1496829600000,5,'WAITING','CRON',1490882999000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\04com.ruanchuangsoft.platform.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X���0xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0有参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),('schedulerFactoryBean','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1490884200000,-1,5,'PAUSED','CRON',1490883003000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\04com.ruanchuangsoft.platform.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X�w�`xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0无参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0x\0');
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
  `parent_id` bigint(20) NOT NULL COMMENT '上级科目',
  `code` varchar(50) DEFAULT NULL COMMENT '科目编号',
  `name` varchar(20) DEFAULT NULL COMMENT '科目名称',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `status` bigint(20) DEFAULT NULL COMMENT '状态',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='预算科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountcategory`
--

LOCK TABLES `accountcategory` WRITE;
/*!40000 ALTER TABLE `accountcategory` DISABLE KEYS */;
INSERT INTO `accountcategory` VALUES (1,0,'001','采购',NULL,NULL,NULL);
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `box_size` varchar(50) DEFAULT NULL COMMENT '箱型尺寸',
  `weight` varchar(10) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='箱型基础信息表';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `serialno` int(11) DEFAULT NULL COMMENT '序号',
  `accountid` bigint(20) DEFAULT NULL COMMENT '预算科目',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `usage` varchar(50) DEFAULT NULL COMMENT '用途',
  `remark` varchar(20) DEFAULT NULL COMMENT '说明',
  `planmoney` double DEFAULT NULL COMMENT '预算金额',
  `usagemoney` varchar(20) DEFAULT NULL COMMENT '已用预算',
  `leftmoney` datetime DEFAULT NULL COMMENT '剩余预算',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='预算明细表';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `begindate` varchar(20) DEFAULT NULL COMMENT '计划开始日期',
  `enddate` varchar(50) DEFAULT NULL COMMENT '计划结束日期',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门',
  `billtype` varchar(50) DEFAULT NULL COMMENT '预算类型',
  `billstatus` int(11) DEFAULT NULL COMMENT '状态',
  `mkuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `mkdate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `rzuser` varchar(20) DEFAULT NULL COMMENT '签批人',
  `rzdate` datetime DEFAULT NULL COMMENT '签批日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='预算计划主表';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='堆场管理';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `fleet` varchar(50) DEFAULT NULL COMMENT '所属车队',
  `documentno` varchar(50) DEFAULT NULL COMMENT '证件号',
  `driveage` int(11) DEFAULT NULL COMMENT '驾龄',
  `type` varchar(20) DEFAULT NULL COMMENT '类型（有、无车）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='司机基础信息表';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `orgid` bigint(20) DEFAULT NULL COMMENT '客户id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT '提单号',
  `shipname` varchar(20) DEFAULT NULL COMMENT '船名',
  `flight` varchar(50) DEFAULT NULL COMMENT '航次',
  `portid` bigint(20) DEFAULT NULL COMMENT '港口',
  `boxqty` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT '提箱场站',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '目的地',
  `bgnshipdate` datetime DEFAULT NULL COMMENT '集港时间',
  `endshipdate` datetime DEFAULT NULL COMMENT '截港时间',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT '最早到场时间',
  `endplanarrtime` datetime DEFAULT NULL COMMENT '最晚到场时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `billstatus` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `makedate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='空箱计划';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工厂管理';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `orgid` bigint(20) DEFAULT NULL COMMENT '客户id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT '提单号',
  `shipname` varchar(20) DEFAULT NULL COMMENT '船名',
  `flight` varchar(50) DEFAULT NULL COMMENT '航次',
  `portid` bigint(20) DEFAULT NULL COMMENT '港口',
  `boxqty` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT '提箱场站',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '装卸地',
  `backplaceid` bigint(20) DEFAULT NULL COMMENT '返回地',
  `bgnshipdate` datetime DEFAULT NULL COMMENT '集港时间',
  `endshipdate` datetime DEFAULT NULL COMMENT '截港时间',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT '最早到场时间',
  `endplanarrtime` datetime DEFAULT NULL COMMENT '最晚到场时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `billstatus` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `makedate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门点计划';
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
  `class_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `price` decimal(10,0) DEFAULT NULL COMMENT '菜单URL',
  `gcount` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `orgid` bigint(20) DEFAULT NULL COMMENT '客户id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT '提单号',
  `shipname` varchar(20) DEFAULT NULL COMMENT '船名',
  `flight` varchar(50) DEFAULT NULL COMMENT '航次',
  `portid` bigint(20) DEFAULT NULL COMMENT '港口',
  `boxqty` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT '提箱场站',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '目的地',
  `bgnshipdate` datetime DEFAULT NULL COMMENT '集港时间',
  `endshipdate` datetime DEFAULT NULL COMMENT '截港时间',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT '最早到场时间',
  `endplanarrtime` datetime DEFAULT NULL COMMENT '最晚到场时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `billstatus` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `makedate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重箱计划';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `port` varchar(50) DEFAULT NULL COMMENT '港口',
  `shipcompany` varchar(50) DEFAULT NULL COMMENT '船公司',
  `boxqty` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT '提箱场站',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '目的地',
  `planarrporttime` datetime DEFAULT NULL COMMENT '预计到港时间',
  `planarrtime` datetime DEFAULT NULL COMMENT '预计到场时间',
  `billuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `billdate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疏港计划';
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
  `name` varchar(50) DEFAULT NULL COMMENT '申请人',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leavetype` int(11) DEFAULT NULL COMMENT '类型   0：生病   1：结婚   2：其他',
  `reason` varchar(1000) DEFAULT NULL COMMENT '请假原因',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `realend_time` datetime DEFAULT NULL COMMENT '完结时间',
  `pocess_instanceid` varchar(64) DEFAULT NULL COMMENT '流程ID',
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='请假表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavework`
--

LOCK TABLES `leavework` WRITE;
/*!40000 ALTER TABLE `leavework` DISABLE KEYS */;
INSERT INTO `leavework` VALUES (1,1,'admin','2017-04-04 00:00:00','2017-04-25 00:00:00',2,'fffasdfa测试gggg',NULL,NULL,NULL),(2,3,'lidongfeng','2017-04-10 00:00:00','2017-04-28 00:00:00',1,'dddddddd',NULL,NULL,NULL),(3,1,'admin','2017-04-11 00:00:00','2017-04-19 00:00:00',1,'dfdfdfdfd',NULL,NULL,NULL),(4,1,'admin','2017-04-11 00:00:00','2017-04-19 00:00:00',1,'dfdfdfdfd',NULL,NULL,NULL),(5,1,'admin','2017-04-04 00:00:00','2017-04-13 00:00:00',1,'eeeeeeee',NULL,NULL,NULL),(6,3,'lidongfeng','2017-04-05 00:00:00','2017-04-26 00:00:00',1,'fgfgf',NULL,NULL,'20001'),(7,3,'lidongfeng','2017-04-05 00:00:00','2017-04-20 00:00:00',1,'sfsdf',NULL,NULL,'22505'),(8,1,'admin','2017-04-04 00:00:00','2017-04-12 00:00:00',1,'sdfsd',NULL,NULL,'25001'),(9,3,'lidongfeng','2017-04-11 00:00:00','2017-04-13 00:00:00',0,'jjjj',NULL,NULL,'27501'),(10,3,'lidongfeng','2017-04-11 00:00:00','2017-04-06 00:00:00',1,'kkkk',NULL,NULL,'30005');
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级组织',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `type` int(11) DEFAULT NULL COMMENT '类型 0：目录  1：港口  2：仓库   3：堆场  4:船公司  5：放箱公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='组织管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'1','测试客户',0,NULL,NULL,NULL,NULL,2);
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `placetype` int(11) DEFAULT NULL COMMENT '地点类型 0：仓库 1:工厂 2:堆场',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='地点管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'001','帝乡',NULL,NULL,NULL,NULL,NULL,NULL),(2,'002','风寒',NULL,NULL,NULL,NULL,NULL,NULL);
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
  `billno` bigint(20) DEFAULT NULL COMMENT '单据号',
  `serialno` bigint(20) DEFAULT NULL COMMENT '序号',
  `plateno` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `driver` varchar(20) DEFAULT NULL COMMENT '司机',
  `realarrporttime` datetime DEFAULT NULL COMMENT '实际到港时间',
  `boxno` bigint(20) DEFAULT NULL COMMENT '箱号',
  `goods` varchar(50) DEFAULT NULL COMMENT '货品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重箱计划明细表';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `serialno` bigint(20) DEFAULT NULL COMMENT '序号',
  `risiboxplace` varchar(200) DEFAULT NULL COMMENT '提箱点',
  `returnboxplace` varchar(200) DEFAULT NULL COMMENT '还箱点',
  `boxno` bigint(20) DEFAULT NULL COMMENT '箱号',
  `realarrtime` datetime DEFAULT NULL COMMENT '实际到场时间',
  `trancompanycode` varchar(50) DEFAULT NULL COMMENT '运输公司编码',
  `plateno` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `driver` varchar(20) DEFAULT NULL COMMENT '司机',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='空箱计划用箱单明细表';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `org_id` int(11) DEFAULT NULL COMMENT '组织id',
  `orgcode` varchar(50) DEFAULT NULL COMMENT '组织编码',
  `lazingno` varchar(50) DEFAULT NULL COMMENT '提单号',
  `shipname` varchar(20) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(50) DEFAULT NULL COMMENT '航次',
  `portid` bigint(20) DEFAULT NULL COMMENT '港口',
  `boxqty` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `startplace_id` bigint(20) DEFAULT NULL COMMENT '提箱场站',
  `endplace_id` bigint(20) DEFAULT NULL COMMENT '放箱地点',
  `closedate` datetime DEFAULT NULL COMMENT '截港时间',
  `client` varchar(200) DEFAULT NULL COMMENT '客户',
  `clerk` varchar(20) DEFAULT NULL COMMENT '业务员',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT '最早到场时间',
  `endplanarrtime` datetime DEFAULT NULL COMMENT '最晚到场时间',
  `trancompanyid` bigint(20) DEFAULT NULL COMMENT '运输公司',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `billstate` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `billuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `billdate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='空箱计划用箱单主表';
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
  `billno` bigint(20) DEFAULT NULL COMMENT '单据号',
  `serialno` bigint(20) DEFAULT NULL COMMENT '序号',
  `boxno` bigint(20) DEFAULT NULL COMMENT '箱号',
  `trancompanycode` varchar(50) DEFAULT NULL COMMENT '运输公司编码',
  `plateno` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `driver` varchar(20) DEFAULT NULL COMMENT '司机',
  `realarrporttime` datetime DEFAULT NULL COMMENT '实际到港时间',
  `realarrtime` datetime DEFAULT NULL COMMENT '实际到场时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疏港计划明细表';
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
  `billno` bigint(20) DEFAULT NULL COMMENT '单据号',
  `port` varchar(50) DEFAULT NULL COMMENT '港口',
  `shipcompany` varchar(50) DEFAULT NULL COMMENT '船公司',
  `boxsize` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `placecode` varchar(50) DEFAULT NULL COMMENT '场站编码',
  `planarrporttime` datetime DEFAULT NULL COMMENT '预计到港时间',
  `planarrtime` datetime DEFAULT NULL COMMENT '预计到场时间',
  `billuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `billdate` datetime DEFAULT NULL COMMENT '制单日期',
  `examuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `examdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疏港计划主表';
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
  `billno` bigint(20) DEFAULT NULL COMMENT '单据号',
  `serialno` bigint(20) DEFAULT NULL COMMENT '序号',
  `risiboxplace` varchar(200) DEFAULT NULL COMMENT '提箱点',
  `returnboxplace` varchar(200) DEFAULT NULL COMMENT '还箱点',
  `dockplace` varchar(200) DEFAULT NULL COMMENT '装卸地',
  `plateno` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `driver` varchar(20) DEFAULT NULL COMMENT '司机',
  `realarrtime` datetime DEFAULT NULL COMMENT '实际到场时间',
  `shipname` varchar(20) DEFAULT NULL COMMENT '船名',
  `voyage` varchar(50) DEFAULT NULL COMMENT '航次',
  `ladingno` bigint(20) DEFAULT NULL COMMENT '提单号',
  `boxno` bigint(20) DEFAULT NULL COMMENT '箱号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约用箱单明细表';
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
  `billno` bigint(20) DEFAULT NULL COMMENT '单据号',
  `useboxtime` datetime DEFAULT NULL COMMENT '用箱时间',
  `shipcompany` varchar(50) DEFAULT NULL COMMENT '船公司',
  `boxsize` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `risiboxplace` varchar(200) DEFAULT NULL COMMENT '提箱点',
  `planarrtime` datetime DEFAULT NULL COMMENT '计划到场时间',
  `clientinfo` varchar(200) DEFAULT NULL COMMENT '客户信息',
  `losedate` datetime DEFAULT NULL COMMENT '失效日期',
  `billstate` int(11) DEFAULT NULL COMMENT '单据状态    0：新增   1：审核   2：预约中  3：完成   4：失效',
  `billuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `billdate` datetime DEFAULT NULL COMMENT '制单日期',
  `examuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `examdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约用箱单主表';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='港口管理';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `orgid` bigint(20) DEFAULT NULL COMMENT '客户id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT '提单号',
  `shipname` varchar(20) DEFAULT NULL COMMENT '船名',
  `flight` varchar(50) DEFAULT NULL COMMENT '航次',
  `portid` bigint(20) DEFAULT NULL COMMENT '港口',
  `boxqty` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT '提箱场站',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '目的地',
  `bgntakedate` datetime DEFAULT NULL COMMENT '计划开始日期',
  `endtakedate` datetime DEFAULT NULL COMMENT '计划截止日期',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `billstatus` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `makedate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约用箱';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `regionalcode` varchar(50) DEFAULT NULL COMMENT '上级区域编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域管理表';
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
INSERT INTO `res_org_bk2` VALUES (1,'市政府部门主要领导',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'市政府部门分管领导',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'市政府部门办公室主任',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'市应急办',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'市主要应急联动单位应急科室负责人',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'24小时值班电话',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'各镇(街道、园区)主要领导',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'各镇(街道、园区)分管领导',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'各镇(街道、园区)党委秘书',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'各镇(街道、园区)24小时值班电话',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `res_org_bk2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job`
--

DROP TABLE IF EXISTS `schedule_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job`
--

LOCK TABLES `schedule_job` WRITE;
/*!40000 ALTER TABLE `schedule_job` DISABLE KEYS */;
INSERT INTO `schedule_job` VALUES (1,'testTask','test','renren','0 0/30 * * * ?',0,'有参数测试','2016-12-01 23:16:46'),(2,'testTask','test2',NULL,'0 0/30 * * * ?',1,'无参数测试','2016-12-03 14:55:56');
/*!40000 ALTER TABLE `schedule_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job_log`
--

DROP TABLE IF EXISTS `schedule_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(20) DEFAULT NULL COMMENT '中文名称',
  `enname` varchar(20) DEFAULT NULL COMMENT '英文名称',
  `region` bigint(20) DEFAULT NULL COMMENT '所属区域',
  `uncode` varchar(50) DEFAULT NULL COMMENT 'UN代码',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `company` bigint(20) DEFAULT NULL COMMENT '所属船公司',
  `coscode` varchar(50) DEFAULT NULL COMMENT 'COS代码',
  `cosshipenname` varchar(20) DEFAULT NULL COMMENT 'COS船英文名',
  `country` varchar(20) DEFAULT NULL COMMENT '所属国家',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人 ',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `route` varchar(100) DEFAULT NULL COMMENT '航线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='船公司';
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
  `enshipname` varchar(20) DEFAULT NULL COMMENT '英文船名',
  `chshipname` varchar(20) DEFAULT NULL COMMENT '中文船名',
  `expvoyage` varchar(50) DEFAULT NULL COMMENT '出口航次',
  `Impvoyage` varchar(50) DEFAULT NULL COMMENT '进口航次',
  `arrivalstate` varchar(50) DEFAULT NULL COMMENT '到港状态',
  `arrivaldate` datetime DEFAULT NULL COMMENT '预计到港日期',
  `shipid` varchar(20) DEFAULT NULL COMMENT '船舶呼号',
  `imono` varchar(50) DEFAULT NULL COMMENT 'IMO编号',
  `dockcode` varchar(50) DEFAULT NULL COMMENT '码头代码',
  `dockname` varchar(50) DEFAULT NULL COMMENT '码头名称',
  `dockunit` varchar(50) DEFAULT NULL COMMENT '靠泊单位',
  `route` varchar(50) DEFAULT NULL COMMENT '航线',
  `arrivaltime` datetime DEFAULT NULL COMMENT '预计到港时间',
  `leavetime` datetime DEFAULT NULL COMMENT '预计离港时间',
  `shipment` varchar(20) DEFAULT NULL COMMENT '船期',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='船舶计划表';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='仓库管理';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `serialno` bigint(20) DEFAULT NULL COMMENT '序号',
  `lineid` bigint(20) DEFAULT NULL COMMENT '线路',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `weighttype` varchar(50) DEFAULT NULL COMMENT '空重类型：0-空箱 1-重箱',
  `boxprice` double DEFAULT NULL COMMENT '应收单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓储合同明细';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `orgid` bigint(20) DEFAULT NULL COMMENT '客户',
  `paytype` varchar(10) DEFAULT NULL COMMENT '付款方式',
  `boctid` bigint(20) DEFAULT NULL COMMENT '币别',
  `rate` double DEFAULT NULL COMMENT '汇率',
  `taxrate` double DEFAULT NULL COMMENT '税率',
  `takeboxfee` double DEFAULT NULL COMMENT '放箱费单价',
  `takeboxfeetax` double DEFAULT NULL COMMENT '放箱费含税单价',
  `bgndate` datetime DEFAULT NULL COMMENT '生效日期',
  `enddate` datetime DEFAULT NULL COMMENT '失效日期',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `billstatus` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：作废',
  `makeuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `makedate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓储合同';
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
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';
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
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   ',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'dfd',0,0),(2,1,'sdfasd',0,0),(3,2,'fsdfd',0,0),(4,0,'sdf',1,0),(5,0,'asdfasdf',1,0),(6,0,'dgdf',1,0),(7,0,'fsdfg',1,0),(8,0,'sdfgsd',1,0),(10,0,'测试',1,0),(11,0,'dfghdgh',1,0),(12,0,'dfghdfg',1,0),(13,0,'fgdghjgh',1,0),(14,0,'eee',1,0),(15,0,'rrr',1,0);
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
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,'admin','修改密码','com.ruanchuangsoft.platform.controller.SysUserController.password()','\"admin\"','0:0:0:0:0:0:0:1','2017-04-04 22:24:27'),(2,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:35:14'),(3,'admin','查询请假','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:35:17'),(4,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:35:27'),(5,'admin','查询请假','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:36:23'),(6,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:34'),(7,'admin','查询请假','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:36'),(8,'admin','修改请假','com.ruanchuangsoft.platform.controller.LeaveworkController.update()','{\"endTime\":\"2017-04-13\",\"leaveId\":1,\"leavetype\":2,\"name\":\"admin\",\"reason\":\"fffasdfa测试gggg\",\"startTime\":\"2017-04-04\",\"userId\":1}','0:0:0:0:0:0:0:1','2017-04-04 22:40:41'),(9,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:42'),(10,'admin','查询请假','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:47'),(11,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:40:49'),(12,'admin','查询请假','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:44:32'),(13,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:47:21'),(14,'admin','查询请假','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-04 22:47:23'),(15,'admin','修改请假','com.ruanchuangsoft.platform.controller.LeaveworkController.update()','{\"endTime\":\"2017-04-25\",\"leaveId\":1,\"leavetype\":2,\"name\":\"admin\",\"reason\":\"fffasdfa测试gggg\",\"startTime\":\"2017-04-04\",\"userId\":1}','0:0:0:0:0:0:0:1','2017-04-04 22:47:30'),(16,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:47:31'),(17,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 22:49:14'),(18,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 23:14:20'),(19,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 23:15:26'),(20,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 23:18:02'),(21,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-04 23:19:06'),(22,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 01:09:56'),(23,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 01:10:07'),(24,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 01:12:41'),(25,'lidongfeng','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-28\",\"leavetype\":1,\"name\":\"lidongfeng\",\"reason\":\"dddddddd\",\"startTime\":\"2017-04-10\"}','0:0:0:0:0:0:0:1','2017-04-05 01:12:58'),(26,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 10:59:30'),(27,'admin','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-19\",\"leavetype\":1,\"name\":\"lidongfeng\",\"reason\":\"dfdfdfdfd\",\"startTime\":\"2017-04-11\"}','0:0:0:0:0:0:0:1','2017-04-05 11:00:08'),(28,'admin','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-19\",\"leavetype\":1,\"name\":\"lidongfeng\",\"reason\":\"dfdfdfdfd\",\"startTime\":\"2017-04-11\"}','0:0:0:0:0:0:0:1','2017-04-05 11:21:28'),(29,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-05 11:38:37'),(30,'admin','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-13\",\"leavetype\":1,\"reason\":\"eeeeeeee\",\"startTime\":\"2017-04-04\"}','0:0:0:0:0:0:0:1','2017-04-05 11:39:01'),(31,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-11 12:55:55'),(32,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-11 16:53:18'),(33,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-11 16:57:54'),(34,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 15:23:02'),(35,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:02:35'),(36,'lidongfeng','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-26\",\"leavetype\":1,\"reason\":\"fgfgf\",\"startTime\":\"2017-04-05\"}','0:0:0:0:0:0:0:1','2017-04-14 17:03:00'),(37,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:03:17'),(38,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:14:54'),(39,'lidongfeng','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-20\",\"leavetype\":1,\"reason\":\"sfsdf\",\"startTime\":\"2017-04-05\"}','0:0:0:0:0:0:0:1','2017-04-14 17:15:10'),(40,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:15:21'),(41,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:34:48'),(42,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:35:27'),(43,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:40:55'),(44,'zongjingli','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-14 17:49:28'),(45,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 20:59:39'),(46,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 21:01:46'),(47,'zongjingli','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 21:02:12'),(48,'zongjingli','查询请假','com.ruanchuangsoft.platform.controller.LeaveworkController.info()','1','0:0:0:0:0:0:0:1','2017-04-15 21:02:26'),(49,'zongjingli','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 21:02:31'),(50,'renshi','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-15 21:09:01'),(51,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:58:40'),(52,'admin','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-12\",\"leavetype\":1,\"reason\":\"sdfsd\",\"startTime\":\"2017-04-04\"}','0:0:0:0:0:0:0:1','2017-04-18 11:58:53'),(53,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:58:58'),(54,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:00'),(55,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:00'),(56,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:01'),(57,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:02'),(58,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:03'),(59,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:03'),(60,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:03'),(61,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:04'),(62,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:04'),(63,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:04'),(64,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:18'),(65,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 11:59:25'),(66,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 12:12:29'),(67,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 15:35:35'),(68,'lidongfeng','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-13\",\"leavetype\":0,\"reason\":\"jjjj\",\"startTime\":\"2017-04-11\"}','0:0:0:0:0:0:0:1','2017-04-18 15:37:23'),(69,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 15:38:05'),(70,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 15:44:20'),(71,'lidongfeng','保存请假','com.ruanchuangsoft.platform.controller.LeaveworkController.save()','{\"endTime\":\"2017-04-06\",\"leavetype\":1,\"reason\":\"kkkk\",\"startTime\":\"2017-04-11\"}','0:0:0:0:0:0:0:1','2017-04-18 15:44:32'),(72,'lidongfeng','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-18 15:50:00'),(73,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-20 23:17:52'),(74,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-20 23:29:21'),(75,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 13:07:11'),(76,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 14:41:13'),(77,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 14:43:03'),(78,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 15:14:32'),(79,'admin','查询请假列表','com.ruanchuangsoft.platform.controller.LeaveworkController.list()','1','0:0:0:0:0:0:0:1','2017-04-21 17:31:26');
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
  `menu_id` varchar(50) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1670 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1466,'system','0','系统管理',NULL,NULL,0,'fa fa-cog',0),(1467,'user','system','人员管理','sys/user.html',NULL,1,'fa fa-user',1),(1468,'role','system','角色管理','sys/role.html',NULL,1,'fa fa-user-secret',2),(1469,'menu','system','菜单管理','sys/menu.html',NULL,1,'fa fa-th-list',3),(1470,'dept','system','部门管理','sys/dept/index',NULL,1,'fa fa-th-list',3),(1471,'druid','system','SQL监控','druid/sql.html',NULL,1,'fa fa-bug',4),(1472,'config','system','参数管理','sys/config.html','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'fa fa-sun-o',6),(1473,'log','system','系统日志','sys/log.html','sys:log:list',1,'fa fa-file-text-o',7),(1474,'oss','system','文件上传','sys/oss.html','sys:oss:all',1,'fa fa-file-image-o',6),(1475,'generator','system','代码生成器','sys/generator.html','sys:generator:list,sys:generator:code',1,'fa fa-rocket',7),(1476,'user_view','user','查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(1477,'user_add','user','新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(1478,'user_edit','user','修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(1479,'user_delete','user','删除',NULL,'sys:user:delete',2,NULL,0),(1480,'role_view','role','查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(1481,'role_add','role','新增',NULL,'sys:role:save,sys:menu:perms',2,NULL,0),(1482,'role_edit','role','修改',NULL,'sys:role:update,sys:menu:perms',2,NULL,0),(1483,'role_delete','role','删除',NULL,'sys:role:delete',2,NULL,0),(1484,'menu_view','menu','查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(1485,'menu_add','menu','新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(1486,'menu_edit','menu','修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(1487,'menu_delete','menu','删除',NULL,'sys:menu:delete',2,NULL,0),(1488,'dept_view','dept','查看',NULL,'sys:dept:list,sys:dept:info',2,NULL,0),(1489,'dept_add','dept','新增',NULL,'sys:dept:save,sys:dept:select',2,NULL,0),(1490,'dept_edit','dept','修改',NULL,'sys:dept:update,sys:dept:select',2,NULL,0),(1491,'dept_delete','dept','删除',NULL,'sys:dept:delete',2,NULL,0),(1492,'base','0','基础资料',NULL,NULL,0,'fa fa-folder',0),(1493,'region','base','区域管理','region/index',NULL,1,'fa fa-circle-o',1),(1494,'boxs','base','箱型管理','boxs/index',NULL,1,'fa fa-circle-o',1),(1495,'transline','base','线路管理','transline/index',NULL,1,'fa fa-circle-o',1),(1496,'transline_view','transline','查看',NULL,'transline:list,transline:info',2,NULL,0),(1497,'transline_add','transline','新增',NULL,'transline:save,transline:select',2,NULL,0),(1498,'transline_edit','transline','修改',NULL,'transline:update,transline:select',2,NULL,0),(1499,'transline_delete','transline','删除',NULL,'transline:delete',2,NULL,0),(1500,'transline_audit','transline','审核',NULL,'transline:shenhe,transline:select',2,NULL,0),(1501,'transline_detail','transline','明细',NULL,'transline:list,transline:info',2,NULL,0),(1502,'organization','base','组织管理','organization/index',NULL,1,'fa fa-circle-o',1),(1503,'organization_view','organization','查看',NULL,'organization:list,organization:info',2,NULL,0),(1504,'organization_add','organization','新增',NULL,'organization:save,organization:select',2,NULL,0),(1505,'organization_edit','organization','修改',NULL,'organization:update,organization:select',2,NULL,0),(1506,'organization_delete','organization','删除',NULL,'organization:delete',2,NULL,0),(1507,'transteam','base','车队管理','transteam/index',NULL,1,'fa fa-circle-o',1),(1508,'transteam_view','transteam','查看',NULL,'transteam:list,transteam:info',2,NULL,0),(1509,'transteam_add','transteam','新增',NULL,'transteam:save,transteam:select',2,NULL,0),(1510,'transteam_edit','transteam','修改',NULL,'transteam:update,transteam:select',2,NULL,0),(1511,'transteam_delete','transteam','删除',NULL,'transteam:delete',2,NULL,0),(1512,'place','base','地点管理','place/index',NULL,1,'fa fa-circle-o',1),(1513,'place_view','place','查看',NULL,'place:list,place:info',2,NULL,0),(1514,'place_add','place','新增',NULL,'place:save,place:select',2,NULL,0),(1515,'place_edit','place','修改',NULL,'place:update,place:select',2,NULL,0),(1516,'place_delete','place','删除',NULL,'place:delete',2,NULL,0),(1517,'place_audit','place','审核',NULL,'place:shenhe,place:select',2,NULL,0),(1518,'place_detail','place','明细',NULL,'place:list,place:info',2,NULL,0),(1519,'ship','base','船公司','ship/index',NULL,1,'fa fa-circle-o',1),(1520,'ship_view','ship','查看',NULL,'ship:list,ship:info',2,NULL,0),(1521,'ship_add','ship','新增',NULL,'ship:save,ship:select',2,NULL,0),(1522,'ship_edit','ship','修改',NULL,'ship:update,ship:select',2,NULL,0),(1523,'ship_delete','ship','删除',NULL,'ship:delete',2,NULL,0),(1524,'ship_audit','ship','审核',NULL,'ship:shenhe,ship:select',2,NULL,0),(1525,'ship_detail','ship','明细',NULL,'ship:list,ship:info',2,NULL,0),(1526,'shipplan','base','船舶计划表','shipplan/index',NULL,1,'fa fa-circle-o',1),(1527,'shipplan_view','shipplan','查看',NULL,'shipplan:list,shipplan:info',2,NULL,0),(1528,'shipplan_add','shipplan','新增',NULL,'shipplan:save,shipplan:select',2,NULL,0),(1529,'shipplan_edit','shipplan','修改',NULL,'shipplan:update,shipplan:select',2,NULL,0),(1530,'shipplan_delete','shipplan','删除',NULL,'shipplan:delete',2,NULL,0),(1531,'shipplan_audit','shipplan','审核',NULL,'shipplan:shenhe,shipplan:select',2,NULL,0),(1532,'shipplan_detail','shipplan','明细',NULL,'shipplan:list,shipplan:info',2,NULL,0),(1533,'store','base','仓库管理','store/index',NULL,1,'fa fa-circle-o',1),(1534,'store_view','store','查看',NULL,'store:list,store:info',2,NULL,0),(1535,'store_add','store','新增',NULL,'store:save,store:select',2,NULL,0),(1536,'store_edit','store','修改',NULL,'store:update,store:select',2,NULL,0),(1537,'store_delete','store','删除',NULL,'store:delete',2,NULL,0),(1538,'store_audit','store','审核',NULL,'store:shenhe,store:select',2,NULL,0),(1539,'store_detail','store','明细',NULL,'store:list,store:info',2,NULL,0),(1540,'containeryard','base','堆场管理','containeryard/index',NULL,1,'fa fa-circle-o',1),(1541,'containeryard_view','containeryard','查看',NULL,'containeryard:list,containeryard:info',2,NULL,0),(1542,'containeryard_add','containeryard','新增',NULL,'containeryard:save,containeryard:select',2,NULL,0),(1543,'containeryard_edit','containeryard','修改',NULL,'containeryard:update,containeryard:select',2,NULL,0),(1544,'containeryard_delete','containeryard','删除',NULL,'containeryard:delete',2,NULL,0),(1545,'containeryard_audit','containeryard','审核',NULL,'containeryard:shenhe,containeryard:select',2,NULL,0),(1546,'containeryard_detail','containeryard','明细',NULL,'containeryard:list,containeryard:info',2,NULL,0),(1547,'baseopbank','base','银行表','baseopbank/index',NULL,1,'fa fa-circle-o',1),(1548,'baseopbank_view','baseopbank','查看',NULL,'baseopbank:list,baseopbank:info',2,NULL,0),(1549,'baseopbank_add','baseopbank','新增',NULL,'baseopbank:save,baseopbank:select',2,NULL,0),(1550,'baseopbank_edit','baseopbank','修改',NULL,'baseopbank:update,baseopbank:select',2,NULL,0),(1551,'baseopbank_delete','baseopbank','删除',NULL,'baseopbank:delete',2,NULL,0),(1552,'baseopbank_audit','baseopbank','审核',NULL,'baseopbank:shenhe,baseopbank:select',2,NULL,0),(1553,'baseopbank_detail','baseopbank','明细',NULL,'baseopbank:list,baseopbank:info',2,NULL,0),(1554,'port','base','港口管理','port/index',NULL,1,'fa fa-circle-o',1),(1555,'port_view','port','查看',NULL,'port:list,port:info',2,NULL,0),(1556,'port_add','port','新增',NULL,'port:save,port:select',2,NULL,0),(1557,'port_edit','port','修改',NULL,'port:update,port:select',2,NULL,0),(1558,'port_delete','port','删除',NULL,'port:delete',2,NULL,0),(1559,'port_audit','port','审核',NULL,'port:shenhe,port:select',2,NULL,0),(1560,'port_detail','port','明细',NULL,'port:list,port:info',2,NULL,0),(1561,'drivers','base','司机管理','drivers/index',NULL,1,'fa fa-circle-o',1),(1562,'drivers_view','drivers','查看',NULL,'drivers:list,drivers:info',2,NULL,0),(1563,'drivers_add','drivers','新增',NULL,'drivers:save,drivers:select',2,NULL,0),(1564,'drivers_edit','drivers','修改',NULL,'drivers:update,drivers:select',2,NULL,0),(1565,'drivers_delete','drivers','删除',NULL,'drivers:delete',2,NULL,0),(1566,'drivers_audit','drivers','审核',NULL,'drivers:shenhe,drivers:select',2,NULL,0),(1567,'drivers_detail','drivers','明细',NULL,'drivers:list,drivers:info',2,NULL,0),(1568,'factory','base','工厂管理','factory/index',NULL,1,'fa fa-circle-o',1),(1569,'factory_view','factory','查看',NULL,'factory:list,factory:info',2,NULL,0),(1570,'factory_add','factory','新增',NULL,'factory:save,factory:select',2,NULL,0),(1571,'factory_edit','factory','修改',NULL,'factory:update,factory:select',2,NULL,0),(1572,'factory_delete','factory','删除',NULL,'factory:delete',2,NULL,0),(1573,'factory_audit','factory','审核',NULL,'factory:shenhe,factory:select',2,NULL,0),(1574,'factory_detail','factory','明细',NULL,'factory:list,factory:info',2,NULL,0),(1575,'buss','0','业务管理',NULL,NULL,0,'fa fa-folder',0),(1576,'emptymain','buss','空箱计划','emptymain/index',NULL,1,'fa fa-circle-o',1),(1577,'emptymain_view','emptymain','查看',NULL,'emptymain:list,emptymain:info',2,NULL,0),(1578,'emptymain_add','emptymain','新增',NULL,'emptymain:save,emptymain:select',2,NULL,0),(1579,'emptymain_edit','emptymain','修改',NULL,'emptymain:update,emptymain:select',2,NULL,0),(1580,'emptymain_delete','emptymain','删除',NULL,'emptymain:delete',2,NULL,0),(1581,'emptymain_takebox','emptymain','放箱',NULL,'emptymain:takebox,emptymain:update,emptymain:select',2,NULL,0),(1582,'emptymain_audit','emptymain','审核',NULL,'emptymain:shenhe,emptymain:select',2,NULL,0),(1583,'emptymain_detail','emptymain','明细',NULL,'emptymain:list,emptymain:info',2,NULL,0),(1584,'factorymain','buss','门点计划','factorymain/index',NULL,1,'fa fa-circle-o',1),(1585,'factorymain_view','factorymain','查看',NULL,'factorymain:list,factorymain:info',2,NULL,0),(1586,'factorymain_add','factorymain','新增',NULL,'factorymain:save,factorymain:select',2,NULL,0),(1587,'factorymain_edit','factorymain','修改',NULL,'factorymain:update,factorymain:select',2,NULL,0),(1588,'factorymain_delete','factorymain','删除',NULL,'factorymain:delete',2,NULL,0),(1589,'factorymain_audit','factorymain','审核',NULL,'factorymain:shenhe,factorymain:select',2,NULL,0),(1590,'factorymain_detail','factorymain','明细',NULL,'factorymain:list,factorymain:info',2,NULL,0),(1591,'heavymain','buss','重箱计划','heavymain/index',NULL,1,'fa fa-circle-o',1),(1592,'heavymain_view','heavymain','查看',NULL,'heavymain:list,heavymain:info',2,NULL,0),(1593,'heavymain_add','heavymain','新增',NULL,'heavymain:save,heavymain:select',2,NULL,0),(1594,'heavymain_edit','heavymain','修改',NULL,'heavymain:update,heavymain:select',2,NULL,0),(1595,'heavymain_delete','heavymain','删除',NULL,'heavymain:delete',2,NULL,0),(1596,'heavymain_audit','heavymain','审核',NULL,'heavymain:shenhe,heavymain:select',2,NULL,0),(1597,'heavymain_detail','heavymain','明细',NULL,'heavymain:list,heavymain:info',2,NULL,0),(1598,'preemptymain','preemptymain','预约用箱','preemptymain/index',NULL,1,'fa fa-circle-o',1),(1599,'preemptymain_view','preemptymain','查看',NULL,'preemptymain:list,preemptymain:info',2,NULL,0),(1600,'preemptymain_add','preemptymain','新增',NULL,'preemptymain:save,preemptymain:select',2,NULL,0),(1601,'preemptymain_edit','preemptymain','修改',NULL,'preemptymain:update,preemptymain:select',2,NULL,0),(1602,'preemptymain_delete','preemptymain','删除',NULL,'preemptymain:delete',2,NULL,0),(1603,'preemptymain_audit','preemptymain','审核',NULL,'preemptymain:shenhe,preemptymain:select',2,NULL,0),(1604,'preemptymain_detail','preemptymain','明细',NULL,'preemptymain:list,preemptymain:info',2,NULL,0),(1605,'leaveportmain','buss','疏港计划','leaveportmain/index',NULL,1,'fa fa-circle-o',1),(1606,'leaveportmain_view','leaveportmain','查看',NULL,'leaveportmain:list,leaveportmain:info',2,NULL,0),(1607,'leaveportmain_add','leaveportmain','新增',NULL,'leaveportmain:save,leaveportmain:select',2,NULL,0),(1608,'leaveportmain_edit','leaveportmain','修改',NULL,'leaveportmain:update,leaveportmain:select',2,NULL,0),(1609,'leaveportmain_delete','leaveportmain','删除',NULL,'leaveportmain:delete',2,NULL,0),(1610,'leaveportmain_audit','leaveportmain','审核',NULL,'leaveportmain:shenhe,leaveportmain:select',2,NULL,0),(1611,'leaveportmain_detail','leaveportmain','明细',NULL,'leaveportmain:list,leaveportmain:info',2,NULL,0),(1612,'takeboxmain','buss','放箱计划','takeboxmain/index',NULL,1,'fa fa-circle-o',1),(1613,'takeboxmain_view','takeboxmain','查看',NULL,'takeboxmain:list,takeboxmain:info',2,NULL,0),(1614,'takeboxmain_add','takeboxmain','新增',NULL,'takeboxmain:save,takeboxmain:select',2,NULL,0),(1615,'takeboxmain_edit','takeboxmain','修改',NULL,'takeboxmain:update,takeboxmain:select',2,NULL,0),(1616,'takeboxmain_delete','takeboxmain','删除',NULL,'takeboxmain:delete',2,NULL,0),(1617,'takeboxmain_audit','takeboxmain','审核',NULL,'takeboxmain:shenhe,takeboxmain:select',2,NULL,0),(1618,'takeboxmain_detail','takeboxmain','明细',NULL,'takeboxmain:list,takeboxmain:info',2,NULL,0),(1619,'transboxmain','buss','运输计划','transboxmain/index',NULL,1,'fa fa-circle-o',1),(1620,'transboxmain_view','transboxmain','查看',NULL,'transboxmain:list,transboxmain:info',2,NULL,0),(1621,'transboxmain_add','transboxmain','新增',NULL,'transboxmain:save,transboxmain:select',2,NULL,0),(1622,'transboxmain_edit','transboxmain','修改',NULL,'transboxmain:update,transboxmain:select',2,NULL,0),(1623,'transboxmain_delete','transboxmain','删除',NULL,'transboxmain:delete',2,NULL,0),(1624,'transboxmain_audit','transboxmain','审核',NULL,'transboxmain:shenhe,transboxmain:select',2,NULL,0),(1625,'transboxmain_detail','transboxmain','明细',NULL,'transboxmain:list,transboxmain:info',2,NULL,0),(1626,'finance','0','财务管理',NULL,NULL,0,'fa fa-folder',0),(1627,'accountcategory','finance','预算科目','accountcategory/index',NULL,1,'fa fa-circle-o',1),(1628,'budgetform','finance','预算计划','budgetform/index',NULL,1,'fa fa-circle-o',1),(1629,'costrequest','finance','费用申请','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1630,'expense','finance','报销管理','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1631,'entertain','finance','招待费申请','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1632,'accountcategory_view','accountcategory','查看',NULL,'accountcategory:list,accountcategory:info',2,NULL,0),(1633,'accountcategory_add','accountcategory','新增',NULL,'accountcategory:save,accountcategory:select',2,NULL,0),(1634,'accountcategory_edit','accountcategory','修改',NULL,'accountcategory:update,accountcategory:select',2,NULL,0),(1635,'accountcategory_delete','accountcategory','删除',NULL,'accountcategory:delete',2,NULL,0),(1636,'budgetform_view','budgetform','查看',NULL,'budgetform:list,budgetform:info',2,NULL,0),(1637,'budgetform_add','budgetform','新增',NULL,'budgetform:save,budgetform:select',2,NULL,0),(1638,'budgetform_edit','budgetform','修改',NULL,'budgetform:update,budgetform:select',2,NULL,0),(1639,'budgetform_delete','budgetform','删除',NULL,'budgetform:delete',2,NULL,0),(1640,'budgetform_audit','budgetform','审核',NULL,'budgetform:shenhe,budgetform:select',2,NULL,0),(1641,'budgetform_detail','budgetform','明细',NULL,'budgetform:list,budgetform:info',2,NULL,0),(1642,'askbill','finance','请购单','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1643,'buybill','finance','订购单','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1644,'paybill','finance','付款单','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1645,'askbill_view','askbill','查看',NULL,'plankongxiangmain:list,plankongxiangmain:info',2,NULL,0),(1646,'askbill_add','askbill','新增',NULL,'plankongxiangmain:save,plankongxiangmain:select',2,NULL,0),(1647,'askbill_edit','askbill','修改',NULL,'plankongxiangmain:update,plankongxiangmain:select',2,NULL,0),(1648,'askbill_delete','askbill','删除',NULL,'plankongxiangmain:delete',2,NULL,0),(1649,'askbill_audit','askbill','审核',NULL,'plankongxiangmain:shenhe,plankongxiangmain:select',2,NULL,0),(1650,'buybill_view','buybill','查看',NULL,'plankongxiangmain:list,plankongxiangmain:info',2,NULL,0),(1651,'buybill_add','buybill','新增',NULL,'plankongxiangmain:save,plankongxiangmain:select',2,NULL,0),(1652,'buybill_edit','buybill','修改',NULL,'plankongxiangmain:update,plankongxiangmain:select',2,NULL,0),(1653,'buybill_delete','buybill','删除',NULL,'plankongxiangmain:delete',2,NULL,0),(1654,'buybill_audit','buybill','审核',NULL,'plankongxiangmain:shenhe,plankongxiangmain:select',2,NULL,0),(1655,'paybill_view','paybill','查看',NULL,'plankongxiangmain:list,plankongxiangmain:info',2,NULL,0),(1656,'paybill_add','paybill','新增',NULL,'plankongxiangmain:save,plankongxiangmain:select',2,NULL,0),(1657,'paybill_edit','paybill','修改',NULL,'plankongxiangmain:update,plankongxiangmain:select',2,NULL,0),(1658,'paybill_delete','paybill','删除',NULL,'plankongxiangmain:delete',2,NULL,0),(1659,'paybill_audit','paybill','审核',NULL,'plankongxiangmain:shenhe,plankongxiangmain:select',2,NULL,0),(1660,'contract','0','合同管理',NULL,NULL,0,'fa fa-folder',0),(1661,'buycontract','contract','采购合同','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1662,'rentcontract','contract','租赁合同','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1663,'shipcontract','contract','船东合同','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1664,'storecontract','contract','仓储客户合同','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1665,'transcontract','contract','运输合同','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1666,'mataincontract','contract','机械维修合同','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1),(1667,'88','0','日常工作',NULL,NULL,0,'fa fa-folder',0),(1668,'89','88','待办事项','todulist/index',NULL,1,'fa fa-circle-o',1),(1669,'90','88','考勤管理','plankongxiangmain/index',NULL,1,'fa fa-circle-o',1);
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
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'总经理','总经理','2017-03-25 17:06:15'),(2,'人事经理','人事经理','2017-03-25 17:06:26'),(3,'员工',NULL,'2017-04-05 01:11:16');
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
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(50) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
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
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统用户';
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
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `serialno` bigint(20) DEFAULT NULL COMMENT '序号',
  `transcompanyid` bigint(20) DEFAULT NULL COMMENT '运输公司',
  `startplaceid1` bigint(20) DEFAULT NULL COMMENT '原起运地点',
  `startplaceid2` bigint(20) DEFAULT NULL COMMENT '现起运点',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '目的地',
  `boxno` varchar(50) DEFAULT NULL COMMENT '箱号',
  `fengno` varchar(50) DEFAULT NULL COMMENT '铅封号',
  `plantaketime` datetime DEFAULT NULL COMMENT '计划提箱时间',
  `realtaketime` datetime DEFAULT NULL COMMENT '实际提箱时间',
  `planarrvetime` datetime DEFAULT NULL COMMENT '计划到场时间',
  `realarrvetime` datetime DEFAULT NULL COMMENT '实际到场时间',
  `yingshou` double DEFAULT NULL COMMENT '应收费用',
  `yingfu` double DEFAULT NULL COMMENT '应付费用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='放箱计划明细表';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `refbillno` varchar(50) DEFAULT NULL COMMENT '参照单据号',
  `refbilltype` int(11) DEFAULT NULL COMMENT '参照单据类型:0:无参照  1-空箱计划  2:重箱计划  3:门点计划 4:司机预约',
  `orgid` bigint(20) DEFAULT NULL COMMENT '客户id',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT '提单号',
  `shipname` varchar(20) DEFAULT NULL COMMENT '船名',
  `flight` varchar(50) DEFAULT NULL COMMENT '航次',
  `portid` bigint(20) DEFAULT NULL COMMENT '港口',
  `boxqty` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT '提箱场站',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '目的地',
  `bgnshipdate` datetime DEFAULT NULL COMMENT '集港时间',
  `endshipdate` datetime DEFAULT NULL COMMENT '截港时间',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT '最早到场时间',
  `endplanarrtime` datetime DEFAULT NULL COMMENT '最晚到场时间',
  `yingshou` double DEFAULT NULL COMMENT '应收费用',
  `yingfu` double DEFAULT NULL COMMENT '应付费用',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `billstatus` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `makedate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='放箱计划';
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
  `title` varchar(50) DEFAULT NULL COMMENT '待办名称',
  `todotype` int(11) DEFAULT NULL COMMENT '待办类型',
  `billdate` datetime DEFAULT NULL COMMENT '创建日期',
  `billdata` text COMMENT '业务数据',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `todourl` varchar(500) DEFAULT NULL COMMENT '功能路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办事项';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `serialno` bigint(20) DEFAULT NULL COMMENT '序号',
  `transcompanyid` bigint(20) DEFAULT NULL COMMENT '运输公司',
  `refbillno` varchar(50) DEFAULT NULL COMMENT '放箱计划单据号',
  `refserialno` bigint(20) DEFAULT NULL COMMENT '放箱计划序号',
  `startplaceid1` bigint(20) DEFAULT NULL COMMENT '原起运地点',
  `startplaceid2` bigint(20) DEFAULT NULL COMMENT '现起运点',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '目的地',
  `lineid` bigint(20) DEFAULT NULL COMMENT '线路',
  `boxno` varchar(50) DEFAULT NULL COMMENT '箱号',
  `fengno` varchar(50) DEFAULT NULL COMMENT '铅封号',
  `wendu` varchar(50) DEFAULT NULL COMMENT '温度',
  `plantaketime` datetime DEFAULT NULL COMMENT '计划提箱时间',
  `realtaketime` datetime DEFAULT NULL COMMENT '实际提箱时间',
  `planarrvetime` datetime DEFAULT NULL COMMENT '计划到场时间',
  `realarrvetime` datetime DEFAULT NULL COMMENT '实际到场时间',
  `carno` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `cartype` varchar(20) DEFAULT NULL COMMENT '车型',
  `driversid` bigint(20) DEFAULT NULL COMMENT '司机编码',
  `driversname` varchar(20) DEFAULT NULL COMMENT '司机姓名',
  `feein` double DEFAULT NULL COMMENT '应收费用',
  `feeout` double DEFAULT NULL COMMENT '应付费用',
  `profit` double DEFAULT NULL COMMENT '利润',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输计划明细表';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `refbillno` varchar(50) DEFAULT NULL COMMENT '参照单据号',
  `refbilltype` int(11) DEFAULT NULL COMMENT '参照单据类型:0:无参照  1-放箱计划  2:重箱计划  3:门点计划 4:司机预约',
  `orgid` bigint(20) DEFAULT NULL COMMENT '客户',
  `ladingcode` varchar(50) DEFAULT NULL COMMENT '提单号',
  `shipname` varchar(20) DEFAULT NULL COMMENT '船名',
  `flight` varchar(50) DEFAULT NULL COMMENT '航次',
  `portid` bigint(20) DEFAULT NULL COMMENT '港口',
  `boxqty` bigint(20) DEFAULT NULL COMMENT '箱量',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `takeboxplaceid` bigint(20) DEFAULT NULL COMMENT '提箱场站',
  `endplaceid` bigint(20) DEFAULT NULL COMMENT '目的地',
  `bgnshipdate` datetime DEFAULT NULL COMMENT '集港时间',
  `endshipdate` datetime DEFAULT NULL COMMENT '截港时间',
  `bgnplanarrtime` datetime DEFAULT NULL COMMENT '最早到场时间',
  `endplanarrtime` datetime DEFAULT NULL COMMENT '最晚到场时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `billstatus` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `makedate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输计划';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `serialno` bigint(20) DEFAULT NULL COMMENT '序号',
  `lineid` bigint(20) DEFAULT NULL COMMENT '线路',
  `boxtype` varchar(50) DEFAULT NULL COMMENT '箱型',
  `weighttype` varchar(50) DEFAULT NULL COMMENT '空重类型：0-空箱 1-重箱',
  `boxprice` double DEFAULT NULL COMMENT '应付单价',
  `boxpricetax` double DEFAULT NULL COMMENT '含税应付单价',
  `cartype` varchar(20) DEFAULT NULL COMMENT '车型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输合同明细';
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
  `billno` varchar(50) DEFAULT NULL COMMENT '单据号',
  `orgid` bigint(20) DEFAULT NULL COMMENT '客户',
  `paytype` varchar(10) DEFAULT NULL COMMENT '付款方式',
  `boctid` bigint(20) DEFAULT NULL COMMENT '币别',
  `rate` double DEFAULT NULL COMMENT '汇率',
  `taxrate` double DEFAULT NULL COMMENT '税率',
  `bgndate` datetime DEFAULT NULL COMMENT '生效日期',
  `enddate` datetime DEFAULT NULL COMMENT '失效日期',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `billstatus` varchar(50) DEFAULT NULL COMMENT '单据状态:0：新增 1：审核 2：作废',
  `makeuser` varchar(20) DEFAULT NULL COMMENT '制单人',
  `makedate` datetime DEFAULT NULL COMMENT '制单日期',
  `accuser` varchar(20) DEFAULT NULL COMMENT '审核人',
  `accdate` datetime DEFAULT NULL COMMENT '审核日期',
  `uptdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输合同';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `startlocation` bigint(20) DEFAULT NULL COMMENT '起始地点',
  `endlocation` bigint(20) DEFAULT NULL COMMENT '结束地点',
  `distance` double DEFAULT NULL COMMENT '距离',
  `helpcode` varchar(200) DEFAULT NULL COMMENT '助记码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线路管理';
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
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `vehicle_type` varchar(20) DEFAULT NULL COMMENT '车辆类型（挂靠、自营、外协）',
  `billing_information` varchar(1000) DEFAULT NULL COMMENT '开票信息',
  `account_information` varchar(1000) DEFAULT NULL COMMENT '账户信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='车队管理';
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
