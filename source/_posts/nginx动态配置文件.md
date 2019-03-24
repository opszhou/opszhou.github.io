---
title: nginx动态配置文件
date: 2019-03-24 16:26:49
id: dynamic-configuration-for-nginx
tags:
  - nginx
  - nginx config
categories: 
  - nginx
---

# 需求

公司`web`项目有接近`10`个，再加上不同服务对象、地区等等能凑一个连队。遇到更新是个麻烦事，虽然自动化可以解决，但是配置文件模板还是人工修改的，工作量并没有减少太多，而且有个别会有些特殊情况，维护起来也是麻烦。为了偷懒，少改几个文件，就想着把每台机器所有的项目（特殊的除外）用一个配置去处理不就行了？

<!--more-->

## 思路

其实很简单，多个项目，多个域名，用一个配置文件的话，只需要针对不同域名的，将请求分配到不同的`root`，日志写到对应的`access_log`，基本上就满足需求了。[配置文件示例](https://gist.github.com/opszhou/805c9303ed6c5837eda7b55a35fe8510)

## 问题

配置文件写好后，在测试的过程中，遇到一个问题，日志文件没有被创建，`nginx`错误日志有提示没有权限。
>open() "/var/logs/nginx/.log" failed (13: Permission denied) while logging request,

解决方法：
在`server`添加`root directory`，而且此目录必须存在。官方的使用限制说明：
>the file path can contain variables (0.7.6+), but such logs have some constraints:
>
>1. the user whose credentials are used by worker processes should have permissions to create files in a directory with such logs;
>2. buffered writes do not work;
>3. the file is opened and closed for each log write. However, since the descriptors of frequently used files can be stored in a cache, writing to the old file can continue during the time specified by the open_log_file_cache directive’s valid parameter
>4. during each log write the existence of the request’s root directory is checked, and if it does not exist the log is not created. It is thus a good idea to specify both root and access_log on the same level:
server {
    root       /spool/vhost/data/$host;
    access_log /spool/vhost/logs/$host;
    ...

设置如下：
```conf
root /var/logs/nginx;
access_log /var/logs/nginx/$domain_name.log access;
```
