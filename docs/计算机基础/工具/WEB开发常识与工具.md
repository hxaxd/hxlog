## 前端常识

### [HTML](https://developer.mozilla.org/zh-CN/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax)

- 标签
- 属性
- 元信息,字符编码/作者/图标/标题...
- 头中可以放css/js
- p/h1-h6/ul/ol/li/em/strong
- span/div
- main存放每个页面独有的内容。
- article包围的内容即一篇文章，与页面其他部分无关
- section 与 article 类似，但 section 更适用于组织页面使其按功能（比如迷你地图、一组文章标题和摘要）分块
- aside包含一些间接信息（术语条目、作者简介、相关链接，等等）
- header 是简介形式的内容。如果它是 body 的子元素，那么就是网站的全局页眉。如果它是article 或section 的子元素，那么它是这些部分特有的页眉
- nav 包含页面主导航功能。其中不应包含二级链接等内容
- footer 包含了页面的页脚部分
- br 换行/hr分界线
- img(图片) 属性 src/alt/width/height
- abbr 缩写
- dl包括dt(标题)/dd(描述) 描述型文本
- address 地址
- sub/sup 下标/上标
- code 代码,pre 保留格式,var 变量,kbd 键盘输入,samp 输出
- time 时间
- a的href属性 超链接 可以链接#id 跳转到页面内的某个位置
- blockquote 块引用 q 内联引用
- table 表格 包含tr(行)/td(单元格)/th(表头)/caption(标题)
- thead/tbody/tfoot 表头/表体/表脚 在外围再包上

基本结构

```html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>二次元俱乐部</title>
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Sonsie+One"
      rel="stylesheet" />
    <link
      href="https://fonts.googleapis.com/css?family=ZCOOL+KuaiLe"
      rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
  </head>

  <body>
    <header>
      <!-- 本站所有网页的统一主标题 -->
      <h1>聆听电子天籁之音</h1>
    </header>

    <nav>
      <!-- 本站统一的导航栏 -->
      <ul>
        <li><a href="#">主页</a></li>
        <!-- 共 n 个导航栏项目，省略…… -->
      </ul>

      <form>
        <!-- 搜索栏是站点内导航的一个非线性的方式。 -->
        <input type="search" name="q" placeholder="要搜索的内容" />
        <input type="submit" value="搜索" />
      </form>
    </nav>

    <main>
      <!-- 网页主体内容 -->
      <article>
        <!-- 此处包含一个 article（一篇文章），内容略…… -->
      </article>

      <aside>
        <!-- 侧边栏在主内容右侧 -->
        <h2>相关链接</h2>
        <ul>
          <li><a href="#">这是一个超链接</a></li>
          <!-- 侧边栏有 n 个超链接，略略略…… -->
        </ul>
      </aside>
    </main>

    <footer>
      <!-- 本站所有网页的统一页脚 -->
      <p>© 2050 某某保留所有权利</p>
    </footer>
  </body>
</html>
```

### CSS

### JS

### TS

### VUE

## 后端常识

- api

## 数据库管理工具

### Navicat

略

### DBeaver

略

## 接口测试

### postman

- 依赖其图形界面,你可以方便的进行接口测试,并将测试结果导出为html格式的报告
- 可以编写js文件,构造错误请求,进行接口测试
- 你可以创建测试集合,将多个接口测试放在一个集合中,方便管理
- 可以隔离环境,并定义环境变量

除此之外,postman还有很多功能,比如CI/CD,协作,api网络(与他人共享)等,没意义

### bruno

离线的轻量的与postman哲学一致的接口测试工具

### nginx

nginx是一个开源的WEB服务器，它可以作为负载均衡器,缓存服务器,反向代理服务器等角色使用

反向代理的作用是将客户端的请求转发给后端的服务器，然后将后端服务器的响应返回给客户端。这样可以实现负载均衡(多个实际服务器)，并隐藏后端服务器的IP地址

负载均衡的算法:
- 轮询法（默认方法)每个请求按时间顺序逐一分配到不同的后端服务器
- weight权重模式（加权轮询)用于后端服务器性能不均情况
- ip_hash：上述方式存在重定位另一个服务器，其登录信息将会丢失的问题  
我们可以采用ip_hash指令解决这个问题,每个请求按访问ip的hash结果分配固定访问一个后端服务器

nginx可以实现动静分离

配置文件:conf目录下的nginx.conf，默认配置的nginx监听的端口为80

常用命令

```bash
cd /usr/local/nginx/sbin/
./nginx  启动
./nginx -s stop  停止
./nginx -s quit  安全退出
./nginx -s reload  重新加载配置文件  如果我们修改了配置文件，就需要重新加载。
ps aux|grep nginx  查看nginx进程
```

若无法访问,可能是防火墙没有开启端口

```bash
# 开启service firewalld start
# 重启service firewalld restart
# 关闭service firewalld stop
# 查看防火墙规则firewall-cmd --list-all
# 查询端口是否开放firewall-cmd --query-port=8080/tcp
# 开放80端口firewall-cmd --permanent --add-port=80/tcp
# 移除端口firewall-cmd --permanent --remove-port=8080/tcp#重启防火墙(修改配置后要重启防火墙)firewall-cmd --reload
# 参数解释1、firwall-cmd：是Linux提供的操作firewall的一个工具；2、--permanent：表示设置为持久；3、--add-port：标识添加的端口；

```

## Docker

- 映像是一个只读的模板,包含了容器运行所需的内容,包括代码、运行时、库、环境变量和配置文件 
- 仓库是一个集中存放映像的地方,类似于代码仓库,其中可以存放多个映像 
- 容器是一个运行中的映像实例,它可以被创建、启动、停止、删除等操作 

依赖Docker容器化的特性,其有如下使用场景

- 通过Docker来运行开发者在公有仓库上分享的映像,避免了配置环境 
- 开发时需要验证非本地环境,避免了在生产环境中出现问题,使用Docker模拟
- 在实际生产中利用Docker来构建和部署服务,避免了手动配置和部署的过程 

### 运行容器

强烈建议使用Docker Desktop来运行容器,图形化的界面就是爽

**- `docker pull name`**
用于从 Docker 仓库拉取镜像

**- `docker run name`**
创建并启动一个新的容器  
-d 后台  
-p 指定端口  

**- `docker images`**
列出本地已有的镜像 

**- `docker ps`**
查看正在运行的容器  
-a 显示所有容器,包括终止的容器

**- `docker start id`**
启动已停止的容器

**- `docker stop id`**
停止正在运行的容器

**- `docker rm name/id`**
删除容器  
-f 强制

**- `docker rmi name`**
删除本地镜像  
-f 强制

### 构建容器

写一个Dockerfile文件,然后使用`docker build -t name .`来构建镜像

```Dockerfile
FROM	指定基础镜像，用于后续的指令构建。
MAINTAINER	指定Dockerfile的作者/维护者。（已弃用，推荐使用LABEL指令）
LABEL	添加镜像的元数据，使用键值对的形式。
RUN	在构建过程中在镜像中执行命令。
CMD	指定容器创建时的默认命令。（可以被覆盖）
ENTRYPOINT	设置容器创建时的主要命令。（不可被覆盖）
EXPOSE	声明容器运行时监听的特定网络端口。
ENV	在容器内部设置环境变量。
ADD	将文件、目录或远程URL复制到镜像中。
COPY	将文件或目录复制到镜像中。
VOLUME	为容器创建挂载点或声明卷。
WORKDIR	设置后续指令的工作目录。
USER	指定后续指令的用户上下文。
ARG	定义在构建过程中传递给构建器的变量，可使用 "docker build" 命令设置。
ONBUILD	当该镜像被用作另一个构建过程的基础时，添加触发器。
STOPSIGNAL	设置发送给容器以退出的系统调用信号。
HEALTHCHECK	定义周期性检查容器健康状态的命令。
SHELL	覆盖Docker中默认的shell，用于RUN、CMD和ENTRYPOINT指令。
```

## k8s

## CI/CD

## 服务器运维管理工具

### 1panel

- 其可以一键部署各种应用(docker)
- 管理界面清晰简单