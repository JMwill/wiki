# GraphQL 记录

## 架构

GraphQL 仅仅只是一个规范，也就是说应用了 GraphQL 这个规范的服务器在行为上需要受到它的约束，仅此而已。所以在引入 GraphQL 时可以有多种不同类型的架构：

1. 带有数据库的 GraphQL 服务器
2. 作为多个第三方或者旧系统与客户端之间的一层中间层，通过单个 GraphQL API 集成
3. 以上两者之间的一种混合架构，既可以直接跟数据库沟通，又有跟旧系统或者第三方之间的沟通

GraphQL 实际上是 *传输层不可知* 的，因此可以潜在地与任何可用的网络协议一起使用。

GraphQL 的出现为前端带来了较为重大的变化，将以前的 **命令式数据获取** 方式转变为纯粹的 **声明性获取** 方式。两者的对比

以前：

1. 构造和发送 HTTP 请求
2. 接收并解析服务器响应
3. 在本地存储数据
4. 在 UI 显示数据

现在：

1. 描述数据需求
2. 在 UI 中显示数据