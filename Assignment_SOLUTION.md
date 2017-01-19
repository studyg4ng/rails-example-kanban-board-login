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

#### Setting a Cookie  
http://stackoverflow.com/questions/10570341/is-it-possible-to-set-the-cookie-content-with-curl

c.) Documentary  