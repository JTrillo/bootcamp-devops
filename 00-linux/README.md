# Linux CLI exercises
### Exercise 1
```bash
mkdir -p foo/dummy foo/empty
echo 'Me encanta la bash!!' > foo/dummy/file1.txt
touch foo/dummy/file2.txt
```

### Exercise 2
```bash
echo "$(cat foo/dummy/file1.txt)" > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty/
```

### Exercise 3
1. Create the script `exercise3.sh`
```bash
#!/bin/bash
DEF_TEXT='Que me gusta la bash!!!!'

# First of all we must check the number of arguments
if [ $# == 1 ]; then
  DEF_TEXT=$1
elif [ $# -gt 1 ]; then
  echo "Error: unexpected arguments."
  exit 1
fi

# Now we can include the commands from the previous exercises
mkdir -p foo/dummy foo/empty
echo $DEF_TEXT > foo/dummy/file1.txt
touch foo/dummy/file2.txt
echo "$(cat foo/dummy/file1.txt)" > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty/
```

2. Grant execution permission and execute the script
```bash
chmod +x exercise3.sh
./exercise3.sh #OR
./exercise.sh Esto es una prueba
```

### Exercise 4
1. Create the script `exercise4.sh`
```bash
#!/bin/bash

# First of all we must check the number of arguments
if [ $# == 1 ]; then
  KEYWORD=$1
else
  echo "Error: invalid number of arguments."
  exit 1
fi

# Download web content in a file
curl -s https://www.marca.com/ --output output.txt

# Get the first line where the keyword appears
grep -n $KEYWORD output.txt  | head -1 | cut -d':' -f 1
```

2. Grant execution permission and execute the script
```bash
chmod +x exercise4.sh
./exercise4.sh hola
```