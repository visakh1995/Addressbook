<cffunction  name="printAddressBook" access="remote">
    <cfquery name="directoryList">
        SELECT *FROM coldfusiion.adbookcontacts WHERE 
        userId = <cfqueryparam  CFSQLType = "cf_sql_varchar" value="#Session.addressBookCredentials.id#">
     </cfquery>
    <cfdocument format="PDF" fileName="../files/file.pdf" overwrite="yes"> 
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
                    <cfoutput query =directoryList>
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
    <cfprint type="pdf" source="../files/file.pdf" printer="Microsoft Print to PDF">
        <cfheader name="content-diposition" value="inline; filename=addressBook.pdf">
        <cfcontent type="application/pdf" file="C:\Coldfusion2021\cfusion\wwwroot\ADDRESSBOOK\files\file.pdf">
        <cflocation  url="http://127.0.0.1:8500/ADDRESSBOOK/pages/dashboard.cfm">
</cffunction>