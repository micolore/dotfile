# 参考文档

1、https://martins3.github.io/My-Linux-Config/docs/nvim.html  
2、https://github.com/rockerBOO/awesome-neovim  
3、https://sharksforarms.dev/posts/neovim-rust  
4、https://rust-analyzer.github.io/manual.html  
5、https://neovide.dev/installation.html  
6、https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug 

## tips

1、代码折叠的配置以及快捷键  
    vim.opt.foldmethod = "indent"  
    vim.opt.foldlevel = 99  
    za 切换当前光标下的代码块的折叠状态、zA 递归、  
    zc 关闭当前光标下的代码快、zC、  
    zo 打开当前光标下的代码块、zO、  
    zm 折叠所以代码快、zM、  
    zr 展开所有代码快、zR  

## 修改记录

* 2024-03-16  
  1、修改移动插件为leap（其实他的快捷键很简单，就是大小s区分，但是有一些细节没有看明白。大概用法会了，尤其是行移动）  
  2、git 提交插件比较简单（类似tig），使用更多的是diff&blame的功能。  
* 2024-03-18  
  1、离开输入模式自动切换成英文模式（使用的im-select，不需要额外使用插件了)
* 2024-03-19  
  1、<C-O> 临时退出插入模式（光标保持），执行单条命令又返回插入模式
* 2024-03-20  
  1、[插入模式如何快速移动光标？](https://www.zhihu.com/question/25116829)  
  2、使用nvim-spectre来实现搜索替换（sed使用的windows版本的）  
  3、使用noice来美化消息提示以及cmd模式

## 插件使用文档

### mason

> 管理各种lsp，比如rust、go等等，install、uninstall

### nvim-tree

> 菜单栏操作文件、文件夹等等

* o 打开关闭文件夹
* a 创建文件
* r 重命名
* x 剪切
* c 拷贝
* p 粘贴
* d 删除

### leap 

> 搜索和移动
