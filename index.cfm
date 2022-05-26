<ORMReload()>
<cfset test = entityLoad("contacts")>
<cfset addressDirectory = entityLoad("adbookcontacts")>

<cfdump var ="#test#">
<cfdump var ="#addressDirectory#">
<cfset jsonise = serializeJSON( addressDirectory )>
<!--- <cfdump var =#jsonise#> --->
<cfset sData = deserializeJSON(jsonise)> 

        <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
                
                <cfoutput>
                <cfloop array ="#sData#" index="idex">
                    <tr>
                        <td>#idex.firstName#</td>
                        <td>#idex.email#</td>
                        <td>#idex.phone#</td>
                        <td>#idex.status#</td>
                    </tr>
                </cfloop>
              </cfoutput>
            </tbody>
          </table>
 






