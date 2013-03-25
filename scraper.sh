#!/bin/sh


#flags are e p f
eFlag=
pFlag=
fFlag=
file=
URL=
#loop through statements since order does not matter. Set var where appropriate
while [ $# -gt 0 ]
do
    case ${1} in
	www.*)
	    URL="${1}"
	    ;;
	-f)
	    fFlag=1
	    file="${2}"	
	;;
	-e)
	    eFlag=1
	;;
	-p)
	    pFlag=1
	;;    
    *) 
	;;
    esac
    shift
done

# f filename 
if [ -n "$fFlag" ] && [ -z "$eFlag" ] && [ -z "$pFlag" ]
then
    egrep -o '([0-9]{3}-[0-9]{3}-[0-9]{4}|\([0-9]{3}\)-[0-9]{3}-[0-9]{4})' ~/scripts/${file} > phonenumbers.txt
    egrep -o '\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b' ~/scripts/${file} > emails.txt
fi

# -e URL 
if [ -n "$URL" ] && [ -n "$eFlag" ] && [ -z "$pFlag" ]
then
    	wget -q -O - ${URL} | egrep -o '\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b' > emails.txt
fi

# -p URL 
if [ -n "$URL" ] && [ -n "$pFlag" ] && [ -z "$eFlag" ]
then 
	wget -q -O - ${URL} | egrep -o '([0-9]{3}-[0-9]{3}-[0-9]{4}|\([0-9]{3}\)-[0-9]{3}-[0-9]{4})' > phonenumbers.txt
fi

# -e -p URL
if [ -n "$URL" ] && [ -n "$pFlag" ] && [ -n "$eFlag" ]
then
    wget -q -O - ${URL} | egrep -o '([0-9]{3}-[0-9]{3}-[0-9]{4}|\([0-9]{3}\)-[0-9]{3}-[0-9]{4})' > phonenumbers.txt
    wget -q -O - ${URL} | egrep -o '\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b' > emails.txt
fi

# -e -f filename
if [ -n "$fFlag" ] && [ -n "$eFlag" ] && [ -z "$pFlag" ]
then
    egrep -o '\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b' ~/scripts/${file} > emails.txt
fi

# -p -f filename
if [ -n "$fFlag" ] && [ -z "$eFlag" ] && [ -n "$pFlag" ]
then
    egrep -o '([0-9]{3}-[0-9]{3}-[0-9]{4}|\([0-9]{3}\)-[0-9]{3}-[0-9]{4})' ~/scripts/${file} > phonenumbers.txt
fi

# -p -e -f filename
if [ -n "$fFlag" ] && [ -n "$eFlag" ] && [ -n "$pFlag" ]
then 
    egrep -o '([0-9]{3}-[0-9]{3}-[0-9]{4}|\([0-9]{3}\)-[0-9]{3}-[0-9]{4})' ~/scripts/${file} > phonenumbers.txt
    egrep -o '\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b' ~/scripts/${file} > emails.txt
fi
