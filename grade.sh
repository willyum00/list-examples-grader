CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

#grading-area
#|
#|______student-submission
#|      |
#       |_______Student's ListExamples.java
#       |

# Then, add here code to compile and run, and do any post-processing of the
# tests

set -e
cd student-submission
ls > /c/Users/will/Documents/GitHub/list-examples-grader/ls.txt

#check that the correct files are submitted
if [ -f "ListExamples.java" ]
then
    echo "correct file submitted" 
    cp  /c/Users/will/Documents/GitHub/list-examples-grader/student-submission/ListExamples.java /c/Users/will/Documents/GitHub/list-examples-grader/grading-area   # make grading area absolute path
    cp  /c/Users/will/Documents/GitHub/list-examples-grader/TestListExamples.java /c/Users/will/Documents/GitHub/list-examples-grader/grading-area
else
    echo "correct file not submitted"
    exit 1
fi

set +e
cd /c/Users/will/Documents/GitHub/list-examples-grader/
cd grading-area
javac -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" *.java
java -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > output.txt
echo $?


