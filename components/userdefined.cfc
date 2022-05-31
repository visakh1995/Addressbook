<cfcomponent>

    <cffunction  name="addressBookSignup" access="remote" output="true" returnType="string">
        <cfargument  name="fullName" type="string" required="yes">
        <cfargument  name="emailId" type="string" required="yes">
        <cfargument  name="userName" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfargument  name="confirmPassword" type="string" required="yes">
        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfset local.aErrorMessages =  "">
        <cfif arguments.fullName EQ ''>
            <cfset local.aErrorMessages = 'Please provide your fullname'/>
        </cfif>
        <cfif arguments.emailId EQ '' OR NOT isValid("email",arguments.emailId)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
         </cfif>
        <cfif arguments.userName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid user name'/>
        </cfif>
        <cfif arguments.password EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid password'/>
        </cfif>
        <cfif arguments.confirmPassword EQ ''>
            <cfset local.aErrorMessages = 'Confirm password field cant be empty'/>
        </cfif>
        <cfif arguments.confirmPassword NEQ arguments.password>
            <cfset local.aErrorMessages = 'password does not match!'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cflocation  url="../auth/signup.cfm?aMessages=#local.aErrorMessages#">
        <cfelse>
            <cfparam name="arguments.fullName" default="">
            <cfparam name="arguments.emailId" default="">
            <cfparam name="arguments.userName" default="">
            <cfparam name="arguments.password" default="">
            <cfparam name="arguments.confirmPassword" default="">

            <cfquery name="emailVerify">
                SELECT *FROM coldfusiion.addressbook_register WHERE emailId = "#arguments.emailId#";
            </cfquery>
            <cfquery name="userNameVerify">
                SELECT *FROM coldfusiion.addressbook_register WHERE userName = "#arguments.userName#";
            </cfquery>
            <cfif emailVerify.RecordCount neq 0>
                <cfset local.aErrorMessages = 'The email already registered'/>
                <cflocation  url="../auth/signup.cfm?aMessages=#local.aErrorMessages#">
            </cfif> 
            <cfif userNameVerify.RecordCount neq 0>
                <cfset local.aErrorMessages = 'The username already registered'/>
                <cflocation  url="../auth/signup.cfm?aMessages=#local.aErrorMessages#">
            </cfif> 

            <cfquery name="addData" result = result >
                INSERT INTO coldfusiion.addressbook_register(fullName,emailId,userName,password,status)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.fullName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.emailId#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.userName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.encodedPassword#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="1">      
                )
            </cfquery>
        <cfset local.message  ="Application submitted successfully">
        <cflocation  url="../auth/signup.cfm?aMessageSuccess=#local.message#">   
        </cfif>
    
    </cffunction>

    <cffunction  name="addressBookLogin" access="remote" output="true" returnType="string">
        <cfargument  name="userName" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfquery name="verifiedDetails">
            SELECT *FROM coldfusiion.addressbook_register WHERE 
            userName = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.userName#"> AND 
            password = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#local.encodedPassword#">
        </cfquery>

        <cfif verifiedDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"addressBookCredentials")>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.addressBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"addressBookCredentials")>
                <cfset Session.addressBookCredentials["id"] = "#verifiedDetails.id#">
                <cfset Session.addressBookCredentials["userName"] = "#verifiedDetails.userName#">
                <cfset Session.addressBookCredentials["password"] = "#verifiedDetails.password#">
                <cfset Session.addressBookCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation  url="../pages/dashboard.cfm"> 
        <cfelse>
            <cfset local.message  ="Invalid username or password">
            <cflocation  url="../auth/login.cfm?aMessages=#local.message#">  
        </cfif>
    </cffunction>

    <cffunction name="loggedOut" access="remote" output="true">
        <cfset StructDelete(Session, "addressBookCredentials")>
        <cflocation  url="../auth/login.cfm">
    </cffunction>

    <cffunction name="addressBookCreateContactForm" access="remote" output="true">
        <cfargument name="title" type="string" required="true">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="dob" type="string" required="true">
        <cfargument name="photo" type="string" required="true">
        <cfargument name="address" type="string" required="true">
        <cfargument name="pinCode" type="string" required="true">
        <cfargument name="street" type="string" required="true">
        <cfargument name="phone" type="string" required="true">
        <cfargument name="checks" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.title EQ ''>
            <cfset local.aErrorMessages = 'Please provide your title'/>
        </cfif>
        <cfif arguments.email EQ '' OR NOT isValid("email",arguments.email)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
         </cfif>
        <cfif arguments.lastName EQ ''> 
        <cfset local.aErrorMessages = 'Please provide valid last name'/>
        </cfif> 
        <cfif arguments.dob EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid dob'/>
        </cfif>
        <cfif arguments.photo EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid photo'/>
        </cfif>
        <cfif arguments.address EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid address'/>
        </cfif>
        <cfif arguments.pinCode EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid Pincode'/>
        </cfif>
        <cfif arguments.street EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid street name'/>
        </cfif>
        <cfif arguments.phone EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid phone'/>
        </cfif>
        <cfif arguments.checks EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid gender option'/>
        </cfif>
        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cflocation  url="../pages/dashboard.cfm?aMessages=#local.aErrorMessages#">
        <cfelse>
            <cffile action="upload"
            fileField="photo"
            nameconflict="overwrite"
            destination="C:\coldFusion2021\cfusion\wwwroot\ADDRESSBOOK\uploads\">
    
            <cfset local.imageValue = #cffile.serverFile#>
            <cfparam name="arguments.title" default="">
            <cfparam name="arguments.firstName" default="">
            <cfparam name="arguments.lastName" default="">
            <cfparam name="arguments.email" default="">
            <cfparam name="arguments.password" default="">
            <cfparam name="arguments.dob" default="">
            <cfparam name="arguments.address" default="">
            <cfparam name="arguments.pinCode" default="">
            <cfparam name="arguments.street" default="">
            <cfparam name="arguments.phone" default="">
            <cfparam name="arguments.checks" default="">
            <cfparam name="imageValue" default="">
            <cfparam name="arguments.status" default="1">

            <cfparam name="Session.addressBookCredentials.id" default="Not Authenticated">
            <cfquery name="addData" result = result>
                INSERT INTO coldfusiion.adbookcontacts(userId,title,firstName,lastName,email,gender,dob,
                photo,address,phone,street,pincode,status)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="#Session.addressBookCredentials.id#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.title#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.firstName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.lastName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.email#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.checks#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.dob#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#imageValue#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.address#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.phone#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.street#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.pinCode#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Contact created successfully">
            <cflocation  url="../pages/dashboard.cfm?aMessageSuccess=#local.message#"> 
        </cfif>
    </cffunction>

    <cffunction  name="listContacts" access="remote">
        <cfquery name="list">
            SELECT * FROM coldfusiion.addressbook_contacts
        </cfquery>
        <cfreturn list>
    </cffunction>

    <cffunction name="addressBookDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="deleteData">
            DELETE FROM coldfusiion.adbookcontacts WHERE 
            contactId = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
        </cfquery>
        <cfset local.message  ="Contact deleted successfully">
        <cflocation  url="./pages/dashboard.cfm?aMessages=#local.message#"> 
    </cffunction>

    <cffunction name="addressBookUpdateContactForm" access="remote">
        <cfargument name="contactId" type="string" required="true">
        <cfargument name="title" type="string" required="true">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="dob" type="string" required="true">
        <cfargument name="photo" type="string" required="true">
        <cfargument name="defaultPhoto" type="string" required="true">
        <cfargument name="address" type="string" required="true">
        <cfargument name="pinCode" type="string" required="true">
        <cfargument name="street" type="string" required="true">
        <cfargument name="phone" type="string" required="true">
        <cfargument name="checks" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.title EQ ''>
            <cfset local.aErrorMessages = 'Please provide your title'/>
        </cfif>
        <cfif arguments.email EQ '' OR NOT isValid("email",arguments.email)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
         </cfif>
        <cfif arguments.lastName EQ ''> 
        <cfset local.aErrorMessages = 'Please provide valid last name'/>
        </cfif> 
        <cfif arguments.dob EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid dob'/>
        </cfif>
        <cfif arguments.address EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid address'/>
        </cfif>
        <cfif arguments.pinCode EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid Pincode'/>
        </cfif>
        <cfif arguments.street EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid street name'/>
        </cfif>
        <cfif arguments.phone EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid phone'/>
        </cfif>
        <cfif arguments.checks EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid gender option'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cflocation  url="../pages/dashboard.cfm?aMessages=#local.aErrorMessages#">
        <cfelse> 
            <cfparam name="arguments.title" default="">
            <cfparam name="arguments.firstName" default="">
            <cfparam name="arguments.lastName" default="">
            <cfparam name="arguments.email" default="">
            <cfparam name="arguments.password" default="">
            <cfparam name="arguments.dob" default="">
            <cfparam name="arguments.address" default="">
            <cfparam name="arguments.pinCode" default="">
            <cfparam name="arguments.street" default="">
            <cfparam name="arguments.phone" default="">
            <cfparam name="arguments.checks" default="">
            <cfparam name="imageValue" default="">
            <cfparam name="arguments.status" default="1">
            <cfparam name="Session.addressBookCredentials.id" default="Not Authenticated">

            <cfif len(trim(arguments.photo)) NEQ 0>
                <cffile action="upload"
                fileField="photo"
                nameconflict="overwrite"
                destination="C:\coldFusion2021\cfusion\wwwroot\ADDRESSBOOK\uploads\">
                <cfset local.imageUpdatedValue = #cffile.serverFile#>
            <cfelse>
                <cfset local.imageUpdatedValue = #arguments.defaultPhoto#>
            </cfif>
            <cfquery name="updateData">
                UPDATE coldfusiion.adbookcontacts SET 
                    userId = <cfqueryparam  CFSQLType="cf_sql_integer" value="#Session.addressBookCredentials.id#">,
                    title = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.title#">,
                    firstName = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.firstName#">,
                    lastName  = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.lastName#">,
                    email =<cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.email#">,
                    gender = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.checks#">,
                    dob = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.dob#">,
                    photo = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.imageUpdatedValue#">,
                    address = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.address#">,
                    phone = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.phone#">,
                    street = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.street#">,
                    pinCode = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.pinCode#">,
                    status = <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                WHERE contactId = "#arguments.contactId#"
            </cfquery>
            <cfset local.message  ="Contact updated successfully">
            <cflocation  url="../pages/dashboard.cfm?aMessageSuccess=#local.message#"> 
        </cfif>
    </cffunction>

    <cffunction name="getDirectoryInfo" access="public" output="true"> 
        <cfquery name="directoryList">
            SELECT *FROM coldfusiion.adbookcontacts;
         </cfquery>
        <cfreturn directoryList>
    </cffunction>

</cfcomponent>