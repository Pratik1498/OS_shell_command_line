 clear  
 d=1
 echo 
 echo "||*******************************************************||"
 echo "||*******************************************************||"
 echo "||		STUDENT DATABASE SYSTEM 		 ||"
 echo "||		  USING SHELL SCRIPT			 ||"
 echo "||							 ||"
 echo "||*******************************************************||"
 echo "||*******************************************************||"
 echo 
while  [ $d != "7" ] 
do
 echo 
 echo "||******************************************************||"
 echo "||	1. create database 				||"  
 echo "||	2. view database 				||"  
 echo "||	3. insert a record 				||"  
 echo "||	4. delete record 				||"  
 echo "||	5. modify a record 				||"  
 echo "||	6. result of particular student 		||"  
 echo "||	7. exit						||"  
 echo "||******************************************************||"
 echo 
 echo " enter ur choice "  
 read d
 echo   
 
 case $d in  
 1)  
   echo " Enter division of student  "
   read div
   echo " enter rollnumber of student "  
   read rn  
   echo " enter name of student "  
   read nm  
   echo " enter marks OS "  
   read os  
   echo " enter marks COA "  
   read coa  
   echo " enter marks AT "  
   read at
   tot=`expr $os + $coa + $at`  
   record="$rn $nm $os $coa $at $tot"  
   echo $record>stud${div};;  
 2) 
   echo "Enter division of student  "
   read div
   echo " showing database of student"
   echo " Roll No.	Name 	OS COA AT Total "  
   cat stud${div} ;;  
 3)   
   echo " enter rollnumber of student "  
   read rn  
   echo " Enter division of student  "
   read div
   echo " enter name of student "  
   read nm  
   echo " enter marks OS "  
   read os  
   echo " enter marks COA "  
   read coa  
   echo " enter marks AT "  
   read at  
   tot=`expr $os + $coa + $at`
   record="$rn $nm $os $coa $at $tot "  
   echo $record>>stud${div}  
    ;;  
 4)
   echo " enter division of student  "
   read div 
   echo " enter roll number "  
   read rn  
   grep ^$rn stud${div}  
   if [ $? -ne 0 ]; then  
   echo "record for roll number does not exist "  
   else  
   var=`grep -nr ^$rn stud${div}| awk -F: '{ print $1 }'`
   echo $var
   `sed -i "$var"d stud${div}`  
   echo "deletion complete "  
   fi  
   ;;  
 5)
   echo " enter division of student  "
   read div 
   echo " enter roll number "  
   read rn1  
   grep ^$rn1 stud${div}  
   if [ $? -ne 0 ]; then  
   echo "record for roll number does not exist "  
   else  
   echo " enter roll number "  
   read rn  
   echo " enter name of student "  
   read nm  
   echo " enter marks OS "  
   read os  
   echo " enter marks COA "  
   read coa  
   echo " enter marks AT "  
   read at  
   tot=`expr $os + $coa + $at`
   record="$rn $nm $os $coa $at $tot"  
   var=`grep -nr ^$rn1 stud${div}| awk -F: '{ print $1 }'`  
   echo $var
   `sed -i "$var"d stud${div}`
   echo $record >> stud${div}
   fi
 ;;  
 6)
   echo " enter division of student  "
   read div 
   echo " enter roll number "  
   read rn  
   echo "printing result "  
   echo " Roll No.	Name 	OS COA AT Total "
   grep ^$rn stud${div}  
 ;;  
 7) ;;  
 * ) echo "enter right choice"  
 esac
done


