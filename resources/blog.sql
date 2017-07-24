drop database if exists blog;

create database blog;

use blog;

create table user
(
	id				bigint	not null				auto_increment					comment '用户id',
	username		varchar(30)														comment '用户名',
	password		varchar(30)														comment '密码',

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
	
	topic_id			bigint not null												comment '分类id',
	
	constraint			pk_article				primary key(id),
	constraint			fk_article_topic		foreign key(topic_id)				references topic(id)
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

insert into user(username, password) values ('admin', 'admin_888');
insert into user(username, password) values ('bxy', 'bxy_888');
insert into user(username, password) values ('lhr', 'lhr_888');

insert into topic(topic_name) values ('Java');
insert into topic(topic_name) values ('前端');
insert into topic(topic_name) values ('数据库');
insert into topic(topic_name) values ('框架');
insert into topic(topic_name) values ('Linux');
insert into topic(topic_name) values ('非技术专区');

/*
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
insert into article(title, author, content, create_date, topic_id) values ('java 入门', 'admin', 'java 入门', '2015-1-1', 1);
*/