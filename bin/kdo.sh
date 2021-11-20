#封装常用操作，提高效率
ARG=$1

git_operation() {
    echo "------>>>  enter you commit message please: \n"
    read message
    git add .
    git commit -m "$message"
    git push origin master
    echo "------>>>  all commit push to your repo successfully!"

}

#*********************************main task ************************************

case $ARG in
'-pa')
    git_operation
    ;;

'--pushall')
    git_operation
    ;;

*) echo "------>>>  illegal args operation failed ！" ;;
esac
