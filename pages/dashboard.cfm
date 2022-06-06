<cfif NOT isDefined("Session.addressBookCredentials")>
	<cflocation url="../auth/login.cfm" addtoken="no" /> 
</cfif>
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
                <button class="btn" id="myBtn"  
                onclick ="return onAddressBookTriggerContact()">Create</button>
            </div>
            <div class="panel-list card2">
                <cfif isDefined("aMessageSuccess")>
                  <div class="alertSuccess" id="alertSuccess">
                    <cfoutput>
                        <span class="closebtndash" onclick="closeAlertBoxSuccess()">&times</span> 
                        <p>#aMessageSuccess#</p>
                    </cfoutput>
                  </div>
                </cfif>
                <cfif isDefined("aMessages")>
                    <div class="alertClass" id="alertClass">
                      <cfoutput>
                        <span class="closebtndash" onclick="closeAlertBox()">&times</span> 
                          <p>#aMessages#</p>
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
                                        <button class="btn btn-outline btn-show" data-bs-toggle="modal" 
                                            data-bs-target=".editModal-#directory.id#">
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
                                <!---view modal ends here  --->
                                <!-- The edit Modal -->
                                <div class="modal editModal-#directory.id#" >
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="contact-list">
                                                <div class="modal-container ">
                                                    <div class="modal-head">
                                                    <h2>Contact Details</h2>
                                                    <div id="alert"></div>
                                                </div>
                                                <form class="my-4" method="post"
                                                    enctype="multipart/form-data" 
                                                    action="../components/userdefined.cfc?method=addressBookUpdateContactForm">
                                                    <h2>Personal Contact</h2><hr>

                                                    <div class="modal-body">
                                                        <div class="form-control">
                                                            <select  class="fullWidth" name = "title" id="title"> 
                                                                <option value = "#directory.title#">
                                                                    #directory.title#
                                                                </option> 
                                                                <option value = "Mr">Mr</option> 
                                                                <option value = "Mrs">Mrs</option>  
                                                                <option value = "Miss">Miss</option> 
                                                            </select>
                                                        </div>
                                                        <div class="form-control">
                                                            <input type="text" name ="firstName" 
                                                                id ="firstName" value="#directory.firstName#"
                                                                placeholder="First name*">
                                                            <input type="hidden" name="contactId" 
                                                                value="#directory.id#">
                                                        </div>
                                                        <div class="form-control">
                                                            <input type="text" name ="lastName" 
                                                                id ="lastName" value="#directory.lastName#" 
                                                                placeholder="Last name*">
                                                        </div>
                                                    </div>
                                    
                                                    <div class="modal-body-inclusive">
                                                        <div class="form-control">
                                                            <input class="checkbox1" type="radio"
                                                                name="checks" id="yes" value="Male"
                                                                <cfif directory.gender eq "Male" >
                                                                checked</cfif>>Male
                                                            <input class="checkbox2" type="radio"
                                                                name="checks" id="no" value="Female"
                                                                <cfif directory.gender eq "Female" >
                                                                checked</cfif>>Female
                                                        </div>
                                                        <div class="form-control dob">
                                                            <input type="date" name ="dob" 
                                                            id ="dob" placeholder="Dob*" value="#directory.dob#">
                                                        </div>
                                                        <div class="form-control photo">
                                                            <input type="file" name ="photo" 
                                                                id="photo" placeholder="Upload photo*" 
                                                                value="#directory.photo#">
                                                            <input type="hidden" name ="defaultPhoto" 
                                                            id="photo" placeholder="Upload photo*" 
                                                            value="#directory.photo#">
                                                        </div>
                                                        <div class="updateImage">
                                                            <cfif isDefined("directory.photo")>
                                                                <img class="avatarupdate-img" src="../uploads/#getFileFromPath(directory.photo)#">
                                                        </cfif>
                                                        </div>
                                                    </div>
                                    
                                                    <h2>Contact Details</h2><hr>
                                                    <div class="modal-body">
                                                        <div class="form-control">
                                                            <input type="text" name ="phone" 
                                                                id ="phone" placeholder="Phone*"
                                                                value="#directory.phone#">
                                                        </div>
                                                        <div class="form-control">
                                                            <input type="email" name ="email" 
                                                                id ="email" placeholder="Email*" 
                                                                value="#directory.email#">
                                                        </div>
                                                        <div class="form-control">
                                                            <input type="text" name ="street" 
                                                                id ="street" placeholder="Street*"
                                                                value="#directory.street#">
                                                        </div>
                                                    </div>
                                    
                                                    <div class="modal-body">
                                                        <div class="form-control">
                                                            <input type="text" name ="pinCode" 
                                                                id ="pinCode" placeholder="Pincode*"
                                                                value="#directory.pinCode#">
                                                        </div>
                                                        <div class="form-control">
                                                            <input type="text" name ="address" 
                                                                id ="address" placeholder="Address*"
                                                                value="#directory.address#" >
                                                        </div>
                                                    </div>
                                                    <button class="btn modal-btn"
                                                    >Update</button>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" 
                                                        data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </form>
                                            </div>
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