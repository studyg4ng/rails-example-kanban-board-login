# Assignment_SOLUTION  


## Cookie Stealing    
a.)  
- Export/Import Plugin (Chrome --> Firefox)  
- .txt files  
- reset??  

b.)  
Curl Docu:https://curl.haxx.se/docs/manual.html  
-c, --cookie-jar <filename> // specifify file where to write alle cookies  
-b, --cookie <data>  
curl https://kanban-2.herokuapp.com/ // gets html 

curl -v https://kanban-2.herokuapp.com/  

#### Getting a Cookie    
curl -v https://kanban-2.herokuapp.com 
curl --dump-header headers https://kanban-2.herokuapp.com // dumps head to "headers"
curl -c cookie-jar.txt https://kanban-2.herokuapp.com
curl -L -b cookie-jar.txt https://kanban-2.herokuapp.com

#### Cookie  
 _kanban_session=QzR4aXdVMHh2ZnM3NkF6N1Q5bG1NM3FTVWd3dWU4NHZTaldiZGRRZ3RZbXA5b2RmQ1A2MGh2TXRCYnkwVSs2QURUaCs2YjEvbmVQSHpCbFRObWpqZUk0Qm80a3RqZnF1OTVOZ2ZCU2RuMXNmTTRFWVd1c3RmdnBUTFBBS3Z0YTM2L3MvRFRRdHJhbDBJSUZKY1NWUGtBPT0tLUtyYm4vSWlQWXc1SHkxOUxTWTVYSXc9PQ%3D%3D--3fc6361ecf3e0716cbe16f9688964cfd2bf93a34; path=/; HttpOnly

#### Setting a Cookie  
http://stackoverflow.com/questions/10570341/is-it-possible-to-set-the-cookie-content-with-curl
curl -b, --cookie "_kanban_session=QzR4aXdVMHh2ZnM3NkF6N1Q5bG1NM3FTVWd3dWU4NHZTaldiZGRRZ3RZbXA5b2RmQ1A2MGh2TXRCYnkwVSs2QURUaCs2YjEvbmVQSHpCbFRObWpqZUk0Qm80a3RqZnF1OTVOZ2ZCU2RuMXNmTTRFWVd1c3RmdnBUTFBBS3Z0YTM2L3MvRFRRdHJhbDBJSUZKY1NWUGtBPT0tLUtyYm4vSWlQWXc1SHkxOUxTWTVYSXc9PQ%3D%3D--3fc6361ecf3e0716cbe16f9688964cfd2bf93a34;" https://kanban-2.herokuapp.com/  

c.) Documentary  