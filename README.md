# ChatGPT-Feishu

给飞书用户准备的 ChatGPT 机器人。视频演示如下，生成略慢，请耐心等待~

## 效果

https://user-images.githubusercontent.com/13283837/217905601-6e1ff237-5275-4deb-8135-3071b1e977a8.mp4

## 如何使用本项目代码？

> 视频教程见 -> https://youtu.be/axvH1D0Dhnk | https://www.bilibili.com/video/BV1uT411R7TL/

### 1. 创建一个飞书开放平台应用，并获取到 APPID 和 Secret

访问 [开发者后台](https://open.feishu.cn/app?lang=zh-CN)，创建一个名为 **ChatGPT** 的应用，并上传应用头像。创建完成后，访问【凭证与基础信息】页面，复制 APPID 和 Secret 备用。

![image-20230210012031179](https://postimg.aliavv.com/picgo/202302100120339.png)

### 2. 开启机器人能力

打开应用的机器人应用功能

![image-20230210012110735](https://postimg.aliavv.com/picgo/202302100121008.png)



### 3.clone项目并安装依赖环境
```
git clone https://github.com/anota/express-feishu-chatgpt#clone项目到本地服务器
cd ~/express-feishu-chatgpt#进入项目目录
npm install#安装npm
npm install @larksuiteoapi/node-sdk#安装飞书lark依赖
npm install axios#安装axios依赖
npm install pm2@latest -g#安装PM2管理
```


### 4. 配置js环境变量
`-vi index.js`
```
const FEISHU_APP_ID = process.env.APPID || "飞书的应用 ID"; // 
const FEISHU_APP_SECRET = process.env.SECRET || "飞书的应用的 Secret"; // 
const FEISHU_BOTNAME = process.env.BOTNAME || "飞书机器人的名字"; // 不能是中文
const OPENAI_KEY = process.env.KEY || "OpenAI 的 APIKey"; // 
```
-修改完成按ESC，输入:wq保存配置

### 5.启动nodejs服务

`pm2 start index.js#服务运行在后台，端口9000；测试服务是否启动，浏览器输入IP:9000,返回成功提示即可`


### 6. 开启权限并配置事件

访问开放平台页面，开通如下 6 个权限：

- im:message
- im:message.group_at_msg
- im:message.group_at_msg:readonly
- im:message.p2p_msg
- im:message.p2p_msg:readonly
- im:message:send_as_bot

![image-20230210022432066](https://postimg.aliavv.com/picgo/202302100224325.png)

复制服务器调用地址。

-IP:9000#自行设置反代或添加证书

然后回到事件订阅界面，添加事件。

![image-20230210022720552](https://postimg.aliavv.com/picgo/202302100227786.png)

### 7. 发布版本，等待审核

上述这些都配置完成后，你的机器人就配置好了，接下来只需要在飞书开放平台后台找到应用发布，创建一个全新的版本并发布版本即可。

## 如何贡献？

欢迎通过 issue 提交你的想法，帮助我迭代这个项目 or 直接通过 Pull Request 来提交你的代码。发布成功后，你就可以在飞书当中体验 ChatGPT 了。

![image-20230210022834052](https://postimg.aliavv.com/picgo/202302100228159.png)

## 有问题沟通可加群

![image](https://user-images.githubusercontent.com/13283837/218001986-2b79cc73-52c9-43db-b07e-bf78cc0cedab.png)

## FAQ

### 1. 提交事件订阅地址时提示 Challenge Code 没有返回？

可以看看是不是配置了 Encrypt Key ，暂时不支持对加密数据解密。路径是应用后台 - 事件订阅

![image](https://user-images.githubusercontent.com/13283837/218002249-362a40ab-3f5d-493b-80ec-a2b0efa2b5c9.png)

### 2. 可以私聊回复，但没办法群聊回复？

确保 6 项开放平台权限都已经开通且已经发布版本，权限进入可用状态。

另一情况是飞书机器人名称与 BOTNAME 变量不一致。由于环境变量**不支持中文**，如果机器人名称为中文也会造成部署失败。

解决办法：修改飞书机器人的名称为英文，或直接修改代码中的 BOTNAME 值。


## LICENSE

[GPLv3](LICENSE)
