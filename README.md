# Easily Finding the Time Anywhere in the World with Bash

As a Linux Terminal user who often communicates with people in different time zones, I need a way to check the time without disturbing anyone or switching to a desktop application. This script solves that problem !

To run the script, just type the following :
<pre>
> $ ./w.sh <br>
San Francisco:       Wed 18 Jan 11:04:34 PST 2023 
Denver:              Wed 18 Jan 12:04:34 MST 2023 
New York City:       Wed 18 Jan 14:04:34 EST 2023 
Dublin:              Wed 18 Jan 19:04:35 GMT 2023 
London:              Wed 18 Jan 19:04:35 GMT 2023 
Amsterdam:           Wed 18 Jan 20:04:35 CET 2023 
Zurich:              Wed 18 Jan 20:04:35 CET 2023 
Bratislava:          Wed 18 Jan 20:04:35 CET 2023 
Warsaw:              Wed 18 Jan 20:04:35 CET 2023 
</pre>
FYI - The timezone information files used by tzset(3) are typically found under a directory with a name like /usr/share/zoneinfo
