# -*- coding: utf-8 -*-

import requests
import time
import re
import json
import  subprocess
import os
import sys

def get_real_exe_path():
    if hasattr(sys, '_MEIPASS'):
        exe_path = os.path.realpath(sys.executable)
        return os.path.dirname(exe_path)
    else:
        return os.path.dirname(os.path.abspath(__file__))

real_dir = get_real_exe_path()
os.chdir(real_dir)

print("当前工作目录:", os.getcwd())

with open('conf','a+',encoding='utf-8') as temp:
    temp.seek(0)
    content = temp.read()
    main = {'user':'0','pwd':'0'}
    if len(content) == 0:
        check= 1
        print('欢迎！检测到缺失配置文件，初始化中...')
        phone_pattern = re.compile(r'^1[3-9]\d{9}$')
        while check == 1:
            main['user'] = input('\n请输入您的账户（手机号）:').strip()
            if not phone_pattern.match(main['user']):
                print('请输入正确的账户！')
                if len(main['user']) == 0:
                    print('账户不能为空！')
            else:
                check = 0
        main['pwd'] = input('\n请输入密码(留空使用默认密码)：')
        if len(main['pwd']) == 0:
            main['pwd'] = '123450'
        temp.write(json.dumps(main, ensure_ascii=False))
        print('初始化完成！配置已保存到conf文件！')
    else:
        print('配置存在！开始发送请求！')
        content = json.loads(content)
        main['user'] = content['user']
        main['pwd'] = content['pwd']

connect_result = subprocess.run(["netsh", "wlan", "connect", "name=CMCC_BJKJDX_5G"],capture_output=True,encoding="gbk",errors="ignore")
print('尝试连接到校园网（CMCC_BJKJDX_5G）...')
time.sleep(7)

def res():
    response1 = requests.get(f'http://10.200.10.5:801/eportal/portal/login?callback=dr1003&login_method=1&user_account=%2C1%2C{main['user']}%40cmcc&user_password={main['pwd']}&wlan_user_ip=&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=4.2.1&terminal_type=2&lang=zh-cn&v=1925&lang=zh').status_code
    response2 = requests.get(f'http://10.200.10.5:801/eportal/portal/login?callback=dr1003&login_method=1&user_account=%2C0%2C{main['user']}%40cmcc&user_password={main['pwd']}&wlan_user_ip=&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=4.2.1&terminal_type=1&lang=zh-cn&v=6229&lang=zh').status_code
    if response1 == 200 or response2 == 200:
        print(f'登陆成功！（{response1}）（{response2}）')
    else:
        print(f'请求出错！请手动登录！（{response1}）（{response2}）')
        time.sleep(5)
res()