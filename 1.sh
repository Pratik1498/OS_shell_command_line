clear
echo -e "NAME\tNUMBER\t">>spn1.txt
i="y"
while [ $i = "y" ]
do
echo "1.add"
echo "2.view"
echo "3.search"
echo "4.update"
echo "5.delete"
echo "6.exit"
echo "enter your choice"
read ch
  case $ch in
    1)echo "enter name"
      read name
      if  grep -i "$name" spn1.txt
      then
      echo "name already exists.Please try again with another name"
      else
      echo "how many numbers?"
      read d
      for (( c=1; c<=$d; c++ ))
      do  
        echo "enter number"
        read num
        if [ ${#num} == 10 ]
        then 
         if  grep -i "$num" spn1.txt
         then
         echo "number already exists.Please try again with another number"
         else
         echo -e "$name\t$num">>spn1.txt
         fi
        else 
        echo "number of digits are less than or greater than 10 hence not accepted"
        fi
      done
      fi
      ;;
    2)cat spn1.txt;;
    3)echo "enter name or number to search"
      read a
        grep -i "$a" spn1.txt;;
    4)echo "enter name whose contact is to be updated"
      read b
      echo "enter new number"
      read n
      num=n
      sed -i -e "/$b/d" spn1.txt
      echo -e "$b\t$n">>spn1.txt;;
    5)echo "DELETE CONTACT"
      read -p "enter contact name or number to be deleted :" delete_string
      sed -i -e "/$delete_string/d" spn1.txt
      echo "delete succesfully";;
    6)exit;;

    *)echo "invalid choice";;
  esac

echo "Do you want to continue? , if you want to continue press y else press anything"
read i
if [ $i != "y" ]
then
  exit
fi
done

