#!/bin/sh

#run this script in container


rm /tmp/result

echo "*******************************************************" >> /tmp/result
#test curl
echo "#######test curl#######"
echo "#######test curl start #######" >> /tmp/result
curl www.baidu.com >> /tmp/result
echo "#######test curl end #######" >> /tmp/result

echo "*******************************************************" >> /tmp/result

#test readlink 
echo "#######test readlink#######"
echo "#######test readlink start #######" >> /tmp/result
readlink /lib/libnl-nf-3.so >> /tmp/result
echo "#######test readlink end#######" >> /tmp/result

echo "*******************************************************" >> /tmp/result


#test busybox arithmetic
echo "#######test busybox arithmetic#######"
echo "#######test busybox arithmetic start #######" >> /tmp/result
Value=2
NewValue=$((1 << $Value))
echo $NewValue  >> /tmp/result
echo "#######test busybox arithmetic end #######" >> /tmp/result

echo "*******************************************************" >> /tmp/result

#test openvpn 
echo "#######test openvpn#######"
echo "#######test openvpn start #######" >> /tmp/result
openvpn --version >> /tmp/result
echo "#######test openvpn end #######" >> /tmp/result


echo "*******************************************************" >> /tmp/result


echo "######test strace#######"
echo "######stop strace by Ctrl+c#####"
strace -p 1 -c  #need stop manually by 'Ctrl+C' and see the result


sleep 2

echo "######test tcpdump######"
echo "######stop tcpdump by Ctrl+c#####"
sleep 1
echo "#######test tcpdump start #######" >> /tmp/result
tcpdump >> /tmp/result
echo "#######test tcpdump end #######" >> /tmp/result

echo "*******************************************************" >> /tmp/result

echo "######test lsof######"
echo "#######test lsof start #######" >> /tmp/result
lsof >> /tmp/result
echo "#######test lsof end #######" >> /tmp/result


echo "*******************************************************" >> /tmp/result

echo "######test df######"
echo "#######test df start #######" >> /tmp/result
df -h >> /tmp/result
echo "#######test df end #######" >> /tmp/result

echo "*******************************************************" >> /tmp/result

sleep 1

echo "######test gdb######"
echo "#######test gdb start #######" >> /tmp/result
echo "quit" | gdb >> /tmp/result
echo "#######test gdb end #######" >> /tmp/result

echo "*******************************************************" >> /tmp/result
echo "######test opkg#####"
echo "#######test opkg start #######" >> /tmp/result
if [ -z "$1" ]; then 
	echo "######have not  input ipk path######" >> /tmp/result
else
	opkg install $1 >> /tmp/result
fi
echo "#######test opkg end #######" >> /tmp/result

echo "*******************************************************" >> /tmp/result
sleep 2

echo "######test scp#####"

if [ -z "$2" ];then
	echo "######have not input scp file path######"
else
scp -P 2222 $2 root@192.168.1.1:/tmp 
fi
