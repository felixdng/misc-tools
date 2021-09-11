#
安装网桥工具包
sudo apt-get install bridge-utils uml-utilities

配置命令：
ifconfig eth0 down                  # 先关闭eth0接口
brctl addbr br0                     # 增加一个虚拟网桥br0
brctl addif br0 eth0                # 在br0中添加一个接口eth0
brctl stp br0 off                   # 只有一个网桥，所以关闭生成树协议
brctl setfd br0 1                   # 设置br0的转发延迟
brctl sethello br0 1                # 设置br0的hello时间
ifconfig br0 0.0.0.0 promisc up     # 打开br0接口
ifconfig eth0 0.0.0.0 promisc up    # 打开eth0接口
dhclient br0                        # 从dhcp服务器获得br0的IP地址
brctl show br0                      # 查看虚拟网桥列表
brctl showstp br0                   # 查看br0的各接口信息

tunctl -t tap0 -u root              # 创建一个tap0接口，只允许root用户访问
brctl addif br0 tap0                # 在虚拟网桥中增加一个tap0接口
ifconfig tap0 0.0.0.0 promisc up    # 打开tap0接口
brctl showstp br0                   # 显示br0的各个接口信息


/etc/network/interfaces的配置内容如下：
------------------------->
# The bridge network interface(s)
auto br0
iface br0 inet dhcp
bridge_ports eth1
#bridge_fd 9
#bridge_hello 2
#bridge_maxage 12
#bridge_stp off

# The tap0 network interface(s)
auto tap0
iface tap0 inet manual
pre-up tunctl -t tap0 -u root
pre-up ifconfig tap0 0.0.0.0 promisc up
post-up brctl addif br0 tap0
<-------------------------


