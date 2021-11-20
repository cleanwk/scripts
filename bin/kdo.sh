#封装常用操作，提高效率
ARG=$1

git_operation() {
    #绿色字
    echo "\033[32m enter you commit message please: \n \033[0m"
    read message
    git add .
    git commit -m "$message"
    git push origin master
    #绿色字体
    echo "\033[32m ------>>>  all commit push to your repo successfully! \033[0m"

}

#*********************************main task ************************************

case $ARG in
'-pa')
    git_operation
    ;;

'--pushall')
    git_operation
    ;;

*)
    #红色字体
    echo "\033[31m ------>>>  illegal args operation failed ！ \033[0m"
    ;;
esac
