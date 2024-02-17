ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('mg_namechange:event')
AddEventHandler('mg_namechange:event', function(fName, lName)
   -- print(fName, lName)
   local xPlayer = ESX.GetPlayerFromId(source)
   -- print(json.encode(xPlayer, { indent = true}))

   if xPlayer then
      MySQL.Async.transaction(

         {
            'UPDATE users SET firstname = @fName WHERE identifier = @newfirstname',
            'UPDATE users SET lastname = @lName WHERE identifier = @newsecondname',
         },
         {
            -- FirstName
            ['fName'] = fName,
            ['newfirstname'] = xPlayer.identifier,

            -- LastName
            ['lName'] = lName,
            ['newsecondname'] = xPlayer.identifier
         }

      )
      print('First name has been changed')
   end
end)