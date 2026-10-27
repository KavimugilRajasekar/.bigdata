To convert an array into multiple rows, the `EXPLODE` function is used with `LATERAL VIEW`:
``` sql
SELECT emp_name, skill FROM employee_complex LATERAL VIEW explode(skills) exploded_table AS skill;
```

------------------------------------------------------------------------

# Result
Hive tables were successfully created using both primitive and collection data types. The implementation demonstrated how `ARRAY`, `MAP`, and `STRUCT` can be used to store multi-valued attributes. Data retrieval was verified using index access, key-value lookups, and the `EXPLODE` function.
