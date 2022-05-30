<cfif isDefined("url.excel")>
<cfheader name="Content-Disposition" value="inline; filename=addressBook.xls">
<cfcontent type="application/vnd.msexcel"> 
<cfset newInstance = createObject("component","ADDRESSBOOK.components.userdefined")> 
<cfset result = newInstance.getDirectoryInfo()> 

    <div class="panel-list card2">
        <h3>Address Book</h3>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query =result>
                    <tr>
                        <td>#firstName#</td>
                        <td>#email#</td>
                        <td>#phone#</td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>
</cfif>



