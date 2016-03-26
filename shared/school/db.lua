function Connection()
   return db.connect{api=db.SQLITE, name='school'}
end

function Create(C)
   local Sql =[[
   CREATE TABLE Customer(ID INTEGER PRIMARY KEY, LastName TEXT, FirstName TEXT);   
   ]]
   C:execute{sql=Sql, live=true}
   
end