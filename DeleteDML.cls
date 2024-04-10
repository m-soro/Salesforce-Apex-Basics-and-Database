public with sharing class DeleteDML {
    public static void useDeleteDML() {
        Contact[] contactsDel = [SELECT Id FROM Contact WHERE LastName IN ('Seinfield', 'Benez', 'Kramer')];
        delete contactsDel; 
    }
}