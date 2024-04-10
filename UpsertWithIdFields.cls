blic with sharing class UpsertWithIdField {
    public static void useUpsertWithIdField() {
        Contact janice = new Contact(FirstName='Janice', LastName='Hosenstein', Email='janice.hosenstein@salesforce.com', Description='Chandler\'s ex');
        insert janice;
        // 1. Upsert using an idLookup field
        // Create a second sObject variable
        // This variable doesn't have any ID set.
        Contact janice2 = new Contact(FirstName='Janice', LastName='Hosenstein', Email='janice.hosenstein@salesforce.com', Description='Only contact by email');
        // Upsert the contact by using the idLookup field for matching.
        upsert janice2 Contact.fields.Email;
        // Verify that the contact has been updated
        System.assertEquals('Only contact by email', [SELECT Description FROM Contact WHERE Id=:janice.Id].Description);
    }
}