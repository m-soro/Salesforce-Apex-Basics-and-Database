public with sharing class DMLExceptions {
    public static void useDMLExceptions() {
        try {
            // This causes an exception beacuse the required Name field is not provided
            Account acct = new Account();
            // Insert the account
            insert acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            
        }
    }
}