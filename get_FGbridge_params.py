#!/usr/bin/env python3


import json
import sys
import os

if len(sys.argv)!=2:
    exit(-1)

filename=sys.argv[1]

if not os.path.exists('./'+filename):
    exit(-1)

# 读取模型参数
with open(filename) as json_file:
    data = json.load(json_file)
    model=data['FgModel']
    url=data['Url']
    controls=data['Controls']

# 传递控制通道数量
print(len(controls), end =" ")
# 传递 控制通道 以及 方向映射
for c in controls:
    print(c[0]+' '+c[2], end =" ")

print(' ')
