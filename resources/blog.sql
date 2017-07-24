drop database if exists blog;

create database blog;

use blog;

create table user
(
	id				bigint	not null				auto_increment					comment '用户id',
	username		varchar(30)														comment '用户名',
	password		varchar(30)														comment '密码',

	realname		varchar(30)														comment '真实姓名',
	gender			varchar(5)														comment '性别',
	birthday		date															comment '出生日期',
	mobile			varchar(20)														comment '联系方式',
	email			varchar(30)														comment '电子邮箱',
	address			varchar(255)													comment '地址',
	city			varchar(50)														comment '城市',
	province		varchar(50)														comment '省份',
	create_date		datetime														comment '注册日期',

	role			int																comment '角色',
	constraint		pk_user							primary key(id),
	constraint		uq_username						unique(username)
) comment '用户表';

create table topic
(
	id				bigint	not null				auto_increment					comment '分类id',
	topic_name		varchar(80)														comment '分类',
	
	constraint		pk_topic						primary key(id)
) comment '分类表';

create table article
(
	id					bigint	not null			auto_increment					comment '文章id',
	
	title				varchar(255)												comment '文章标题',
	author				varchar(30)													comment '作者，默认是用户名，可修改',
	content				longtext													comment '内容',
	create_date			datetime													comment '发表日期',
	promotion			int															comment '推荐',
	hot					int															comment '热门',
	top					int															comment '置顶',
	
	slug				varchar(80)													comment '友好URL',
	meta_keywords		varchar(255)												comment 'SEO元数据keyword',
	meta_description	varchar(1024)												comment 'SEO元数据description',
	
	topic_id			bigint not null												comment '分类id',
	user_id				bigint not null												comment '博主id',
	
	constraint			pk_article				primary key(id),
	constraint			fk_article_topic		foreign key(topic_id)				references topic(id),
	constraint			fk_article_user			foreign key(user_id)				references user(id)
) comment '文章表';

create table comment
(
	id				bigint not null				auto_increment						comment '用户id',
	author			varchar(30)														comment '作者',
	content			text															comment '内容',
	create_date		datetime														comment '发表日期',

	article_id		bigint not null													comment '文章id',
	constraint		pk_comment					primary key(id),
	constraint		fk_comment_article			foreign key(article_id)				references article(id)
) comment '评论表';

insert into user(username, password, realname, city) values ('admin', 'admin_888', '管理员', '郑州');
insert into user(username, password, realname, city) values ('bxy', 'bxy_888', '白向阳', '郑州');
insert into user(username, password, realname, city) values ('lhr', 'lhr_888', '刘洪润', '郑州');
insert into user(username, password, realname, city) values ('xmh', 'xmh_888', '夏美华', '郑州');

insert into topic(topic_name) values ('Java');
insert into topic(topic_name) values ('前端');
insert into topic(topic_name) values ('数据库');
insert into topic(topic_name) values ('框架');
insert into topic(topic_name) values ('Linux');
insert into topic(topic_name) values ('非技术专区');
