import sys

# Mapper function
def mapper():
    for line in sys.stdin:
        line = line.strip()
        words = line.split()
        for word in words:
            # Clean word (lowercase and remove punctuation)
            word = word.lower().strip('.,!')
            if word:
                print(f"{word}\t1")

# Reducer function
def reducer():
    current_word = None
    current_count = 0
    
    for line in sys.stdin:
        line = line.strip()
        word, count = line.split('\t', 1)
        count = int(count)
        
        if current_word == word:
            current_count += count
        else:
            if current_word:
                print(f"{current_word}\t{current_count}")
            current_word = word
            current_count = count
            
    if current_word == word:
        print(f"{current_word}\t{current_count}")

if __name__ == "__main__":
    # To simulate MapReduce locally without a full Hadoop cluster, 
    # we can check which mode we are in. 
    # Since this is a lab simulation, we provide a wrapper.
    import sys
    if len(sys.argv) > 1 and sys.argv[1] == 'map':
        mapper()
    elif len(sys.argv) > 1 and sys.argv[1] == 'reduce':
        reducer()
