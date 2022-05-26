component persistent="true" entityname="adbookContacts" table="coldfusiion.adbookContacts"  {
    property name="id" fieldtype="id" generator="increment" column="contactId";
    property name="userId" column="userId" ormtype="string";
    property name="title" column="title" ormtype="string";
    property name="firstName" column="firstName" ormtype="string";
    property name="lastName" column="lastName" ormtype="string";
    property name="email" column="email" ormtype="string";
    property name="gender" column="gender" ormtype="string";
    property name="dob" column="dob" ormtype="string";
    property name="photo" column="photo" ormtype="string";
    property name="address" column="address" ormtype="string";
    property name="phone" column="phone" ormtype="string";
    property name="street" column="street" ormtype="string";
    property name="pincode" column="pincode" ormtype="string";
    property name="status" column="status" ormtype="string";
}  