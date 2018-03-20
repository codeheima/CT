/*CREATE TABLE if not EXISTS `res_current` (
  `ID` varchar(32) NOT NULL DEFAULT '',
  `CAPTURE_TIME` int(16) NOT NULL,
  `TITLE` varchar(64) DEFAULT NULL,
  `SUB_TITLE` varchar(64) DEFAULT NULL,
  `STATUS` int(2) DEFAULT NULL COMMENT '1 正常 2 异常  3 其他',
  `DES` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;*/


/**CREATE TABLE if not EXISTS `res_send` (
  `ID` varchar(32) NOT NULL DEFAULT '',
  `WAY` varchar(64) DEFAULT NULL,
  `KEY` varchar(256) DEFAULT NULL,
  `SEND_TIME` int(16) DEFAULT NULL,
  `TASK_ID` varchar(128) DEFAULT NULL,
  `TASK_STATUS` int(2) DEFAULT NULL COMMENT '1 查询中 2 查询失败 3 查询成功',
  `SEND_PARAM` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;*/


--聊天记录
CREATE TABLE if not EXISTS `data_im_chat` (
  `SEND_ID` varchar(32) DEFAULT NULL,
  `APP_TYPE` varchar(12) DEFAULT NULL COMMENT '软件类型 1030036 微信',
  `ACTION` varchar(2) DEFAULT NULL COMMENT '聊天类型 1 私聊 , 13 群聊',
  `GROUP_ID` varchar(64) DEFAULT NULL COMMENT '群id',
  `SEND_TIME` varchar(64) DEFAULT NULL COMMENT '发送时间',
  `FROM_ID` varchar(64) DEFAULT NULL,
  `FROM_USERNAME` varchar(128) DEFAULT NULL,
  `TO_ID` varchar(64) DEFAULT NULL,
  `TO_USERNAME` varchar(128) DEFAULT NULL,
  `CHAT_TYPE` varchar(4) DEFAULT NULL COMMENT '聊天类型',
  `CONTEXT` varchar(2048) DEFAULT NULL COMMENT '聊天内容',
  `MAIN_FILE` varchar(256) DEFAULT NULL COMMENT '附件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






-- 系统配置管理
/**EATE TABLE if not EXISTS `ct_param` (
 `ID` varchar(32) NOT NULL DEFAULT '',
  `KEY` varchar(64) DEFAULT NULL,
  `VAL` varchar(256) DEFAULT NULL,
  `DES` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;*/



-- 存放附件 ， 防止重复下载
CREATE TABLE if not EXISTS `ct_access` (
  `UUID` varchar(32) DEFAULT '' COMMENT '附件的UUID',
  `URL` varchar(256) DEFAULT NULL COMMENT 'URL',
  `CAPTURE_TIME` int(16) NOT NULL,
  `MAIN_FILE` varchar(256) DEFAULT NULL COMMENT '附件位置1',
   PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not EXISTS `res_send_task` (
  `task_id` varchar(32) DEFAULT '' COMMENT '任务id',
  `key_Word` varchar(256) DEFAULT NULL COMMENT '关键字',
  `create_time` varchar(64) NOT NULL,
  `case_Type` varchar(256) DEFAULT NULL COMMENT '所属案件',
  `last_Time` varchar(64) DEFAULT NULL COMMENT '关键字最后一次爬取时间',
  `create_reason` varchar(64) DEFAULT NULL COMMENT '查询事由',
  `TASK_STATUS` int(2) DEFAULT NULL COMMENT ' 0 初始状态1 查询中 2 查询失败 3 查询成功',
   PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not EXISTS `res_case_type` (
  `case_id` varchar(32) DEFAULT '' COMMENT '事由类型',
  `case_value` varchar(32) DEFAULT '' COMMENT '事由名称',
   PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

