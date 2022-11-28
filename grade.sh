# Create your grading script here

CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
file="TestListExamples.java"

rm -rf student-submission 
git clone $1 student-submission 
cp TestListExamples.java student-submission/
cd student-submission 

if [[ -f $file ]] && [[ -e $file ]]
then
    echo "File exists!"
else
    echo "File not found!"
    echo "Grade 0/5"
    exit 1
fi

javac -cp $CPATH *.java > return.txt 

if [[ $? -eq 0 ]]
then
    echo "Compile succeeded"
 
else
    echo "Your program didn't compile"
    echo "Grade 1/5"
    exit 2
   
fi

java -cp $CPATH  org.junit.runner.JUnitCore TestListExamples > results.txt 

if [[ $? -eq 0 ]]
then
    echo "Test Passed"
    echo "Grade 5/5"
    cat results.txt
    exit
    
else 
    echo "Test Failed"
    echo "Grade 3/5"
    cat results.txt
    exit
fi
