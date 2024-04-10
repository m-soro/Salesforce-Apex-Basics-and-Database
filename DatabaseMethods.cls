public with sharing class DatabaseMethods {
    public static void useDatabaseMethods() {
        // Create a list of contacts
        List<Contact> contactList = new List<Contact> {
            new Contact(FirstName='Jerry', LastName='Seinfeld', Department='HR'),
            new Contact(FirstName='Elaine', LastName='Benez', Department='Marketing'),
            new Contact(FirstName='Cosmo', LastName='Kramer', Department='Security'),
            // Left empty on purpose so it fail
            new Contact()
        };
        // Bulk insert all the contacts with one DML call
        Database.SaveResult[] srList = Database.insert(contactList, false);
        // Iterate through each returned result
        for (Database.SaveResult sr: srList) {
            if (sr.isSuccess()) {
                // Operation was successful so get the ID of the record that was processed
                System.debug('Successfully inserted contact. Contact ID: ' + sr.getId());
            } else {
                // Operation failed so get all errors
                for (Database.Error err : sr.getErrors()){
                    System.debug(err.toString());
                    System.debug('The following error has occurred');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Contact fields that affected this error: ' + err.getFields());
                }
            }
        }

    }
}