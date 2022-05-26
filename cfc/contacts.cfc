component persistent="true" entityname="contacts" table="coldfusiion.contacts"  {
    property name="id" fieldtype="id" generator="native" column="contactId";
    property name="title" ormtype="string" length ="250";
    property name="summary" ormtype="string" length ="250";
    property name="description" ormtype="text";
}  