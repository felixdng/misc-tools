#!/bin/bash

IGNORE=0
TEST=0
SVN_COMMIT_LOG=""
SVN_USER="admin"
SVN_DATE=`date "+%Y-%m-%d"`

function help() {
    echo "Usage: $0 [option]"
    echo "    option: --log \"xxx\"             : commit log message"
    echo "            --user \"username\"       : user name"
    echo "            --ignore                : ignore some files."
	echo "            --test                  : just a test for svn commit command."
	echo "            --help or -h            : for help on a specific command."
    echo ""
}

## start
if [ $# -lt 1 ];then
    help
    exit
fi

while [ $# -ge 1 ] ; do
    case "$1" in
            --log) SVN_COMMIT_LOG=$2; shift 2;;
            --user) SVN_USER=$2; shift 2;;
			--ignore) IGNORE=1; shift 1;;
			--test) TEST=1; shift 1;;
			--help | -h) help; exit 0 ; break;;
			*) echo "unknown parameter $1."; help; exit 1 ; break;;
    esac
done

if [ -z "${SVN_COMMIT_LOG}" ];then
    echo "Without log?!"
    exit
fi

if [ 0 -eq ${IGNORE} ];then
    UNKNOW_FILES=`svn st | awk '{ if($1 != "A" && $1 != "M" && $1 != "D") { print $2 } }'`
    if [ -n "$UNKNOW_FILES" ];
    then
        echo "Info: Some files are not versioned. Run command: 'svn status' to check them."
        echo ${UNKNOW_FILES}
        exit
    fi
fi

COMMIT_FILES=`svn st | awk 'BEGIN{ORS=" "}{if($1=="A" || $1=="M" || $1=="D") {print $2}}END{printf "\n"}'`
if [ -n "${COMMIT_FILES}" ];then

if [ 1 -eq  ${TEST} ];then
echo "test for svn commit command:"
echo "commit files: $COMMIT_FILES"
echo "[修改原因] $SVN_COMMIT_LOG
[修改作者] $SVN_USER
[修改时间] $SVN_DATE"
else
svn commit ${COMMIT_FILES} -m "[修改原因] $SVN_COMMIT_LOG
[修改作者] $SVN_USER
[修改时间] $SVN_DATE"
fi

else
    echo "nothing to be commited"
fi

## end