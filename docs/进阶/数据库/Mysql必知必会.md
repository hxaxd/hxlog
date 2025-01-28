- MySQL必知必会 跟前作几乎一样,仅记录区别,单拿出来比前作强 4

### 使用MySQL

- MySQL除了本体外,还提供了命令行工具,图形化工具(不好用),以及数据库管理工具
  - 当然,本质上都是SQL语句
- 想要使用这些工具必须连接到MySQL,需要指定
  - 主机名(本地是localhost)
  - 端口号(默认是3306)
  - 用户名(数据库可以创建不同权限的用户)
  - 密码(可以没有)
- 下面列举一些图形化界面工具使用的语句(全没用!!!)

```sql
SHOW DATABASES; -- 查看所有数据库

SHOW TABLES; -- 查看当前数据库中的所有表

SHOW COLUMNS FROM table_name; -- 查看表的所有列
DESCRIBE table_name; -- 同上

SHOW STATUS; -- 查看数据库的状态

SHOW CREATE TABLE table_name; -- 查看表的创建语句
SHOW CREATE DATABASE database_name; -- 查看数据库的创建语句

SHOW GRANTS; -- 查看用户的权限

SHOW ERRORS; -- 查看错误信息
SHOW WARNINGS; -- 查看警告信息
```

### 