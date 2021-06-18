AutoNumber()

{

            local pno=0     

            f=0

            for j in `cat Player1.txt`

            do

                        pno=$(echo "$j" | cut -d "," -f 1)

                        f=1

            done

            if [ $f = 1 ]

            then

                        pno=`expr $pno + 1`

            else

                        pno=1

            fi

            echo $pno

}


Insert()

{

            clear

           

            pno=$1           

            echo "Enter Player No: $pno"

           

            echo "Enter Player Name: \c"

            read pnm

            
            echo "Enter Player Age : \c"

            read page
              
            echo "Enter Player Address: \c"

            read padd


            echo "Enter Player Gender: \c"

            read pgen

           

            echo "Enter Player team : \c"

            read pteam

            echo "Enter Player High Score : \c"

            read phs

           

            echo "$pno,$pnm,$page,$padd,$pgen,$pteam,$phs,true" >> Player1.txt

            echo "                 Insert Sucessfully                           "

}

Display()

{

            clear

            echo "--------------------------------------------------------------------------------------------------"                       

            echo "                              Player Details "

            echo "--------------------------------------------------------------------------------------------------"                       

            echo "--------------------------------------------------------------------------------------------------"                       

            echo "#PNO | PNAME | PAGE | PADD | PGEN | PTEAM | PHS"    

        

            for j in `cat Player1.txt`

            do

                        pno=$(echo "$j" | cut -d "," -f 1)

                        pnm=$(echo "$j" | cut -d "," -f 2)

                        page=$(echo "$j" | cut -d "," -f 3)

                        padd=$(echo "$j" | cut -d "," -f 4)

                        pgen=$(echo "$j" | cut -d "," -f 5)

                       

                        pteam=$(echo "$j" | cut -d "," -f 6)

                        phs=$(echo "$j" | cut -d "," -f 7)

                        tfval=$(echo "$j" | cut -d "," -f 8)

                        if [ $tfval = "true" ]

                        then

 

                                 echo "-----------------------------------------------------------"

                                  echo "| $pno | $pnm | $page | $padd | $pgen | $pteam | $phs |"

                        fi

            done   

            echo "--------------------------------------------------------------------------------------------------"                       

}

Search()

{

            clear

            echo "Enter Player NO: \c"

            read no

            echo "--------------------------------------------------------------------------------------------------"                       

            echo "                 Player Details                       "

            echo "--------------------------------------------------------------------------------------------------"                       

            flag=0

            for j in `cat Player1.txt`

            do

                        pno=$(echo "$j" | cut -d "," -f 1)

                        pnm=$(echo "$j" | cut -d "," -f 2)

                        page=$(echo "$j" | cut -d "," -f 3)

                        padd=$(echo "$j" | cut -d "," -f 4)

                        pgen=$(echo "$j" | cut -d "," -f 5)

                        pteam=$(echo "$j" | cut -d "," -f 6)

                        phs=$(echo "$j" | cut -d "," -f 7)

                        tfval=$(echo "$j" | cut -d "," -f 8)

                                               

                        if [ $no -eq $pno ] && [ $tfval = "true" ]

                        then

                                    flag=1
                                 echo "----------------------------------------------------------------------------"                        

                                    echo "  PNo : $pno                      PName : $pnm            "  

                                    echo "-------------------------------------------------------------------------"                        

                                    echo "  PAge                    :                      $page   "

                                    echo "  PAdd                    :                      $padd   "

                                    echo "  PGen                    :                      $pgen   "

                                    echo "-------------------------------------------------------------------------"                        

                                    echo "  PTeam                    :                      $pteam   "

                                    echo "-------------------------------------------------------------------------"                        

                                    echo "  PHs                      :                      $phs   "

                                    echo "-------------------------------------------------------------------------"                        

                        fi

            done

            if [ $flag = 0 ]

            then

                 echo "               No Record Found              "

            fi

            echo "-----------------------------------------------------------------------------------------------"                          

}

Delete()

{

            clear

            f=0

            echo "Enter Player NO: \c"

            read no

            for j in `cat Player1.txt`

            do

                        pno=$(echo "$j" | cut -d "," -f 1)

                        pnm=$(echo "$j" | cut -d "," -f 2)

                        page=$(echo "$j" | cut -d "," -f 3)

                        padd=$(echo "$j" | cut -d "," -f 4)

                        pgen=$(echo "$j" | cut -d "," -f 5)

                        pteam=$(echo "$j" | cut -d "," -f 6)

                        phs=$(echo "$j" | cut -d "," -f 7)

                       

                        if [ $no -eq $pno ]

                        then

                                    f=1                              

                                    line=$(echo "$pno,$pnm,$page,$padd,$pgen,$pteam,$phs,false")

                                    fnm=`cat Player1.txt`

                                    d=$(echo "$fnm" | sed s/$j/$line/g )

                                    echo $d > Player1.txt          

                                    echo "                 Delete Successfully                           "

                        fi

            done

            if [ f = 0 ]

            then

                          echo "               No Record Found              "

            fi

}

Update()

{

            clear

            echo "Enter Player NO: \c"

            read no

                       

            for j in `cat Player1.txt`

            do

                        pno=$(echo "$j" | cut -d "," -f 1)

                        pnm=$(echo "$j" | cut -d "," -f 2)

                        page=$(echo "$j" | cut -d "," -f 3)

                        padd=$(echo "$j" | cut -d "," -f 4)

                        pgen=$(echo "$j" | cut -d "," -f 5)

                        pteam=$(echo "$j" | cut -d "," -f 6)

                        phs=$(echo "$j" | cut -d "," -f 7)

                       

                        if [ $no -eq $pno ]

                        then

                                    echo "-----------------------------Enter New Record--------------------------------"

                                    echo "Enter Player No: $pno"

           

                                    echo "Enter Player Name: \c"

                                    read pnm

                                    echo "Enter Player Age: \c"

                                    read page

           

                                    echo "Enter Player Address : \c"

                                    read padd

           

                                    echo "Enter Player Gender: \c"

                                    read pgen

           

                                    echo "Enter Player Team : \c"

                                    read pteam

                                    echo "Enter Player High Score : \c"

                                    read phs

           

                                    line=$(echo "$pno,$pnm,$page,$padd,$pgen,$pteam,$phs,true")

                                    #line=$(echo "$eno,$snm,$m1,$m2,$m3,$total,$per,true")

                                    fnm=`cat Player1.txt`

                                    d=$(echo "$fnm" | sed s/$j/$line/g )

                                    echo $d > Player1.txt          

                                   

                                    echo "                 Update Sucessfully                           "

                        fi

            done

}



while [ true ]

do

echo " ------------------------------------"

echo " 1. Insert  "

echo " 2. Delete  "

echo " 3. Update  "

echo " 4. Display "

echo " 5. Search  "

echo " 6. Exit    "

echo " ------------------------------------" 

echo "Enter Choice: \c"

read ch

case $ch in

            1)

               nxtSrNo=$(AutoNumber)

               Insert $nxtSrNo

               ;;

            2) Delete ;;

            3) Update ;;

            4) Display ;;

            5) Search ;;

            6) break;;

            *) echo " Wrong Choice "

esac

done


