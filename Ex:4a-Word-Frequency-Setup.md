# Exercise 4(a) --- Hadoop Word Frequency Setup

## Aim
Prepare a large text corpus as input for a Hadoop MapReduce program and store the file in HDFS.

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Framework: Apache Hadoop
Directory: ~/Desktop/lab/Hadoop_WordCount
```

------------------------------------------------------------------------

## 1. Implementation
Run these commands to create the working directory and the input dataset.

``` bash
mkdir -p ~/Desktop/lab/Hadoop_WordCount
cd ~/Desktop/lab/Hadoop_WordCount

cat << 'EOF' > input.txt
Big Data is the future of analytics.
Hadoop makes Big Data processing easy.
MapReduce is a core part of Hadoop.
Big Data analytics provides deep insights.
Hadoop and MapReduce work together.
Big Data is powerful.
EOF
```

------------------------------------------------------------------------

## 2. HDFS Storage
In a real Hadoop cluster, the file is uploaded using:
``` bash
hdfs dfs -put input.txt /user/hadoop/wordcount/input
```

------------------------------------------------------------------------

# Result
The input text corpus was successfully created and the HDFS upload procedure was documented.
