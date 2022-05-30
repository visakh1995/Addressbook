<cfif isDefined("url.pdf")>
    <cfinclude template="../section/header.cfm">
    <cfset newInstance = createObject("component","ADDRESSBOOK.components.userdefined")> 
    <cfset result = newInstance.getDirectoryInfo()>
    <cfdocument format="PDF"> 
        <div class="panel-list card2">
            <cfdocumentitem type="header">
                <font size="-3"><i>Directory Report</i></font>
            </cfdocumentitem>
            <h3>Address Book</h3>
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <cfoutput query =result>
                        <tr>
                            <td><img width="5px" src="../uploads/#getFileFromPath(photo)#"></a></td>
                            <td>#firstName#</td>
                            <td>#email#</td>
                            <td>#phone#</td>
                        </tr>
                    </cfoutput>
                </tbody>
            </table>
        </div>
    </cfdocument> 
</cfif>
