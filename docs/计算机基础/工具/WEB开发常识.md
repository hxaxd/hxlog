# WEB 开发常识

## 参考资料

* [GeekHour](https://space.bilibili.com/102438649) - 大量现代工具 = 5
* 官方文档 - ... - 5

## 数据库管理工具

### Navicat

### DBeaver

## 接口测试

### postman

* 依赖其图形界面, 你可以方便的进行接口测试, 并将测试结果导出为 html 格式的报告
* 可以编写 js 文件, 构造错误请求, 进行接口测试
* 你可以创建测试集合, 将多个接口测试放在一个集合中, 方便管理
* 可以隔离环境, 并定义环境变量

### bruno

* 离线的轻量的与 postman 哲学一致的接口测试工具

## Docker

* 映像是一个只读的模板, 包含了容器运行所需的内容, 包括代码 运行时 库 环境变量和配置文件
* 仓库是一个集中存放映像的地方, 类似于代码仓库, 其中可以存放多个映像
* 容器是一个运行中的映像实例, 它可以被创建 启动 停止 删除等操作

## 使用场景

* 通过 Docker 来运行开发者在公有仓库上分享的映像, 避免了配置环境
* 开发时需要验证非本地环境, 避免了在生产环境中出现问题, 使用 Docker 模拟
* 在实际生产中利用 Docker 来构建和部署服务, 避免了手动配置和部署的过程

### 运行容器

* 强烈建议使用 Docker Desktop 来运行容器, 图形化的界面就是爽

```shell
docker pull name
# 用于从 Docker 仓库拉取镜像

docker run name
# 创建并启动一个新的容器
# -d 后台
# -p 指定端口

docker images
# 列出本地已有的镜像

docker ps
# 查看正在运行的容器
# -a 显示所有容器, 包括终止的容器

docker start id
# 启动已停止的容器

docker stop id`
# 停止正在运行的容器

docker rm name/id
# 删除容器
 3-f 强制

docker rmi name
# 删除本地镜像
# -f 强制
```

### 构建容器

* 写一个 Dockerfile 文件, 然后使用 `docker build -t name .` 来构建镜像

```Dockerfile
FROM 指定基础镜像,用于后续的指令构建
MAINTAINER指定Dockerfile的作者/维护者 (已弃用,推荐使用LABEL指令)
LABEL 添加镜像的元数据,使用键值对的形式
RUN 在构建过程中在镜像中执行命令
CMD 指定容器创建时的默认命令 (可以被覆盖)
ENTRYPOINT设置容器创建时的主要命令 (不可被覆盖)
EXPOSE 声明容器运行时监听的特定网络端口
ENV 在容器内部设置环境变量
ADD 将文件 目录或远程URL复制到镜像中
COPY 将文件或目录复制到镜像中
VOLUME 为容器创建挂载点或声明卷
WORKDIR 设置后续指令的工作目录
USER 指定后续指令的用户上下文
ARG 定义在构建过程中传递给构建器的变量,可使用 "docker build" 命令设置
ONBUILD 当该镜像被用作另一个构建过程的基础时,添加触发器
STOPSIGNAL 设置发送给容器以退出的系统调用信号
HEALTHCHECK 定义周期性检查容器健康状态的命令
SHELL 覆盖Docker中默认的shell,用于RUN CMD和ENTRYPOINT指令
```

## k8s

### 组件

* `Node` 即是一台服务器, 可以是物理机也可以是虚拟机, 集群中有许多 `Node`
* `Pod` 运行在 `Node` 上, 是一组容器的集合, 一个 `Pod` 中所有的容器共享网络和存储资源 (k8s 的最小调度单元)
* 最佳实践是在 `Pod` 中运行一个应用 (纯辅助可以放一起, 如日志系统)
* `Service` 是一组 `Pod` 的抽象, 提供了负载均衡和服务发现的功能 (类似反向代理)
* `Service` 分内部 (集群内访问) 和外部 (集群外访问)
* 群外访问可以依赖 `Ingress` 规定转发规则
* `ConfigMap` 是一组键值对的集合, 用于存储应用程序的配置信息
* `secret` 是一种特殊的 `ConfigMap`, 用于存储敏感信息, 如数据库密码等 (Base64)
* `volume` 是一个持久化存储卷, 用于存储 `Pod` 中的持久化数据
* `Deployment` 是一种资源对象, 用于定义 `Pod` 的副本数和更新策略
* `StatefulSet` 是一种资源对象, 用于定义有状态应用的副本数和更新策略

### 架构

* 主从架构 (Master/Worker)
* 一个 `Worker-Node` 中有 `kubelet,kube-proxy` 和容器运行时三个组件, 其中 `kubelet` 负责管理 `Pod`,`kube-proxy` 负责网络代理 / 负载均衡
* `Master-Node` 中有 `kube-apiserver`,`kube-controller-manager`,`kube-scheduler,etcd` 四个组件
* `kube-apiserver` 负责接收和响应 API 请求
* `kube-controller-manager` 负责维护集群状态 (监控)
* `kube-scheduler` 负责调度 `Pod` 到 `Node`
* `etcd` 是一个分布式的键值存储系统, 用于存储集群的元数据

### 本地部署

* `minikube` 是一个轻量级的 Kubernetes 发行版, 用于在本地开发和测试 Kubernetes 集群 (创建一个 VM, 部署一个单 `Node` 的 Kubernetes 集群)
* `multipass` 是一个虚拟机管理工具, 用于创建和管理虚拟机, 创建多个虚拟机作为 Node, 即可用 k3s 创建集群
* `kubectl` 是一个命令行工具, 用于与 Kubernetes 集群交互
* 命令看文档

## CI/CD

### CI (持续集成)

* 版本控制 -> 自动构建 -> 自动测试
* 版本控制 Git
* 自动构建形式多样, 自行了解
* 测试框架依托语言

### CD (持续交付)

* 自动部署 -> 监控 -> 改进
* 自动部署形式多样, 如 docker+k8s
* 监控反馈工具多样, 自行了解

## 服务器运维管理工具

### 1panel

* 其可以一键部署各种应用 (Docker)
* 管理界面清晰简单
