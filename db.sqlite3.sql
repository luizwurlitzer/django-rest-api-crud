BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "escola_aluno" (
	"id"	integer NOT NULL,
	"nome"	varchar(30) NOT NULL,
	"rg"	varchar(9) NOT NULL,
	"cpf"	varchar(11) NOT NULL,
	"dtNascimento"	date NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "escola_curso" (
	"id"	integer NOT NULL,
	"codigoCurso"	varchar(10) NOT NULL,
	"descricao"	varchar(100) NOT NULL,
	"nivel"	varchar(1) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "escola_matricula" (
	"id"	integer NOT NULL,
	"periodo"	varchar(1) NOT NULL,
	"aluno_id"	bigint NOT NULL,
	"curso_id"	bigint NOT NULL,
	FOREIGN KEY("curso_id") REFERENCES "escola_curso"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("aluno_id") REFERENCES "escola_aluno"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-07-11 14:09:49.546663');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-07-11 14:09:49.575684');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-07-11 14:09:49.627714');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-07-11 14:09:49.643535');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-07-11 14:09:49.661528');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2022-07-11 14:09:49.683595');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2022-07-11 14:09:49.699596');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2022-07-11 14:09:49.742995');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2022-07-11 14:09:49.757912');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2022-07-11 14:09:49.773161');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2022-07-11 14:09:49.781584');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2022-07-11 14:09:49.794665');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2022-07-11 14:09:49.813120');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2022-07-11 14:09:49.860553');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2022-07-11 14:09:49.878125');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2022-07-11 14:09:49.890128');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2022-07-11 14:09:49.905751');
INSERT INTO "django_migrations" VALUES (18,'escola','0001_initial','2022-07-11 14:09:49.945738');
INSERT INTO "django_migrations" VALUES (19,'sessions','0001_initial','2022-07-11 14:09:49.960901');
INSERT INTO "django_migrations" VALUES (20,'escola','0002_rename_codigo_curso_curso_codigocurso','2022-07-11 14:24:26.665227');
INSERT INTO "django_migrations" VALUES (21,'escola','0003_matricula','2022-07-11 17:42:50.893645');
INSERT INTO "django_admin_log" VALUES (1,'2022-07-11 14:20:40.183088','1','teste','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2022-07-11 14:20:59.713958','1','Alunoteste','[{"changed": {"fields": ["Nome"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (3,'2022-07-11 14:24:33.901338','1','dawdwada','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2022-07-11 14:24:51.121748','1','XABLAU DESC','[{"changed": {"fields": ["CodigoCurso", "Descricao"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (5,'2022-07-11 14:59:48.671935','2','aluno teste ok','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2022-07-11 17:46:02.400501','1','Matricula object (1)','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2022-07-11 17:57:02.471252','2','Matricula object (2)','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2022-07-11 17:57:09.902729','1','Matricula object (1)','[]',9,1,2);
INSERT INTO "django_admin_log" VALUES (9,'2022-07-11 19:15:17.926868','3','Matricula object (3)','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2022-07-11 19:15:31.393046','4','Matricula object (4)','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (11,'2022-07-11 19:34:43.799512','5','Matricula object (5)','[{"added": {}}]',9,1,1);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'escola','aluno');
INSERT INTO "django_content_type" VALUES (8,'escola','curso');
INSERT INTO "django_content_type" VALUES (9,'escola','matricula');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_aluno','Can add aluno');
INSERT INTO "auth_permission" VALUES (26,7,'change_aluno','Can change aluno');
INSERT INTO "auth_permission" VALUES (27,7,'delete_aluno','Can delete aluno');
INSERT INTO "auth_permission" VALUES (28,7,'view_aluno','Can view aluno');
INSERT INTO "auth_permission" VALUES (29,8,'add_curso','Can add curso');
INSERT INTO "auth_permission" VALUES (30,8,'change_curso','Can change curso');
INSERT INTO "auth_permission" VALUES (31,8,'delete_curso','Can delete curso');
INSERT INTO "auth_permission" VALUES (32,8,'view_curso','Can view curso');
INSERT INTO "auth_permission" VALUES (33,9,'add_matricula','Can add matricula');
INSERT INTO "auth_permission" VALUES (34,9,'change_matricula','Can change matricula');
INSERT INTO "auth_permission" VALUES (35,9,'delete_matricula','Can delete matricula');
INSERT INTO "auth_permission" VALUES (36,9,'view_matricula','Can view matricula');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$320000$eXkrlcT0ytsFoJYEFAiygf$eDWtU6uSslOC/FeHWBJpTqd3WVTzLRo6LhNcyzVUnSo=','2022-07-12 21:00:10.892954',1,'luiz','','luizwurlitzer@gmail.com',1,1,'2022-07-11 14:19:43.984265','');
INSERT INTO "escola_aluno" VALUES (1,'Alunoteste','123456488','06571165139','2022-07-11');
INSERT INTO "escola_aluno" VALUES (2,'aluno teste ok','231321312','03656565656','2022-07-11');
INSERT INTO "escola_curso" VALUES (1,'XBLAU','XABLAU DESC','B');
INSERT INTO "escola_curso" VALUES (2,'XBLAU02','NOVO TESTE JAVA VRAU','A');
INSERT INTO "escola_curso" VALUES (3,'dkwjalkd','dwadwadwa','A');
INSERT INTO "escola_curso" VALUES (4,'d3jalkd','dwawadwa','I');
INSERT INTO "escola_curso" VALUES (5,'d3ajalkd','dwawaadwa','I');
INSERT INTO "django_session" VALUES ('ygmem7x9kq1jwd6bq0mca8x43jn4um0a','.eJxVjMsOwiAQRf-FtSGFDgVcuvcbyAwzStVA0sfK-O-2SRe6Pefc-1YJ16WkdZYpjazOyqjTLyPMT6m74AfWe9O51WUaSe-JPuysr43ldTnav4OCc9nWbgi9l0jsYugYAgfALhIS9Sh8sxFJYg4WPPiNWLHIrhuMswAxG1CfL-yNN9o:1oAuGS:15UHRZ3pEs3ert74s0N4coMVOmm-zGPkyQtZVELLcCw','2022-07-25 14:19:56.603031');
INSERT INTO "django_session" VALUES ('18p53814dfd9a9pi2817o8il9k7d729n','.eJxVjMsOwiAQRf-FtSGFDgVcuvcbyAwzStVA0sfK-O-2SRe6Pefc-1YJ16WkdZYpjazOyqjTLyPMT6m74AfWe9O51WUaSe-JPuysr43ldTnav4OCc9nWbgi9l0jsYugYAgfALhIS9Sh8sxFJYg4WPPiNWLHIrhuMswAxG1CfL-yNN9o:1oBMzK:zVFGQJJ2pdpkvP1jNFeETUoa6vblPMjTrmKiLRnBIbI','2022-07-26 21:00:10.902870');
INSERT INTO "escola_matricula" VALUES (1,'M',1,1);
INSERT INTO "escola_matricula" VALUES (2,'V',2,3);
INSERT INTO "escola_matricula" VALUES (3,'N',1,1);
INSERT INTO "escola_matricula" VALUES (4,'N',1,2);
INSERT INTO "escola_matricula" VALUES (5,'N',2,1);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "escola_matricula_aluno_id_522b62c6" ON "escola_matricula" (
	"aluno_id"
);
CREATE INDEX IF NOT EXISTS "escola_matricula_curso_id_80562398" ON "escola_matricula" (
	"curso_id"
);
COMMIT;
