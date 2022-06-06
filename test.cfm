<cfparam  name="user_id" default="v">
<cfset data=application.obj.printFunc(user_id)>
<cfinclude  template="master.cfm">
<body onload="printTable('print_div')">
    <cfdocument  format="pdf" filename="contact_data.pdf" overwrite="Yes" >        
            <h3 class="text-center">Contact List</h3> 
            <div id="print_div">       
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Date Of Birth</th>
                            <th>Gender</th>
                            <th>Address</th>
                            <th>Pincode</th>
                            <th>Email Id</th>
                            <th>Phone Number</th>
                        </tr>
                    </thead>
                    <cfoutput query="data">
                    <tbody>                
                        <cfset c_name= title & ". " & first_name & " " & last_name>
                        <cfset address_name= address & ", " & street_name & ", " & city & ", " & state & ", " & nation>
                        <tr>                    
                            <td>#c_name#</td>
                            <td>#dob#</td>
                            <td>#gender#</td>
                            <td>#address_name#</td>
                            <td>#pincode#</td>
                            <td>#email_id#</td>
                            <td>#phone_number#</td>
                        </tr>
                    </tbody>
                    </cfoutput>
                </table>
            </div>
    </cfdocument>
    <cfset path =expandPath('.') & '\' &'contact_data.pdf'>
    <cfprint type="pdf" source="#path#" printer="OneNote (Desktop)">
     
    <div id="print_div">       
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Date Of Birth</th>
                            <th>Gender</th>
                            <th>Address</th>
                            <th>Pincode</th>
                            <th>Email Id</th>
                            <th>Phone Number</th>
                        </tr>
                    </thead>
                    <cfoutput query="data">
                    <tbody>                
                        <cfset c_name= title & ". " & first_name & " " & last_name>
                        <cfset address_name= address & ", " & street_name & ", " & city & ", " & state & ", " & nation>
                        <tr>                    
                            <td>#c_name#</td>
                            <td>#dob#</td>
                            <td>#gender#</td>
                            <td>#address_name#</td>
                            <td>#pincode#</td>
                            <td>#email_id#</td>
                            <td>#phone_number#</td>
                        </tr>
                    </tbody>
                    </cfoutput>
                </table>
            </div>
</body>
<cfinclude template="footer.cfm">