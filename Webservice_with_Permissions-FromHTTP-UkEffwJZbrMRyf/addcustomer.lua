require 'school.db'

local HTML=[[
<html>
<body>
<form action="add_customer_data">
FirstName: <input name="first_name" type="text">

LastName: <input name="last_name" type="text">
<input type="submit">
</form>

</body>
</html>
]]



function AddCustomer(R,A)
   net.http.respond{body=HTML}
end

function ProcessAddCustomer(R,A)
   local C = Connection()
   local Sql = "INSERT INTO Customer(FirstName, LastName) Values("
   ..C:quote(R.params.first_name)..","..C:quote(R.params.last_name)..")"
   trace(Sql)
   C:execute{sql=Sql}
   net.http.respond{body="Go to school.", code=301,  headers={Location="http://localhost:6544/permission/"}}
end