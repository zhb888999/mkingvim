echo "开始下载插件管理插件vim-plus"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "下载完成"
cp .vimrc ~/.vimrc
echo "开始安装插件..."
vim -c PlugInstall
