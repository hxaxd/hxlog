# Nginx

## 参考资料

- Nginx是一个开源的WEB服务器,它可以作为负载均衡器,缓存服务器,反向代理服务器等角色使用

反向代理的作用是将客户端的请求转发给后端的服务器,然后将后端服务器的响应返回给客户端 这样可以实现负载均衡(多个实际服务器),并隐藏后端服务器的IP地址

负载均衡的算法

- 轮询法(默认方法)每个请求按时间顺序逐一分配到不同的后端服务器
- weight权重模式(加权轮询)用于后端服务器性能不均情况
- ip_hash:上述方式存在重定位另一个服务器,其登录信息将会丢失的问题
我们可以采用ip_hash指令解决这个问题,每个请求按访问ip的hash结果分配固定访问一个后端服务器

Nginx可以实现动静分离

配置文件:conf目录下的nginx.conf,默认配置的nginx监听的端口为80

常用命令

```bash
cd /usr/local/nginx/sbin/
./nginx  启动
./nginx -s stop  停止
./nginx -s quit  安全退出
./nginx -s reload  重新加载配置文件  如果我们修改了配置文件,就需要重新加载
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
# 参数解释1 firwall-cmd:是Linux提供的操作firewall的一个工具;2 --permanent:表示设置为持久;3 --add-port:标识添加的端口;

```
