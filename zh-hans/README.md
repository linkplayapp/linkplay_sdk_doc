# 写好文章后如何提交

## 概述：
我们的GitBook所在的Git库地址为：[linkplay_sdk_doc](https://github.com/linkplayapp/linkplay_sdk_doc)，书写方式为markdown，
在这里简单介绍一下如何把写好的markdown文档提交到此GitBook中。

>这文章暂时会保留一段时间，等参与人员大致了解后，会删除掉。

## 目录结构：

>根目录在分别有en、zh-hans2个文件夹，其下级又分别有android和iOS2个文件夹和SUMMARY.md文件（SUMMARY用来控制目录结构）

```Markdown
|-- [en]
    |-- [android]
    |-- [iOS]
    |-- SUMMARY.md
|-- [zh-hans]
    |-- [android]
    |-- [iOS]
    |-- SUMMARY.md
```

## 步骤:
1. GitBook配置：
    `gitbook-cli` 是 gitbook 的一个命令行工具，我们首先安装它：
    ```
    npm install gitbook-cli -g
    ```
     
2. 下载源码：
    1. 首先要确认自己的账号已经是linkplayapp的参与者，有提交和修改的权限。
    2. 下载linkplay_sdk_doc的GitBook代码
    ```
    git clone https://github.com/linkplayapp/linkplay_sdk_doc.git
    ```

3. 本地调试：
    1. 本地调试前需要先 `gitbook install` <br>
   
    如果下载很慢，可以尝试更换一下npm的镜像，
    
    我这里之前是 `https://registry.npm.taobao.org/` ,更换成 `http://r.cnpmjs.org/`后速度很快（仅供参考😁）

       * 查看npm镜像：
       ```
       npm config list
       ```

       * 修改成cnpm镜像:
       ```
       npm set registry http://r.cnpmjs.org/
       ```

    2. install之后执行 `gitbook serve` 即可通过访问 `http://localhost:4000` 进行同步调试；
    ```shell
    Starting server ...
    Serving book on http://localhost:4000
    ```

4.  提交SDK文档并构建：
   
    gitbook serve时，本地会生成_book文件夹，里面就是网站的静态资源文件，我们的网站实际上加载的就是这个文件夹。
    但是我们的网站不是加载master分支的_book，而是新建了一个gh-pages分支，来单独装载_book。

    >因此在写好文档，并提交至master后，还需要2步操作：
    >>这一步暂时没有什么好的方式，其实可以放在jenkins上去处理，或者让<font color=red>帅哥</font>来弄（<font color=red>强烈建议🤩</font>）

    1. 切换至gh-pages分支
    2. gh-pages分支下有个 `copyBooks.py` 的python3脚本，执行它，即可自动完成构建，实际上就是自动化了以下几步：
       1. gf & gr
       2. 将master的_book内容，覆盖到当前分支下
       3. push
    >如果上述脚本失败，那只能自行手动去拷贝master下_book的内容，然后手动覆盖至gh-pages下。或者确认哪步失败，自己手动进行下去。


