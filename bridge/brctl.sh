
brctl addbr br0
brctl stp br0 off
brctl setfd br0 1
brctl sethello br0 1
ifconfig br0 0.0.0.0 promisc up
dhclient br0
#brctl show br0
#brctl showstp br0

sleep 1

ifconfig ens38 down
brctl addif br0 ens38
ifconfig ens38 0.0.0.0 promisc up

tunctl -t tap0 -u root
brctl addif br0 tap0
ifconfig tap0 0.0.0.0 promisc up

#tunctl -t tap1 -u root
#brctl addif br0 tap1
#ifconfig tap1 0.0.0.0 promisc up

brctl showstp br0
