
<div id="myModal" class="modal">
    <div class="modal-content">
    <span class="close">&times;</span>
        <div class="contact-list">
            <div class="modal-container ">
                <div class="modal-head">
                <h2>Contact Details</h2>
                <div id="alert"></div>
            </div>
            <form class="my-4" method="post" enctype="multipart/form-data" 
            action="../components/userdefined.cfc?method=addressBookCreateContactForm">
                <h2>Personal Contact</h2><hr>
                <div class="modal-body">
                    <div class="form-control">
                        <select  class="fullWidth" name = "title" id="title"> 
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
                            name="checks" id="yes"
                        value="Male">Male
                        <input class="checkbox2" type="radio"
                            name="checks" id="no"
                        value="Female">Female
                    </div>
                    <div class="form-control dob">
                        <input type="date" name ="dob" required
                        id ="dob" placeholder="Dob*">
                    </div>
                    <div class="form-control photo">
                        <input type="file" name ="photo" required
                        id="photo" placeholder="Upload photo*" 
                        accept=".jpeg,.png,.gif,.jpg">
                    </div>
                </div>

                <h2>Contact Details</h2><hr>
                <div class="modal-body">
                    <div class="form-control">
                        <input type="text" name ="phone" required
                        id ="phone" placeholder="Phone*">
                    </div>
                    <div class="form-control">
                        <input type="email" name ="email" required
                        id ="email" placeholder="Email*">
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