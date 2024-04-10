public with sharing class BulkDMLFriendsExample {

    public static void addListsOfContacts(){
        // create a list
        List<Contact> listOfContacts = new List<Contact> {
                new Contact(FirstName='Rachael',LastName='Green',Department='Purchasing'),
                new Contact(FirstName='Phoebe',LastName='Buffay',Department='HR'),
                new Contact(FirstName='Ross', LastName='Geller',Department='R&D')};    
        // insert the list
        insert listOfContacts;
        // Create a list to hold the contacts to be updated
        List<Contact> updateContactList = new List<Contact>();
        // iterate through the list
        for (Contact contact: listOfContacts){
            if(contact.Department != 'Purchasing') {
                contact.AssistantName = 'Gunther';
            } else {
                contact.AssistantName = 'Janice';
            }
            // add the contacts to be updated in the List
            updateContactList.add(contact);
        }
        // Batch update the list of contacts
        update updateContactList;   
	}
}