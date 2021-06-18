

Insert()
{
clear
 
echo "Enter Book Id: "  
read bno    
grep ^$bno Libraryy  
if [ $? -ne 0 ]; then    
echo "Enter Book Name: "
read bname
echo "Enter Book Author: "
read bauth
 
echo "Enter Book Price : "
read bprice
  
echo "$bno  \t  $bname  \t  $bauth  \t  $bprice  \t true" >> Libraryy

echo "---- Insert Sucessfully ----- "
else
          echo "Book id is already present.."
fi
return
}

Display()
{
         echo ".......Database of Library........"
         echo "Book Id \t Book Name \t Author \t Book Price "
         cat Libraryy
         return
}

Delete()
{
   echo " enter Library Id: "  
         read sid 
         grep ^$sid Libraryy 
         if [ $? -ne 0 ]; then  
         echo "record for book id does not exist "  
         else  
         grep -v $sid Libraryy>tmp  
         cp tmp Libraryy
         echo "deletion complete "  
         fi  
         return
}

Update()
{
  echo "Enter Book Number: "
  read no1
  grep ^$no1 Libraryy
if [ $? -ne 0 ]; then
echo "Book Id not found"
else 
echo "Enter book name: "
read bname
echo "enter book author: "
read bauth
echo "enter book price: "
read bprice
record=" $no1  \t $bname  \t  $bauth  \t  $bprice"
var=`grep -n ^$no1 Libraryy| cut -c 1`
echo $var
var1=`expr $var - 1`
head -$var1 Libraryy>temp
echo $record>>temp
var3=`wc -l<Libraryy`
var2=`expr $var3 - $var `
tail -$var2 Libraryy>>temp
cp temp Libraryy
fi
return

 
}


while [ true ]
do
echo " _______________________________"
echo " 1. Insert  "
echo " 2. Delete  "
echo " 3. Update  "
echo " 4. Display "
echo " 5. Exit    "
echo " _______________________________" 
echo "Enter Choice: "
read ch

case $ch in

  1)Insert;;
  2) Delete ;;
  3) Update ;;
  4) Display ;;
  5) break ;;
  *) echo " Wrong Choice "
esac
done
