docker run -d \
-e MARATHON_HOSTNAME=gklab-97a-103 \
-e MARATHON_HTTPS_ADDRESS=10.91.97.103 \
-e MARATHON_HTTP_ADDRESS=10.91.97.103 \
-e MARATHON_MASTER=zk://gklab-97a-101:2181,gklab-97a-102:2181,gklab-97a-103:2181/mesos \
-e MARATHON_ZK=zk://gklab-97a-101:2181,gklab-97a-102:2181,gklab-97a-103:2181/marathon \
--name marathon --net host --restart always mesoscloud/marathon:1.1.1-centos-7
