#!/bin/bash

# 执行传入的命令
$@

OSTYPE=$(uname)

# 检查操作系统是mac还是linux
if [[ "$OSTYPE" = "Darwin" ]]; then
    # mac系统使用say命令进行语音提示
    say "done"
fi
