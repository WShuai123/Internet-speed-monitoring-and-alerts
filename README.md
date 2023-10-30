实时监控连接openwrt的某个ip的网速情况，当网速超过设定的阈值时，推送报警信息。

目前支持的推送方式(不断更新中)：

+ Bark。最好自己在服务器中部署。也可以直接调用苹果的APNS接口。具体见[官方文档](https://bark.day.app/#/)或者[教程视频](https://www.bilibili.com/video/BV1qP411e7Qm/)。

+ Telegram。需要在Telegram新建机器人，获取机器人Token和ChatID。新建机器人在[BotFather机器人](https://t.me/BotFather)。查看ChatID在[Get My ChatID机器人](https://t.me/GetMyChatID_Bot)。
