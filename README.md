# 部署流程
方式A：  
1.点击右侧的release链接：  https://github.com/AndreasMarin/TJ_USTB_CampusNetwork_AutoLogin/releases/tag/release  
2.下载tjustb_cnal.zip，解压为文件夹  
3.运行Auto_Deploy.bat脚本自动部署开机启动即可
4.运行Auto_keep_online_deploy.bat脚本每隔1h在电脑上运行脚本，防掉线（可选，适用于长时间电脑挂机下载文件的场景）

#若要取消部署，运行Auto_Remove.bat或者Auto_keep_online_remove.bat移除对应功能部署即可  

方式B：  
1.克隆本仓库：  
`git clone https://github.com/AndreasMarin/TJ_USTB_CampusNetwork_AutoLogin`  
2.使用pyinstaller将main.py打包为main.exe或修改bat中的exe为py：  
`pyinstaller -F main.py`  
之后的流程同方式A，不再赘述  

#本代码中第69行的time_count(7)可以自行调参，时间长了比较慢，时间短了可能会发生还没有连接到校园网就发送get请求从而导致报错的问题，7s算是比较保守的调教了

# 关于
25级某cs学生，人太懒于是写了这个脚本自动登录