<cfset newInstance = createObject("component","ADDRESSBOOK.components.userdefined")> 
<cfset result = newInstance.getDirectoryInfo()>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" type="text/css" 
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <script src="../scripts/script.js"></script>
    </head>
    <body onload="printTable('print_div')">
        <cfdocument format="PDF" filename="contact_data.pdf" overwrite="Yes"> 
            <div id="print_div">
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
                                    <td><img src="../uploads/#getFileFromPath(photo)#"></a></td>
                                    <td>#firstName#</td>
                                    <td>#email#</td>
                                    <td>#phone#</td>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </div>
        </cfdocument> 
        <cfset path =expandPath('.') & '\' &'contact_data.pdf'>
        <cfprint type="pdf" source="#path#" printer="Microsoft Print to PDF">
        <div id="print_div">  
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
        </div>
    </body>
</html>



