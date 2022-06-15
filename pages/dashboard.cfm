<cfinclude template="../section/header.cfm">
<cfinclude template ="./modal.cfm"> 
<ORMReload()>
<cfset contactEntity = entityLoad("adbookcontacts",
{userId : Session.addressBookCredentials.id})>
<cfset jsonise = serializeJSON(contactEntity)>
<cfset contactDirectory = deserializeJSON(jsonise)> 

<section class="dashboard">
    <div class="container-2">
        <div class="dashboard-topbar flexes">
            <div class="topbar-heading">
                <p>ADDRESS BOOK CONTACT LIST</p>
            </div>
            <div class="topbar-docs">
                <a href="./generatePdf.cfm?pdf">
                    <i class="fa-solid fa-file-pdf"></i>
                </a>              
                <a href="./generateExcel.cfm?excel">
                    <i class="fa-regular fa-file-excel"></i>
                </a>
                <a href="../pages/print.cfm">
                    <i class="fa-solid fa-print"></i>
                </a>   
            </div>
        </div>

        <div class="dashboard-panel card grid-2 my-2">
            <div class="panel-profile card">
                <img src="../images/img_avatar.png" alt="Avatar" class="avatar">
                <p class="profile-name">
                    <cfoutput>#Session.addressBookCredentials.userName#</cfoutput>
                </p><br>
                <button type="button" class="title btn btn-primary" data-id="0"
                    data-bs-toggle="modal" data-bs-target=".exampleModal">Create
                </button>
            </div>
            <div class="panel-list card2">
                <cfif isDefined("aMessageSuccess")>
                  <div class="alertSuccess" id="alertSuccess">
                    <cfoutput>
                        <span class="closebtndash" onclick="closeAlertBoxSuccess()">&times</span> 
                        <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccess))>
                        <p>#showMessageSuccess#</p>
                    </cfoutput>
                  </div>
                </cfif>
                <cfif isDefined("aMessages")>
                    <div class="alertClass" id="alertClass">
                        <cfoutput>
                            <span class="closebtn" onclick="closeAlertBox()">&times</span> 
                            <cfset showMessage = ToString(ToBinary(aMessages))>
                            <p>#showMessage#</p>
                        </cfoutput>
                    </div>
                </cfif>
                <table id="detailsTable">
                    <thead>
                        <tr>
                            <th></th>
                            <th>NAME</th>
                            <th>EMAIL</th>
                            <th>PHONE</th>
                            <th>STATUS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfoutput>
                            <cfloop array ="#contactDirectory#" index="directory">
                                <tr>
                                    <td>
                                        <img class="avatar-img" 
                                        src="../uploads/#getFileFromPath(directory.photo)#">
                                    </td>
                                    <td>#directory.firstName#</td>
                                    <td>#directory.email#</td>
                                    <td>#directory.phone#</td>
                                    <td>
                                        <button class="btn btn-outline btn-show" data-bs-toggle="modal" 
                                            data-bs-target=".viewModal-#directory.id#">
                                            <i class="fa-solid fa-eye"></i>
                                        </button>
                                        <button type="button" class="title btn btn-outline btn-show" 
                                            data-id="#directory.id#"
                                            data-bs-toggle="modal" data-bs-target=".exampleModal">
                                            <i class="fa-solid fa-user-pen"></i>
                                        </button>
                                        <button class="btn btn-outline btn-show">
                                            <a href="../action.cfm?DELETE=#directory.id#">
                                            <i class="fa-solid fa-trash"></i></a>
                                        </button>
                                    </td>
                                </tr>
                                 <!-- The Modal -->
                                 <div class="modal viewModal-#directory.id#" >
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="view-modal-title">CONTACT DETAILS</h4>
                                                <button 
                                                    type="button" 
                                                    class="btn-close" 
                                                    data-bs-dismiss="modal">
                                                </button>
                                            </div>
                                            <!-- Modal body -->
                                            <div class="modal-body"> 
                                                <div class="modal-container">
                                                    <div class="modal-profile">
                                                        <img class="avatarview-img" 
                                                        src="../uploads/#getFileFromPath(directory.photo)#">
                                                    </div>
                                                    <div class="modal-base flex">
                                                        <div class="modal-title">
                                                            <h4>Name
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            &nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            </h4>
                                                        </div>
                                                        <div class="modal-show">
                                                            <h4>#directory.firstName#</h4>
                                                        </div>
                                                    </div>
                                                    <div class="modal-base flex">
                                                        <div class="modal-title">
                                                            <h4>Gender 
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
                                                            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                                        </h4>
                                                        </div>
                                                        <div class="modal-show">
                                                            <h4>#directory.gender#</h4>
                                                        </div>
                                                    </div>
                                                    <div class="modal-base flex">
                                                        <div class="modal-title">
                                                            <h4>Dob
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &nbsp;
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            </h4>
                                                        </div>
                                                        <div class="modal-show">
                                                            <h4>#directory.dob#</h4>
                                                        </div>
                                                    </div>
                                                    <div class="modal-base flex">
                                                        <div class="modal-title">
                                                            <h4>Pincode
                                                                &nbsp;&nbsp;&nbsp;&nbsp; : &nbsp; 
                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                            </h4>
                                                        </div>
                                                        <div class="modal-show">
                                                            <h4>#directory.pinCode#</h4>
                                                        </div>
                                                    </div>
                                                    <div class="modal-base flex">
                                                        <div class="modal-title">
                                                            <h4>Email
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;: &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                                                            </h4>
                                                        </div>
                                                        <div class="modal-show">
                                                            <h4>#directory.email#</h4>
                                                        </div>
                                                    </div>
                                                    <div class="modal-base flex">
                                                        <div class="modal-title">
                                                            <h4>Phone
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                                                                &nbsp;&nbsp;&nbsp;&nbsp; 
                                                            </h4>
                                                        </div>
                                                        <div class="modal-show">
                                                            <h4>#directory.phone#</h4>
                                                        </div>
                                                    </div>
                                                    <div class="modal-base flex">
                                                        <div class="modal-title">
                                                            <h4>Address 
                                                            &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            </h4>
                                                        </div>
                                                        <div class="modal-show">
                                                            <h4>#directory.address#</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger" 
                                                data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </cfloop>
                        </cfoutput>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">
