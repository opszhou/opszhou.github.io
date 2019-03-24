---
title: 深入剖析kubernetes笔记
date: 2019-03-16 17:30:49
id: k8s
tags: 
  - k8s
  - 极客时间
categories: 极客时间
---

此文为个人笔记，时间长了，可能连我自己都看不懂…………

<!--more-->

1. 容器进程

普通进程创建：
```
int pid = clone(main_function, stack_size, SIGCHLD, NULL); 
```

经过`namespace`隔离的进程创建：
```
int pid = clone(main_function, stack_size, CLONE_NEWPID | SIGCHLD, NULL); 
```

容器技术的核心功能: 通过`Cgroup` 和 `Namespace`来「隔离」、「限制」进程的，从而为其创造了一个「边界」。
`Cgroups:` 制造约束
`Namespace:` 制造隔离（`pid`, `mount`, `network`等各种`namespace`）

容器的本质就是一种特殊的进程。

2. 容器隔离

容器相对于虚拟化来说，具有高性能，敏捷的特性；但隔离的不彻底。

`Cgroup:` **Linux Control Froup**。主要用来限制进程组能够使用的资源上限，包括`cpu`、磁盘、内存、网络带宽等。 

[待续]