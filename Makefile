DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := $(shell git rev-parse --abbrev-ref HEAD)
build:
	docker build -t bde2020/hadoop-base:$(current_branch) ./base
	docker build -t bde2020/hadoop-namenode:$(current_branch) ./namenode
	docker build -t bde2020/hadoop-datanode:$(current_branch) ./datanode
	docker build -t bde2020/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t bde2020/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t bde2020/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t bde2020/hadoop-submit:$(current_branch) ./submit

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -mkdir -p /input/
	docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -copyFromLocal -f /opt/hadoop-3.2.1/README.txt /input/
	docker run --network docker-hadoop_default --env-file hadoop.env hadoop-wordcount
	docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -cat /output/*
	docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -rm -r /output
	docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -rm -r /input
