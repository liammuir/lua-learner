require 'school.db'

local Template=[[
<html>
<head>
<style>

table {
border-collapse : collapse;
}
table, th, td {
   border: 1px solid #COLOUR#;
}
</style>
</head>
<body>
<p>
Welcome to Liam's School Business
</p>
<p>
<table>
<tr><th>Id</th><th>Name</th><th>LastName</th><th>delete</th></tr>
#TABLE_CONTENT#
</table>
</p>
<p>PS: #MSG#</p>
<a href="add_customer">Add a customer!</a><br />
</body>
</html>
]]

function RandomColor()
   local Colors = {'red', 'blue', 'green', 'black'}
   return Colors[math.random(4)]
end

function RandomMsg()
   local Msgs = {'Hamsters are cute!','You are sweet!','Rats are not ugly!'}
	return Msgs[math.random(3)]
end 


function CustomerList(R, A)
   --local C = db.connect{api=db.MY_SQL, name='school', user='uroot', password='password'}
   local C = Connection()
   --Create(C)
   local R = C:query{sql="SELECT * FROM CUSTOMER"}
   trace(R)
   trace(#R)
   local Info = ''
   for i=1, #R do  
      Info = Info .. "<tr><td>"..R[i].ID..'</td><td>'..R[i].FirstName..'</td><td>'..R[i].LastName..'</td><td><a href="delete_customer?id='.. R[i].ID ..'">delete</a></td></tr>\n'
   end
   local H = Template
--   local table = {red, blue}
   H = H:gsub("#TABLE_CONTENT#", Info)
   H = H:gsub("#COLOUR#", RandomColor()) 
   H = H:gsub("#MSG#", RandomMsg())
   
   net.http.respond{body=H}
end
