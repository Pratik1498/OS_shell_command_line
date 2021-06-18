Create()
{
          echo "Enter student Id"
          read stdid
          echo "Enter name"
          read name
          echo "Enter address"
          read add
          echo "Enter phone number"
          read ph
          echo "Enter Course name"
          read course
          title="STDID  Name                Address        Contact    Course    "   
          stud="$stdid  $name               $add           $ph        $course"
          echo $title>Studentinfo
          echo $stud>>Studentinfo 
          return
}
Insert()
{
          echo "Enter student Id"
          read sid
          grep ^$sid Studentinfo  
          if [ $? -ne 0 ]; then     
          echo "Enter name"
          read name
          echo "Enter address"
          read add
          echo "Enter phone number"
          read ph
          echo "Enter Course name"
          read course 
          stud="$stdid  $name               $add           $ph        $course" 
          echo $stud>>Studentinfo
          else
          echo "Student id is already present.."
          fi
          return
}

View()
{
         echo ".......Database of Student........"
         cat Studentinfo
         return
}

Delete()
{
         echo " enter student Id"  
         read sid 
         grep ^$sid Studentinfo  
         if [ $? -ne 0 ]; then  
         echo "record for roll number does not exist "  
         else  
         grep -v $sid Studentinfo>tmp  
         cp tmp Studentinfo  
         echo "deletion complete "  
         fi  
         return
} 
Update()
{
         echo " Enter student Id"  
         read sid  
         grep ^$sid Studentinfo  
         if [ $? -ne 0 ]; then   
         echo "Student ID does not found"  
         else  
         echo "Enter Name of Student"  
         read name  
         echo "Enter address"  
         read add  
         echo "Enter phone number"  
         read phone  
         echo "Enter course"  
         read course  
         record="$sid $name $add $phone $course "  
         var=`grep -n ^$sid Studentinfo| cut -c 1` 
         echo $var                                 
         var1=`expr $var - 1`                     
         head -$var1 Studentinfo>temp                    
         echo $record>>temp                        
         var3=`wc -l < Studentinfo`  
         var2=`expr $var3 - $var `              
         tail -$var2 Studentinfo>>temp  
         cp temp Studentinfo 
         fi
         return  
}

Individual()
{
          echo " Enter Student ID "  
          read sid  
          echo "printing result "  
          grep ^$sid Studentinfo
          return
}
Menu()
{
          echo "1.Create database"
          echo "2.view Database"
	  echo "3.Insert new data"
	  echo "4.delete data"
	  echo "5.Update data"
	  echo "6.Fetch Individual Record"
	  echo "7.Exit"
}

         

clear
echo "..............Menu..........."
Menu
echo "Enter your choice"

read ch

while [ $ch -ne 7 ]
do
     case $ch in
       1) 
          Create ;;
       2)  
          View ;;
       3)
          Insert ;;
       4)
          Delete ;;
       5)
          Update ;;
       6)
          Individual ;;
       * )
           echo "Enter Valid Option"
     esac 

echo "................Menu................"
Menu         
echo "Enter your choice"
read ch
done



