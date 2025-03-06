while true
do
 horas=$(uptime -p | grep -e “hour” | cut -d “ “ -f 2)
 if [ -n “$horas” ]
 then
  if [ $horas -ge 8 ]
  then
   poweroff
  fi
 fi
done

