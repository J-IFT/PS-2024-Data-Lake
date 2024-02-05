docker build -t hadoop-wordcount ./submit
docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -mkdir -p /input/
docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -copyFromLocal -f /opt/hadoop-3.2.1/README.txt /input/
docker run --network docker-hadoop_default --env-file hadoop.env hadoop-wordcount
docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -cat /output/*
docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -rm -r /output
docker run --network docker-hadoop_default --env-file hadoop.env bde2020/hadoop-base:latest hdfs dfs -rm -r /input