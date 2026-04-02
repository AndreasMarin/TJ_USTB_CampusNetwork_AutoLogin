# 部署流程
方式A：  
1.点击右侧的release链接：  https://github.com/AndreasMarin/TJ_USTB_CampusNetwork_AutoLogin/releases/tag/release  
2.下载tjustb_cnal.zip，解压为文件夹  
3.运行Auto_Deploy.bat脚本自动部署开机启动即可
4.运行Keep_deploy.bat脚本每隔1h在电脑上运行main++值守脚本，防掉线（可选，适用于长时间电脑挂机下载文件的场景）

#欲取消部署，运行Auto_Remove.bat或者Keep_Remove.bat移除对应功能部署即可  

方式B：  
1.克隆本仓库：  
`git clone https://github.com/AndreasMarin/TJ_USTB_CampusNetwork_AutoLogin`  
2.使用pyinstaller将main.py(main++.py)打包为main.exe(main++.exe)或修改bat中对应的exe为py：  
`pyinstaller -F main.py`
`py installer -F main++.py`
之后的流程同方式A，不再赘述  

#main中第82行的time_count(7)可以自行调参，时间长了比较慢，时间短了可能导致未连接校园网就发送请求的问题

# 关于
25级某cs学生，人太懒于是写了这个脚本自动登录