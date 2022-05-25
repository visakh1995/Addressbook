<cfinclude template="../section/header.cfm">
<cfinclude template ="./modal.cfm">
<cfset newAddressInstance = createObject("component","ADDRESSBOOK/components.userdefined")> 
<cfset contactDirectory = newAddressInstance.listContacts()> 
<section class="dashboard">
    <div class="container-2">
        <div class="dashboard-topbar grids">
            <p>ADDRESS BOOK CONTACT LIST!!</p>
        </div>
        <div class="dashboard-panel card grid-2 my-2">
            <div class="panel-profile card">
                <img src="../images/img_avatar.png" alt="Avatar" class="avatar">
                <p class="">Merlin Richard</p><br>
                <button class="btn" id="myBtn"  
                onclick ="return onAddressBookTriggerContact()">Create</button>
            </div>
            <div class="panel-list card2">
                <cfif isDefined("aMessageSuccess")>
                  <div class="alertSuccess">
                    <cfoutput>
                        <p>#aMessageSuccess#</p>
                    </cfoutput>
                  </div>
                </cfif>
                <cfif isDefined("aMessages")>
                  <div class="alertClass">
                      <cfoutput>
                          <p>#aMessages#</p>
                      </cfoutput>
                  </div>
              </cfif>
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
                  <cfoutput query = contactDirectory>
                    <tr>
                      <td><a href="pageDetails.cfm?detailsID=#id#">#firstName#</a></td>
                      <td>#email#</td>
                      <td>#phone#</td>
                      <td>
                        <button class="btn btn-outline"><a href="update.cfm?ID=#id#">edit</a></button>
                        <button class="btn btn-outline"><a href="action.cfm?DELETE=#id#">delete</a></button>
                      </td>
                    </tr>
                  </cfoutput>
                </tbody>
              </table>
            </div>
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">