# SDcleaner (Steamdeck 清洁工)
## 介绍
SDcleaner 是一个用于清理 Steamdeck 系统垃圾文件的工具，它可以帮助你快速清理 Steamdeck 中产出的类似Windows中游戏Documents的compatdata和着色器缓存shadercache。

## 用法
### 安装
```bash
git clone https://github.com/xilingchu/sdcleaner
```

### 运行
#### 可选选项
```
-h      显示帮助信息
-d      Steam路径，除非你装SD的时候就爱折腾，不然直接用默认路径就行。
-w      临时白名单
-c      只清除compatdata
-s      只清除shadercache
```
关于白名单需要注意的几点，
1. 白名单采用的是https://steamdb.info 当中的编号，不是游戏名。请根据游戏名称去网站查询编号。
2. 推荐直接打开脚本修改wl这一行，这样下次就不用再输入了。具体做法就是把编号输入到""中，用空格隔开。
3. 如果是通过命令行加入白名单，注意编号中间不要只打空格，而是通过"\ "来代替空格，或者直接用引号包裹。

#### 使用方法
```bash
cd sdcleaner
chmod +x sdcleaner.sh
./sdcleaner.sh 
可选选项直接加在后面,举个例子:
./sdcleaner.sh -d /home/steam -w "292030 292031 292032" -c
```
