#! /bin/bash

AUTHKEYFILE=`grep AuthorizedKeysFile /etc/ssh/sshd_config | awk '{print $2}' | awk -F'%h/' '{print $2}'`
if [[ -z "$AUTHKEYFILE" ]];
then
    AUTHKEYFILE=`grep AuthorizedKeysFile /etc/ssh/sshd_config | awk '{print $2}'`
fi

cat /etc/shells
for u in `cat /etc/passwd`
do
     PASSWD="False"
     HOMEDIR=`echo $u | awk -F':' '{ print $6}'`
     USER=`echo $u | awk -F':' '{ print $1}'`
     ENTRY=`echo $u | awk -F':' '{ print $7}' | awk '{$1=$1}1'`
     if [[ ! -z "$ENTRY" && ! `echo $ENTRY | grep 'nologin'` && ! `echo $ENTRY | grep 'false'` ]];
     then
         if [[ ! `cat /etc/shadow | grep $USER | awk -F":" '($2 == "!" || $2 == "*") {print $1}'` ]];
         then
              PASSWD="True"
         fi
         if [[ -f "$HOMEDIR/$AUTHKEYFILE" ]];
         then
              KEY=`cat $HOMEDIR/$AUTHKEYFILE`
         fi
         echo -e "User: $USER\nShell: $ENTRY\nPassword: $PASSWD\nHome: $HOMEDIR\nKey: $KEY\n"
     fi
done

