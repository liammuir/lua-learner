
function deleteCustomer(R, A)
   local Sql =[[
   DELETE FROM Customer WHERE ID = ]]
   
   Sql = Sql..R.params.id
   trace(Sql)
	local C = Connection()
   
   C:execute{sql=Sql}
   net.http.respond{body="Go to permission.", code=301,  headers={Location="http://localhost:6544/permission/"}}
end