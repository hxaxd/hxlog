# Python 后端开发

## 参考资料

* 官方文档 - ... - 5

## Pydantic

* 定义模型, 以供类型检查
* 模型还具有许多高级特性, 例如:
    * 模板
    * 动态创建
    * const
    * 默认值

```python
from pydantic import BaseModel


class User(BaseModel):
    id: int # 类型
    name: str = 'Jane Doe' # 默认值
    key = Column(String(63), unique=True) # 从实例属性中获取类型


user = User(id='123', name='John Doe')
User.model_validate({'id': 123, 'name': 'John Doe'}) # 类型检查
User.model_validate_json('{"id": 123, "name": "John Doe"}') # 类型检查
User.model_dump() # 转换为字典
User.model_dump_json() # 转换为 json
```

## FastAPI

* 依赖 OpenAPI 与 Pydantic 库实现
    * 数据验证
    * 自动生成文档
* 可使用 `async` 与 `await` 实现异步

## mysql-connector-python

* 一个 mysql 数据库的 python 驱动程序
* 几乎是 sql 语句的一对一实现

## SQLAlchemy

* 一个 ORM 框架, 在连接库上抽象了操作接口
* 

## Uvicorn

* 基于 ASGI 协议的异步 web 服务器 (不同于 WSGI)

```shell
uvicorn filename:objname # 启动服务器

# --reload 热重载
# --port 端口
# --host IP
# --workers 进程数
# --log-level 日志级别
# --log-config 日志文件位置
# --ssl-keyfile=SSL密钥文件 --ssl-certfile=SSL证书文件
```
