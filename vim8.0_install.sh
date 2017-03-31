#!/usr/bin/env bash
#### OS:ubuntu 14.04

cur_dir=`pwd`

echo "#### 系统自带vim卸载"
sudo apt-get remove -y --purge vim # (--purge 是完全删除，会连配置文件一起删除)
sudo apt-get clean

cd /usr/local/src/

echo "#### vim源码下载"
git clone https://github.com/vim/vim.git

echo "#### vim源码压缩，暂存"
tar -zcvf vim8.0.tgz vim

echo "#### vim8.0编译安装"
cd vim

# ./configure --prefix=/usr/local/vim \                        # 指定将要安装到的路径
#             --with-features=huge\                            # 支持最大特性
#             --enable-pythoninterp=yes \                      # 打开对python编写的插件的支持
#             --enable-rubyinterp \                            # 打开对ruby编写的插件的支持
#             --enable-luainterp \                             # 打开对lua编写的插件的支持
#             --with-python-config-dir=<python-config-dir> \
#             --with-x \
#             --enable-multibyte \                             # 打开多字节支持，可以在Vim中输入中文
#             --enable-fontset \    

./configure --prefix=/usr/local/vim \
    --with-features=huge \
    --enable-pythoninterp=yes \
    --enable-rubyinterp \
    --enable-luainterp \
    --with-python-config-dir=/usr/bin/python \
    --with-x \
    --enable-multibyte \
    --enable-fontset

make
make install

echo "#### 添加vim软连接"
ln -s /usr/local/vim/bin/vim /usr/bin/vim

# 切回初始目录
cd ${cur_dir}
