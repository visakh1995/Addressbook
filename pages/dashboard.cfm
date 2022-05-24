<cfinclude template="../section/header.cfm">
<cfinclude template ="./modal.cfm">
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
                    <tr>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Phone</th>
                      <th>Status</th>
                    </tr>
                    <tr>
                      <td>Alfreds Futterkiste</td>
                      <td>Maria Anders</td>
                      <td>Germany</td>
                      <td>
                        <button class="btn btn-outline"><a href="">edit</a></button>
                        <button class="btn btn-outline"><a href="">delete</a></button>
                        <button class="btn btn-outline"><a href="">view</a></button>
                      </td>
                    </tr>
                    <tr>
                      <td>Centro comercial Moctezuma</td>
                      <td>Francisco Chang</td>
                      <td>Mexico</td>
                      <td>
                        <button class="btn btn-outline"><a href="">edit</a></button>
                        <button class="btn btn-outline"><a href="">delete</a></button>
                        <button class="btn btn-outline"><a href="">view</a></button>
                      </td>
                    </tr>
                    <tr>
                        <td>Alfreds Futterkiste</td>
                        <td>Maria Anders</td>
                        <td>Germany</td>
                        <td>
                            <button class="btn btn-outline"><a href="">edit</a></button>
                            <button class="btn btn-outline"><a href="">delete</a></button>
                            <button class="btn btn-outline"><a href="">view</a></button>
                          </td>
                      </tr>
                  </table>
            </div>
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">