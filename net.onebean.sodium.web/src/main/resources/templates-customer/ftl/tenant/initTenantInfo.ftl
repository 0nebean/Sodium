DROP TABLE IF EXISTS `sys_organization_${tenantId}`;

CREATE TABLE `sys_organization_${tenantId}` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增,非空',
`parent_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所有的父级IDs',
`parent_id` int(11) DEFAULT NULL COMMENT '父级机构id',
`is_root` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否根节点,字典:SF',
`is_delete` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否逻辑删除,字典:SF',
`org_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名',
`remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
`sort` int(5) DEFAULT NULL COMMENT '排序字段',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
`is_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除,0否1是',
`operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
`operator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert  into `sys_organization_${tenantId}`(`id`,`parent_ids`,`parent_id`,`is_root`,`is_delete`,`org_name`,`remark`,`sort`,`create_time`,`update_time`,`is_deleted`,`operator_id`,`operator_name`) values (1,NULL,NULL,'1','0','中国共产党全国代表大会','',0,'2018-03-06 00:44:01','2019-02-12 08:55:18','0',NULL,NULL),(17,'1',1,'0','0','中央委员会','中央委员会',1,'2018-03-14 15:50:56','2019-02-12 08:55:18','0',NULL,NULL),(22,'1',1,'0','0','中央纪律检查委员会','',0,'2018-03-14 15:56:53','2019-02-12 08:55:18','0',NULL,NULL),(23,'1,17',17,'0','0','中央军事委员会','',0,'2018-03-14 15:57:11','2019-02-12 08:55:18','0',NULL,NULL),(24,'1,17',17,'0','0','中央委员会总书记','',1,'2018-03-14 15:57:29','2019-02-12 08:55:18','0',NULL,NULL),(25,'1,17',17,'0','0','中央政治局常务委员会','',2,'2018-03-14 15:58:23','2019-02-12 08:55:18','0',NULL,NULL),(26,'1,17',17,'0','0','中央政治局','',3,'2018-03-14 15:58:43','2019-02-12 08:55:18','0',NULL,NULL),(27,'1,17',17,'0','0','中央书记处','',4,'2018-03-14 15:58:50','2019-02-12 08:55:18','0',NULL,NULL),(28,'1,17,27',27,'0','0','三级机构001','',0,'2018-04-10 00:53:50','2019-02-12 08:55:18','0',NULL,NULL),(29,'1,17,27,28',28,'0','0','四级机构001','',1,'2018-04-10 00:53:59','2019-02-12 08:55:18','0',NULL,NULL),(30,'1,17,27,28,29',29,'0','0','五级机构001','',0,'2018-04-10 00:54:17','2019-02-12 08:55:18','0',NULL,NULL),(31,'1,17,27,28,29,30',30,'0','0','六级机构001','',0,'2018-04-10 00:56:09','2019-02-12 08:55:18','0',NULL,NULL),(32,'1,17',31,'0','0','七级机构001','',0,'2018-04-10 00:56:20','2019-02-12 08:55:18','0',NULL,NULL);


DROP TABLE IF EXISTS `sys_permission_${tenantId}`;

CREATE TABLE `sys_permission_${tenantId}` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键,自增',
`name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单的权限标识',
`descritpion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '中文名称',
`url` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单的url',
`parent_ids` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所有的父级IDs',
`parent_id` int(11) DEFAULT NULL COMMENT '父级id',
`sort` int(5) DEFAULT NULL COMMENT '排序字段',
`remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
`menu_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单类型 字典:CDLX',
`is_root` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否是根目录',
`icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
`is_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除,0否1是',
`operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
`operator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert  into `sys_permission_${tenantId}`(`id`,`name`,`descritpion`,`url`,`parent_ids`,`parent_id`,`sort`,`remark`,`menu_type`,`is_root`,`icon`,`create_time`,`update_time`,`is_deleted`,`operator_id`,`operator_name`) values (1,'PERM_HOME','根目录','/',NULL,NULL,0,'','menu','1','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(3,'PERM_SYSTEM_SETTING','系统设置','','1',1,0,'系统设置菜单','menu','0','am-icon-gear','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(4,'PERM_USER','用户管理','/sysuser/preview','1,3',3,0,'用户管理','menu','0','am-icon-user','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(5,'PERM_ROLE','角色管理','/sysrole/preview','1,3',3,1,'角色管理','menu','0','am-icon-users','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(10,'PERM_PREMISSION','权限管理','/syspremission/preview','1,3',3,2,'','menu','0','am-icon-leaf','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(11,'PERM_ORG','机构管理','/sysorg/preview','1,3',3,3,'','menu','0','am-icon-bank','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(12,'PERM_DIC','字典管理','/dic/preview','1,3',3,4,'','menu','0','am-icon-buysellads','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(14,'PERM_DEMO','参考模板','','1',1,1,'','menu','0','am-icon-map-signs','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(15,'PERM_DEMO_FORM','表单','/demo/form','1,14',14,0,'','menu','0','am-icon-wpforms','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(16,'PERM_DEMO_RICHTEXT','富文本','/demo/richtext','1,14',14,1,'','menu','0','am-icon-amazon','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(17,'PERM_DEMO_CALENDAR','日历','/demo/calendar','1,14',14,2,'','menu','0','am-icon-calendar','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(18,'PERM_DEMO_TABLES','表格','/demo/tables','1,14',14,3,'','menu','0','am-icon-table','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(19,'PERM_DEMO_CHART','图表','/demo/chart','1,14',14,4,'','menu','0','am-icon-bar-chart','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(20,'PERM_DEMO_TABLE_LIST','文字列表','/demo/tablelist','1,14',14,5,'','menu','0','am-icon-file-excel-o','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(21,'PERM_DEMO_TABLE_LIST_IMG','图文列表','/demo/tablelistimg','1,14',14,6,'','menu','0','am-icon-file-image-o','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(22,'PERM_DEMO_UPLOAD','文件上传控件','/demo/upload','1,14',14,7,'','menu','0','am-icon-cloud-upload','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(23,'PERM_CODE_GENERATE','代码生成','','1',1,2,'','menu','0','am-icon-braille','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(24,'PERM_CODE_DATABASE_MODEL','数据库模型','/databasetable/preview','1,23',23,0,'','menu','0','am-icon-american-sign-language-interpreting','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(25,'PERM_DEMO_MEIZI','妹子UI','http://amazeui.org/','1,14',14,90,'','menu','0','am-icon-font-awesome','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(26,'PERM_DEMO_ART_TEMPLATE','艺术模板','http://aui.github.io/art-template/zh-cn/','1,14',14,91,'','menu','0','am-icon-gitlab','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(28,'PERM_DEMO_TREE','树选择器','/demo/tree','1,14',14,8,'','menu','0','am-icon-tree','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(29,'PERM_DEMO_DATAPICKER','日期选择','/demo/datapicker','1,14',14,9,'','menu','0','am-icon-calendar-check-o','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(31,'PERM_USER_EDIT','编辑用户','','1,3,4',4,0,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(32,'PERM_USER_VIEW','查看用户','','1,3,4',4,1,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(33,'PERM_USER_ADD','添加用户','','1,3,4',4,2,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(34,'PERM_USER_SAVE','保存用户','','1,3,4',4,3,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(35,'PERM_USER_LIST','用户列表数据','','1,3,4',4,4,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(36,'PERM_USER_PREVIEW','用户列表页面','','1,3,4',4,5,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(37,'PERM_USER_DELETE','删除用户','','1,3,4',4,6,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(40,'PERM_USER_FIND_BY_ORGID','根据机构查ID找用户','','1,3,4',4,9,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(41,'PERM_USER_BIND_ROLE','用户绑定角色','','1,3,4',4,10,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(42,'PERM_USER_RESET_PASSWORD','重置密码接口','','1,3,4',4,11,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(43,'PERM_ROLE_EDIT','编辑角色','','1,3,5',5,0,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(44,'PERM_ROLE_VIEW','查看角色','','1,3,5',5,1,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(45,'PERM_ROLE_ADD','添加角色','','1,3,5',5,2,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(46,'PERM_ROLE_SAVE','保存角色','','1,3,5',5,3,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(47,'PERM_ROLE_LIST','角色数据列表','','1,3,5',5,4,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(48,'PERM_ROLE_PREVIEW','角色列表页面','','1,3,5',5,5,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(49,'PERM_ROLE_DELETE','删除角色','','1,3,5',5,6,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(50,'PERM_ROLE_FIND_BY_USERID','根据用户ID用户ID角色','','1,3,5',5,7,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(51,'PERM_ROLE_FIND_BY_NAME','根据角色名查找角色','','1,3,5',5,8,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(52,'PERM_ROLE_ADD_ROLE_USER','添加角色用户绑定','','1,3,5',5,9,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(53,'PERM_ROLE_REMOVE_ROLE_USER','删除角色用户绑定','','1,3,5',5,10,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(54,'PERM_ROLE_BIND_PREMISSION','角色绑定权限','','1,3,5',5,11,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(55,'PERM_ORG_PREVIEW','机构列表页面','','1,3,11',11,0,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(56,'PERM_ORG_ADD','添加机构','','1,3,11',11,1,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(57,'PERM_ORG_VIEW','查看机构','','1,3,11',11,2,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(58,'PERM_ORG_EDIT','编辑机构','','1,3,11',11,3,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(59,'PERM_ORG_SAVE','保存机构','','1,3,11',11,5,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(60,'PERM_ORG_LIST','机构数据列表','','1,3,11',11,1,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(61,'PERM_ORG_DELETE','删除机构','','1,3,11',11,6,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(62,'PERM_ORG_TREE','异步机构树','','1,3,11',11,7,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(63,'PERM_ORG_ALL_TREE','同步机构树','','1,3,11',11,8,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(64,'PERM_ORG_ADD_CHILD','添加子节点','','1,3,11',11,9,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(65,'PERM_PREMISSION_PREVIEW','权限列表页面','','1,3,10',10,0,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(66,'PERM_PREMISSION_ADD','新增权限','','1,3,10',10,1,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(67,'PERM_PREMISSION_EDIT','编辑权限','','1,3,10',10,2,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(68,'PERM_PREMISSION_LIST','权限数据列表','','1,3,10',10,3,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(69,'PERM_PREMISSION_DELETE','删除权限','','1,3,10',10,4,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(70,'PERM_PREMISSION_MENU_TREE','异步权限树','','1,3,10',10,5,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(71,'PERM_PREMISSION_ALL_MENU_TREE','同步权限树','','1,3,10',10,6,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(73,'PERM_PREMISSION_GET_ROLE_PREM','获取角色的所有权限','','1,3,10',10,8,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(74,'PERM_PREMISSION_SAVE_ROLE_PREM','保存角色的权限','','1,3,5',5,12,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(75,'PERM_PREMISSION_IS_REPEAT','防止权限重复','','1,3,10',10,9,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(76,'PERM_PREMISSION_ADD_CHILD','添加子项','','1,3,10',10,10,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(77,'PERM_PREMISSION_SAVE','保存权限','','1,3,10',10,11,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(78,'PERM_PREMISSION_VIEW','查看权限','','1,3,10',10,12,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(79,'PERM_DIC_PREVIEW','字典管理列表页面','','1,3,12',12,0,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(80,'PERM_DIC_ADD','新增字典','','1,3,12',12,1,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(81,'PERM_DIC_VIEW','添加字典','','1,3,12',12,2,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(82,'PERM_DIC_EDIT','编辑字典','','1,3,12',12,3,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(83,'PERM_DIC_SAVE','保存字典','','1,3,12',12,4,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(84,'PERM_DIC_DELETE','删除字典','','1,3,12',12,5,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(85,'PERM_DIC_LIST','字典数据列表','','1,3,12',12,6,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(86,'PERM_DIC_GROUP','添加同组项','','1,3,12',12,7,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(87,'PERM_CODE_DATABASE_MODEL_PREVIEW','数据库模型列表页面','','1,23,24',24,0,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(88,'PERM_CODE_DATABASE_MODEL_LIST','数据库模型数据列表','','1,23,24',24,1,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(89,'PERM_CODE_DATABASE_MODEL_SELECT','数据库模型表选择页面','','1,23,24',24,2,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(90,'PERM_CODE_DATABASE_MODEL_DELETE','删除数据库模型','','1,23,24',24,3,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(91,'PERM_CODE_DATABASE_MODEL_EDIT','编辑数据库模型','','1,23,24',24,4,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(92,'PERM_CODE_DATABASE_MODEL_VIEW','查看数据库模型','','1,23,24',24,5,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(93,'PERM_CODE_DATABASE_MODEL_ADD','新增数据库模型','','1,23,24',24,6,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(94,'PERM_CODE_DATABASE_MODEL_SAVE','保存数据库模型','','1,23,24',24,7,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(95,'PERM_CODE_DATABASE_MODEL_GENERATE','生成数据库模型代码','','1,23,24',24,8,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL),(96,'PERM_CODE_DATABASE_MODEL_IS_REPEAT','数据库模型去重','','1,23,24',24,9,'','url','0','','2019-02-12 08:55:04','2019-02-12 08:55:04','0',NULL,NULL);


DROP TABLE IF EXISTS `sys_permission_role_${tenantId}`;

CREATE TABLE `sys_permission_role_${tenantId}` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`role_id` int(11) DEFAULT NULL,
`permission_id` int(11) DEFAULT NULL,
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
`is_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除,0否1是',
`operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
`operator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
PRIMARY KEY (`id`),
KEY `index_role_id` (`role_id`),
KEY `index_permission_id` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert  into `sys_permission_role_${tenantId}`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`,`is_deleted`,`operator_id`,`operator_name`) values (152,7,1,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(153,7,3,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(154,7,4,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(155,7,31,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(156,7,32,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(157,7,33,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(158,7,34,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(159,7,35,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(160,7,36,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(161,7,37,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(162,7,40,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(163,7,41,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL),(164,7,42,'2019-02-12 08:54:46','2019-02-12 08:54:46','0',NULL,NULL);


DROP TABLE IF EXISTS `sys_role_${tenantId}`;

CREATE TABLE `sys_role_${tenantId}` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键自增',
`name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色名',
`ch_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色中文名',
`is_delete` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否逻辑删除,字典:SF',
`is_lock` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否锁定,字典:SF',
`data_permission_level` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据权限,字典:SJQX',
`remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注信息',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
`is_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除,0否1是',
`operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
`operator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert  into `sys_role_${tenantId}`(`id`,`name`,`ch_name`,`is_delete`,`is_lock`,`data_permission_level`,`remark`,`create_time`,`update_time`,`is_deleted`,`operator_id`,`operator_name`) values (1,'ROLE_ADMIN','管理员角色','0','0','1','','2018-02-27 14:55:53','2019-02-12 08:54:11','0',NULL,NULL),(7,'ROLE_USER','普通用户','0','0','0','','2018-05-27 21:30:28','2019-02-12 08:54:11','0',NULL,NULL);


DROP TABLE IF EXISTS `sys_role_user_${tenantId}`;

CREATE TABLE `sys_role_user_${tenantId}` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`sys_user_id` int(11) DEFAULT NULL,
`sys_role_id` int(11) DEFAULT NULL,
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
`is_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除,0否1是',
`operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
`operator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert  into `sys_role_user_${tenantId}`(`id`,`sys_user_id`,`sys_role_id`,`create_time`,`update_time`,`is_deleted`,`operator_id`,`operator_name`) values (3,1,1,'2019-02-12 08:53:54','2019-02-12 08:53:54','0',NULL,NULL),(28,2,7,'2019-02-12 08:53:54','2019-02-12 08:53:54','0',NULL,NULL);


DROP TABLE IF EXISTS `sys_user_${tenantId}`;

CREATE TABLE `sys_user_${tenantId}` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
`username` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录名',
`password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
`icon` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
`org_id` int(11) DEFAULT NULL COMMENT '所属机构ID',
`real_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
`email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
`number` int(11) DEFAULT NULL COMMENT '工号',
`mobile` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
`is_lock` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否锁定,字典:SF',
`is_delete` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否逻辑删除,字典:SF',
`user_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户类型,字典:YHLX',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
`is_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除,0否1是',
`operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
`operator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert  into `sys_user_${tenantId}`(`id`,`username`,`password`,`icon`,`org_id`,`real_name`,`email`,`number`,`mobile`,`is_lock`,`is_delete`,`user_type`,`create_time`,`update_time`,`is_deleted`,`operator_id`,`operator_name`) values (1,'admin','403ba6c56682637d2c1387027121923ffbb7d63e81fb5dd99936e64643938896d3e16c632162d362','',32,'管理员','790751571@qq.com',1110,'15375697970','0','0','admin','2018-02-27 14:55:53','2019-02-13 08:13:35','0',NULL,NULL),(2,'user','dcbb464c3b2327ee96afb9db7ed1cc8ee72552e222951c9cd0b0902e21ad09e1a551fcee5d501525',NULL,29,'艾博','651765313@qq.com',111,'18196584811','0','0','user','2018-02-27 14:55:53','2019-02-12 08:50:25','0',NULL,NULL);





DROP FUNCTION IF EXISTS `getParentMenuIds_${tenantId}`;
CREATE FUNCTION `getParentMenuIds_${tenantId}`(childId VARCHAR(50)) RETURNS varchar(1000) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempPar VARCHAR(1000);
    SET sTemp = '';
    SET sTempPar =childId;
    WHILE sTempPar IS NOT NULL DO
        IF sTempPar != childId THEN
            IF sTemp = '' THEN
                SET sTemp = CONCAT('',sTempPar);
            ELSE
                SET sTemp = CONCAT(sTemp,',',sTempPar);
            END IF;
        END IF;
        SELECT GROUP_CONCAT(parent_id) INTO sTempPar FROM sys_permission_${tenantId} WHERE parent_id<>id AND FIND_IN_SET(id,sTempPar)>0;
    END WHILE;
    RETURN ReverseWordBy(sTemp,',');
END;




DROP FUNCTION IF EXISTS `getParentOrgIds_${tenantId}`;
CREATE FUNCTION `getParentOrgIds_${tenantId}`(childId VARCHAR(50)) RETURNS varchar(1000) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempPar VARCHAR(1000);
    SET sTemp = '';
    SET sTempPar =childId;
    WHILE sTempPar IS NOT NULL DO
        IF sTempPar != childId THEN
            IF sTemp = '' THEN
                SET sTemp = CONCAT('',sTempPar);
            ELSE
                SET sTemp = CONCAT(sTemp,',',sTempPar);
            END IF;
        END IF;
        SELECT GROUP_CONCAT(parent_id) INTO sTempPar FROM sys_organization_${tenantId} WHERE parent_id<>id AND FIND_IN_SET(id,sTempPar)>0;
    END WHILE;
    RETURN ReverseWordBy(sTemp,',');
END;