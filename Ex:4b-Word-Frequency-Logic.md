            word = word.lower().strip('.,!')
            if word:
                print(f"{word}\t1")

def reducer():
    current_word = None
    current_count = 0
    for line in sys.stdin:
        line = line.strip()
        if not line: continue
        try:
            word, count = line.split('\t', 1)
            count = int(count)
            if current_word == word:
                current_count += count
            else:
                if current_word:
                    print(f"{current_word}\t{current_count}")
                current_word = word
                current_count = count
        except ValueError: continue
    if current_word:
        print(f"{current_word}\t{current_count}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1 and sys.argv[1] == 'map':
        mapper()
    elif len(sys.argv) > 1 and sys.argv[1] == 'reduce':
        reducer()
EOF
```

------------------------------------------------------------------------

