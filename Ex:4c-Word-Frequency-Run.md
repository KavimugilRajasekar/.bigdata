## 3. Execution and Verification (4c)
Execute the MapReduce pipeline and verify the results.

``` bash
# Run Mapper -> Sort -> Reducer
cat input.txt | python3 WordCount.py map | sort | python3 WordCount.py reduce > final_output.txt

# Display results
cat final_output.txt
```

------------------------------------------------------------------------

# Result
The Word Frequency program was successfully implemented. The separation of mapping and reducing logic allowed for efficient processing of the text corpus, and the final output was verified against the input dataset.
