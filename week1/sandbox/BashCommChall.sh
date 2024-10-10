# Bash Command Challenge 

# Original command (2 pipes)
find . -type f -exec ls -s {} \; | sort -n | head -10

find . -type f -exec du -h {} + | sort -n | head -10
# (du) Changes file size to human readable format (K)
# -exec..(+) allows multiple files to pass through the find statement at once
# instead of looping through all of them 

find . -type f -print0 | xargs -0 du -h | sort -n | head -10 
# use xargs to pass batches of files to du, reduces the number of files du calls 
# -print0 and -0 handle file names with speces or special characters safely 
# xargs passes many file names at once to du 
