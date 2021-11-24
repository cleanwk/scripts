#封装常用操作，提高效率
ARG=$1
REMOTE_ADDRESS=$2
LOCAL_TIME="`date +%Y-%m-%d,%H:%m:%s`"


git_operation() {
    #绿色字
    echo "\033[32m ------>>>  enter you commit message please: \n \033[0m"
    read message
    git add .
    git commit -m "$message"
    git push origin master
    #绿色字体
    echo "\033[32m ------>>>  all commit push to your repo successfully! \033[0m"

}
git_init() {
    #绿色字
    echo "\033[32m ------>>>  enter you first line in readme.md: \n \033[0m"
    read message
    echo "$message" >>README.md
    echo "\033[32m ------>>>  readme.md create successfully!: \n \033[0m"
    git init
    git add .
    git commit -m "init repo"
    git remote add origin $REMOTE_ADDRESS
    git push -u origin master

    #绿色字体
    echo "\033[32m ------>>>  init repo && push to your repo successfully! \033[0m"
}

---
title: brew 常用命令
date: 2021-11-07 15:39:35
tags: [工具使用,常用命令]
---
## 
hexo_new(){
     #绿色字
    echo "\033[32m ------>>>  enter you file name & tags: \n \033[0m"
    read filename tags
    echo "---
        title: ${filename}
        date: ${LOCAL_TIME}
        tags: [${tags}]
    ---" >> ~/Desktop/hexo_blog/source/_posts/${filename}.md
    echo "\033[32m ------>>>  ${filename}.md create successfully!: \n \033[0m"
    sleep 2
    open ~/Desktop/hexo_blog/source/_posts/${filename}.md 
}
#*********************************main task ************************************

case $ARG in
'-pa')
    git_operation
    ;;

'--pushall')
    git_operation
    ;;

'-ir')
    git_init
    ;;
'--initrepo')
    git_init
    ;;
'-hn')
    hexo_new
    ;;
'--hexonew')
    hexo_new
    ;;
*)
    #红色字体
    echo "\033[31m ------>>>  illegal args operation failed ！ \033[0m"
    ;;
esac
