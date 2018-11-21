DROP TABLE IF EXISTS POKEMONS CASCADE;
DROP TABLE IF EXISTS TYPES CASCADE;
DROP TABLE IF EXISTS QUALITIES CASCADE;
DROP TABLE IF EXISTS SKILLS CASCADE;
DROP TABLE IF EXISTS TRICKS CASCADE;
DROP TABLE IF EXISTS TYPEMATRIX CASCADE;

CREATE TABLE POKEMONS (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  zukan_no int(5) NOT NULL COMMENT '図鑑No',
  sub_no int(2) NOT NULL COMMENT 'サブNo',
  name varchar(20) NOT NULL COLLATE utf8mb4_bin COMMENT '名前',
  type_id1 int(4) NOT NULL COMMENT '属性1',
  type_id2 int(4) COMMENT '属性2',
  quality_id1 int(4) COMMENT '特性1',
  quality_id2 int(4) COMMENT '特性2',
  dream_quality_id int(4) COMMENT '夢特性',
  hp int(4) COMMENT '種族値-HP',
  at int(4) COMMENT '種族値-攻撃',
  df int(4) COMMENT '種族値-防御',
  sa int(4) COMMENT '種族値-特攻',
  sd int(4) COMMENT '種族値-特防',
  sp int(4) COMMENT '種族値-素早さ',
  mega_flg int(1) DEFAULT 0 NOT NULL COMMENT 'メガシンカFLG',
  delete_flg int(1) DEFAULT 0 NOT NULL COMMENT '削除FLG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT 'ポケモン基本情報';

CREATE TABLE TYPES (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  type_id int(4) NOT NULL COMMENT '属性',
  type_name1 varchar(10) NOT NULL COLLATE utf8mb4_bin COMMENT '属性名-ひらがな',
  type_name2 varchar(10) NOT NULL COLLATE utf8mb4_bin COMMENT '属性名-漢字',
  delete_flg int(1) DEFAULT 0 NOT NULL COMMENT '削除FLG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT '属性';

CREATE TABLE QUALITIES (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  quality_id int(4) NOT NULL COMMENT '特性ID',
  quality_name varchar(10) COLLATE utf8mb4_bin COMMENT '特性名',
  effect varchar(200) COLLATE utf8mb4_bin COMMENT '効果',
  delete_flg int(1) DEFAULT 0 NOT NULL COMMENT '削除FLG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT '特性';

CREATE TABLE SKILLS (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  skill_id int(4) NOT NULL COMMENT '技ID',
  skill_name varchar(30) NOT NULL COLLATE utf8mb4_bin COMMENT '技名',
  type_id int(4) COMMENT '属性ID',
  power int(4) COMMENT '威力',
  zpower int(4) COMMENT 'Z威力',
  pp int(4) COMMENT 'PP',
  classification varchar(10) COMMENT '分類',
  accuracy int(4) COMMENT '命中率',
  target int(4) COMMENT '対象',
  effect varchar(500) NOT NULL COLLATE utf8mb4_bin COMMENT '効果',  
  direct_attack varchar(10) COMMENT '直接攻撃',
  mamoru varchar(10) COMMENT 'まもる',
  delete_flg int(1) DEFAULT 0 NOT NULL COMMENT '削除FLG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT '技';

CREATE TABLE TRICKS (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  zukan_no int(5) NOT NULL COMMENT '図鑑No',
  skill_id int(4) NOT NULL COMMENT '技ID',
  delete_flg int(1) DEFAULT 0 NOT NULL COMMENT '削除FLG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT 'ポケモン別の覚える技';

CREATE TABLE TYPEMATRIX (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  type_id int(4) NOT NULL COMMENT '属性ID',
  target_type_id int(4) NOT NULL COMMENT '対象属性ID',
  aisho_flg int(1) NOT NULL COMMENT '相性フラグ',
  delete_flg int(1) DEFAULT 0 NOT NULL COMMENT '削除FLG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT '属性別相性';