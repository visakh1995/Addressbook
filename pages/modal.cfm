<div class="modal fade exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-contente">
        <div class="modal-body">
            <div class="modal-content">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <div class="contact-list">
                    <div class="modal-container ">
                        <div class="modal-head">
                        <h2>Contact Details<span id="modal_title"></span></h2>
                        <div id="alert"></div>
                    </div>
                    <form class="my-4" method="post" enctype="multipart/form-data" 
                        action="" name="img_form" id="formId">
                        <h2>Personal Contact</h2><hr>
                        <div class="modal-body">
                            <div class="form-control">
                                <input type="hidden" name="contactId" 
                                id="contactId" >
                                <select  class="fullWidth" name = "title" id="title" required> 
                                    <option value = "">--- Select ---</option> 
                                    <option value = "Mr">Mr</option> 
                                    <option value = "Mrs">Mrs</option>  
                                </select>
                            </div>
                            <div class="form-control">
                                <input type="text" name ="firstName" required
                                id ="firstName" placeholder="First name*">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="lastName" required
                                id ="lastName" placeholder="Last name*">
                            </div>
                        </div>
        
                        <div class="modal-body-inclusive">
                            <div class="form-control">
                                <input class="checkbox1" type="radio"
                                    name="checks" id="gender1"
                                value="Male" required>Male
                                <input class="checkbox2" type="radio"
                                    name="checks" id="gender2"
                                    value="Female" required>Female
                            </div>
                            <div class="form-control dob">
                                <input type="date" name ="dob" required
                                id ="dob" placeholder="Dob*">
                            </div>
                            <div class="form-control photo">
                                <input type="file" name ="photo" 
                                id="photo" placeholder="Upload photo*" 
                                accept=".jpeg,.png,.gif,.jpg" >
                                <input type="hidden" name ="defaultPhoto" 
                                id="defaultPhoto" placeholder="Upload photo*">
                            </div>
                        </div>

                        <h2>Contact Details</h2><hr>
                        <div class="modal-body">
                            <div class="form-control">
                                <input type="email" name ="email" required
                                id ="email" placeholder="Email*" 
                                onclick ="return onValidateEmail()">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="phone" required
                                id ="phone" placeholder="Phone*">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="street" required
                                id ="street" placeholder="Street*">
                            </div>
                        </div>
        
                        <div class="modal-body">
                            <div class="form-control">
                                <input type="text" name ="pinCode" required
                                id ="pinCode" placeholder="Pincode*">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="address" required
                                id ="address" placeholder="Address*">
                            </div>
                        </div>
                        <button class="btn modal-btn"
                            onclick ="return onAddressBookContactValidate()">Submit
                        </button>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    </div>
</div>
