#!/usr/bin/env bash
# OS: ubuntu 14.04

echo "#### vim的卸载和重新安装"
/bin/bash ./vim8.0_install.sh

echo "#### 安装vim插件依赖的库"
sudo apt-get install -y python-setuptools python-dev git cmake astyle ctags

echo "#### 保留旧的vim配置"
mv -vf ~/.vim ~/.vim_old
mv -vf ~/.vimrc ~/.vimrc_old

echo "#### 使用新的.vimrc脚本"
cp -v ./vimrc.default ~/.vimrc

echo "#### 创建.vim目录和.vim/bundle, .vim/colors目录"
mkdir -vp ~/.vim/bundle
mkdir -vp ~/.vim/colors

echo "#### 安装vim插件管理器vundle"
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

echo "#### vim 配色方案下载"

# molokai:
cd /tmp && rm -vrf molokai && git clone https://github.com/vim-cripts/molokai 
cp -vf ./molokai/colors/molokai.vim ~/.vim/colors/
rm -vrf molokai

# Solarized:
cd /tmp && rm -vrf vim-colors-solarized && git clone git://github.com/altercation/vim-colors-solarized.git
cp -vf ./vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
rm -vrf vim-colors-solarized

# phd:
cd /tmp && rm -vrf phd && git clone https://github.com/vim-scripts/phd
cp -vf ./phd/colors/phd.vim ~/.vim/colors/
rm -vrf phd

echo "#### 使用vundle安装vim插件,请耐心等待"
vim install -c "PluginInstall" -c "q" -c "q"

echo "#### 安装完成"
