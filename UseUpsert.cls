public with sharing class UseUpsert {
    public static void useUpsertToUpdateInsert() {
        Contact monica = new Contact(FirstName='Monica', LastName='Geller', Department='Culinary');
        insert monica;
        // Variable monica has been inserted so monica is assigned an ID
        // which will be used to match the record by upsert
        monica.Description = 'Monica\'s record has been updated by the upsert operation.';
        // Create Chadler contact, but dont persist it in the database
        Contact chandler = new Contact(FirstName='Chandler', LastName='Bing', Department='Finance');
        // Create a list to hold the contacts for upsert
        List<Contact> contacts = new List<Contact> {monica, chandler};
        // call upsert
        upsert contacts;
    }
}