<cfif isDefined("url.DELETE")>
    <cfset deleteId = url.DELETE>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","components.userdefined")> 
    <cfset res = deleteDirectory.addressBookDelete(deleteId)>
</cfif>

