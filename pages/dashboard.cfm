<cfinclude template="../section/header.cfm">
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
                <div id="myModal" class="modal">
                  <div class="modal-content">
                    <span class="close">&times;</span>
                    <div class="contact-list">
                      <div class="modal-container ">
                        <div class="modal-head">
                          <h2>Contact Details</h2>
                          <div id="alert"></div>
                        </div>
                          <form class="my-4">
                            <h2>Personal Contact</h2><hr>
                            <div class="modal-body">
                              <div class="form-control">
                                <input type="text" name ="title" 
                                id="title" placeholder="Title">
                              </div>
                              <div class="form-control">
                                <input type="text" name ="firstName"
                                id ="firstName" placeholder="First name">
                              </div>
                              <div class="form-control">
                                <input type="text" name ="lastName" 
                                id ="lastName" placeholder="Last name">
                              </div>
                            </div>
                            <div class="modal-body">
                              <div class="form-control">
                                <input type="text" name ="dob" 
                                id ="dob" placeholder="Dob">
                              </div>
                              <div class="form-control">
                                <input type="text" name ="photo" 
                                id="photo" placeholder="Upload photo">
                              </div>
                              <div class="form-control">
                                <input class="checks" type="radio"
                                name="checks" id="yes"
                                value="1">Male
                                <input class="checkbox2" type="radio"
                                name="checks" id="no"
                                value="0">Female
                            </div>
                            </div>
                            <h2>Contact Details</h2><hr>
                            <div class="modal-body">
                              <div class="form-control">
                                <input type="text" name ="phone" 
                                id ="phone" placeholder="Phone">
                              </div>
                              <div class="form-control">
                                <input type="text" name ="street" 
                                id ="street" placeholder="Street">
                              </div>
                              <div class="form-control">
                                <input type="text" name ="pinCode" 
                                id ="pinCode" placeholder="Pincode">
                              </div>
                            </div>
                            <div class="modal-body-bon">
                              <div class="form-controls">
                                <input type="text" name ="email" 
                                id ="email" placeholder="Email">
                              </div>
                              <div class="form-controls">
                                <input type="text" name ="address" 
                                id ="address" placeholder="Address">
                              </div>
                            </div>
                            <button class="btn modal-btn"
                            onclick ="return onAddressBookContactValidate()">Submit</button>
                          </form>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="panel-list card2">
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