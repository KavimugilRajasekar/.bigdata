# Exercise 4 --- Word Frequency Using Hadoop MapReduce

## Aim
Implement a Word Count program using the Hadoop MapReduce paradigm to analyze a large text corpus and determine the frequency of each word.

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Framework : Apache Hadoop (Simulated via Python Streaming)
Dataset  : Custom Text Corpus (input.txt)
Directory: ~/Desktop/lab/Hadoop_WordCount
```

------------------------------------------------------------------------

## 1. Dataset Preparation (4a)
A text corpus was created containing multiple sentences about Big Data and Hadoop. In a real Hadoop environment, this file is uploaded to HDFS using:
``` bash
hdfs dfs -put input.txt /user/hadoop/wordcount/input
```

------------------------------------------------------------------------

## 2. MapReduce Logic (4b)

### Mapper Function
The Mapper reads the text line by line, tokenizes the string into words, cleans them (lowercase, removes punctuation), and emits a key-value pair: `(word, 1)`.

### Reducer Function
The Reducer receives a sorted list of keys. It aggregates the values for each unique word and emits the final count: `(word, total_count)`.

**Implementation Code (`WordCount.py`):**
``` python
# Mapper
for word in words:
    print(f"{word}\t1")

# Reducer
if current_word == word:
    current_count += count
else:
    print(f"{current_word}\t{current_count}")
```

------------------------------------------------------------------------

## 3. Execution and Verification (4c)

### How to Run (Simulated Pipeline)
To run this MapReduce job locally (mimicking Hadoop Streaming):

``` bash
# 1. Run Mapper and sort output
cat input.txt | python3 WordCount.py map | sort > mapped.txt

# 2. Run Reducer on sorted mapped output
cat mapped.txt | python3 WordCount.py reduce > final_output.txt

# 3. View results
cat final_output.txt
```

### Results
The job successfully counted word frequencies. Selected verifications:
- **"big"**: 4 occurrences
- **"data"**: 4 occurrences
- **"hadoop"**: 3 occurrences

------------------------------------------------------------------------

# Result
The Word Frequency program was successfully implemented using the MapReduce paradigm. The separation of mapping and reducing logic allowed for efficient processing of the text corpus, and the final output was verified against the input dataset.
