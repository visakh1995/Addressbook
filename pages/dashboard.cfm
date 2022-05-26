<cfinclude template="../section/header.cfm">
<cfinclude template ="./modal.cfm">
<ORMReload()>
<cfset contactEntity = entityLoad("adbookcontacts")>
<cfset jsonise = serializeJSON(contactEntity)>
<cfset contactDirectory = deserializeJSON(jsonise)> 
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
                  <cfoutput>
                    <cfloop array ="#contactDirectory#" index="directory">
                        <tr>
                            <td>#directory.firstName#</td>
                            <td>#directory.email#</td>
                            <td>#directory.phone#</td>
                            <td>
                              <button class="btn btn-outline" data-toggle="modal" 
                                    data-target=".viewModal-#directory.id#">View
                              </button>
                              <button class="btn btn-outline"><a href="update.cfm?ID=#directory.id#">edit</a></button>
                              <button class="btn btn-outline"><a href="action.cfm?DELETE=#directory.id#">delete</a></button>
                            </td>
                        </tr>
                    </cfloop>
                  </cfoutput>
                </tbody>
              </table>
            </div>
        </div>
    </div>
</section>

<div id="myModals" class="modal">
  <div class="modal-content">
  <span class="closes">&times;</span>
      <div class="contact-list">
          <div class="modal-container ">
              <div class="modal-head">
              <h2>Contact Details</h2>
              <div id="alert"></div>
          </div>

      </div>
    </div>
  </div>
</div>

<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>




<script>
  function onAddressBookTriggerViewDetails(){
  // Get the modal
  var modal = document.getElementById("myModals");

  // Get the button that opens the modal
  var btn = document.getElementById("myBtnView");

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("closes")[0];

  // When the user clicks the button, open the modal 
  btn.onclick = function() {
  modal.style.display = "block";
  }

  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
  modal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}
</script>

<cfinclude template="../section/footer.cfm">