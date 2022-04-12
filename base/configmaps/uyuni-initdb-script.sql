CREATE TABLE IF NOT EXISTS `TB_APPLICATION` (
  `ID` bigint(20) NOT NULL,
  `CONSTRUCTOR` varchar(255) DEFAULT NULL,
  `MOD_DATE` datetime(6) DEFAULT NULL,
  `MODIFIER` varchar(255) DEFAULT NULL,
  `REG_DATE` datetime(6) DEFAULT NULL,
  `ENDDATE` datetime(6) DEFAULT NULL,
  `GPUCOUNT` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  `IMAGENAME` varchar(255) DEFAULT NULL,
  `LIMITCPU` varchar(255) DEFAULT NULL,
  `LIMITMEM` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PORT` int(11) DEFAULT NULL,
  `REQUESTCPU` varchar(255) DEFAULT NULL,
  `REQUESTMEM` varchar(255) DEFAULT NULL,
  `STARTDATE` datetime(6) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `TB_ENV` (
  `ID` bigint(20) NOT NULL,
  `CONSTRUCTOR` varchar(255) DEFAULT NULL,
  `MOD_DATE` datetime(6) DEFAULT NULL,
  `MODIFIER` varchar(255) DEFAULT NULL,
  `REG_DATE` datetime(6) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `project_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `hibernate_sequence` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

CREATE TABLE `TB_PROJECT` (
  `ID` bigint(20) NOT NULL,
  `CONSTRUCTOR` varchar(255) DEFAULT NULL,
  `MOD_DATE` datetime(6) DEFAULT NULL,
  `MODIFIER` varchar(255) DEFAULT NULL,
  `REG_DATE` datetime(6) DEFAULT NULL,
  `ENDDATE` datetime(6) DEFAULT NULL,
  `GPUCOUNT` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  `IMAGENAME` varchar(255) DEFAULT NULL,
  `LIMITCPU` varchar(255) DEFAULT NULL,
  `LIMITMEM` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PORT` int(11) DEFAULT NULL,
  `REQUESTCPU` varchar(255) DEFAULT NULL,
  `REQUESTMEM` varchar(255) DEFAULT NULL,
  `STARTDATE` datetime(6) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `NODE_PORT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
