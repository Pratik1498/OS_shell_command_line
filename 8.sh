 clear


Insert()
{
    clear
	
    
    echo "Enter your No:"
    read  accn
    
    if grep -w "$accn" bank.txt 
    then
	echo "Account Already Exist"
    else

    	echo "Enter your Name:  "
    	read name
	        
    	echo "Enter your Address: "
    	read addr
    
    	echo "Enter your Age : "
    	read age
   	echo "Enter your Gender: "
    	read gen
    	echo "Enter your contact no : "
    	read cont
    	echo "Enter your aadhar number : "
    	read aadhar
   

	c=-1
	n=$aadhar

	for((c=0;n>=0;n--))
	do
		n=`expr $n/10`
		c=`expr $c + 1`
	done



	if (test $c -eq 10)
	then
	echo "$accn,$name,$addr,$age,$gen,$cont,$aadhar" >> bank.txt
	echo "***** Inserted Sucessfully *****"
	else
	echo "Only 10 digits are allowed in aadhar number"
	fi
   	
fi   
}

Display()
{
    clear

    echo "Enter your account no: "
    read no
    
    
    echo " ORDER : account no , name , address , age ,gender , contact no , aadhar no "
        
    grep -w "$no" bank.txt 
            
}


Delete()
{
    clear
     echo "Enter your account number :  "
    read no
     if grep -w "$no" bank.txt 
    then
	
   
    grep -v -w "$no" bank.txt > file1.txt
    cat file1.txt > bank.txt
    truncate -s 0 file1.txt
    echo "***** Deleted Sucessfully *****"
    else
    echo "******Account does not exist*****"
    fi
}

UpdateNo()
{
	echo "Account no: "
  	read no1


if grep -w "$no1" bank.txt 
    then
    
    echo "Enter your Name:  "
    read name
	        
    echo "Enter your Address: "
    read addr
    
    echo "Enter your Age : "
    read age
    echo "Enter your Gender: "
    read gen
    echo "Enter your contact no : "
    read cont
    echo "Enter your aadhar number : "
    read aadhar


    record=" $no1,$name,$addr,$age,$gen,$cont,$aadhar"
    var=`grep -n ^$no1 bank.txt| cut -c -1`
    #echo $var
    var1=`expr $var  - 1`
    head -$var1 bank.txt>temp
    echo $record>>temp
    var3=`wc -l<bank.txt`
    var2=`expr $var3 - $var`
    tail -$var2 bank.txt>>temp
    cp temp bank.txt
else 
    echo " Account Not Exist !!!"
fi
 

}



while [ true ]
do
echo " _______________________________"
echo " 1. Insert  "
echo " 2. UpdateNo   "
echo " 3. Delete "
echo " 4. Display  "
echo " 5. Exit " 
echo " _______________________________" 
echo "Enter Choice: "
read ch

case $ch in

          
        
            1) Insert ;;
            2) UpdateNo ;;
            3) Delete ;;
            4) Display ;;
            5) break ;;
            *) echo " Wrong Choice "
esac
done
	

