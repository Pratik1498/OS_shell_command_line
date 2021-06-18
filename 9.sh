clear
i="y"
echo "Enter name of database "
read db
while [ $i = "y" ]
do
clear
echo "*****MOVIE DATABASE*****"
echo "1.View the Data Base"
echo "2.View Specific Records "
echo "3.Add Records "
echo "4.Delete Records "
echo "5.Update Records "
echo "6.Exit "
echo "Enter your choice "
read ch
    case $ch in
        1)echo NAME  DIRECTOR  ACTOR  ACTORESS  RATINGS
          cat $db;;
        2)echo "Enter Director's Name "
          read d
          grep -i "$d" $db;;
        3)echo "Enter Name of Movie: "
           read n
           echo "Enter Director's Name:"
           read d
           echo "Enter Actor's Name"
           read a
           echo "Enter Actoress's Name"
           read ac
           echo "Enter Ratings"
           read r
          echo "$n    $d    $a    $ac    $r">>$db;;
        4)echo "Enter Name of Movie : "
	  read n
	  grep ^$n $db
	  if [ $? -ne 0 ]; then
	  echo "Record Does not exist "
	  else
	  grep -v $n $db>>temp
	  cp temp $db	
	  echo "Record Deleted"
	  rm temp
	  fi
	  ;;
        5)echo "Enter existing Name of Movie : "
	  read n
	  old=`grep ^$n $db`
	  if [ $? -ne 0 ]; then
	  echo "Record does not exist "
	  else
	  echo "Old Record : $old"
	  grep -v $n $db>>temp
	  cp temp $db
	  echo "Enter details of new record "
	  echo "Enter Name of Movie: "
              read n
              echo "Enter Director's Name:"
              read d
              echo "Enter Actor's Name"
              read a
              echo "Enter Actoress's Name"
              read ac
              echo "Enter Ratings"
              read r
	  record="$n $d $a $ac $r"
	  echo $record>>$db 		 
	  rm temp
	  fi
	  ;;
        6)exit;;
        *)echo "Invalid choice ";;
    esac
echo "Do u want to continue ?"
read i
if [ $i != "y" ]
then
    exit
fi
done         

