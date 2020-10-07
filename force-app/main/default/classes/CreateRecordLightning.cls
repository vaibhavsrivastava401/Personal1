/**
 * @description       : 
 * @author            : Vaibhav Srivastava
 * @group             : 
 * @last modified on  : 10-07-2020
 * @last modified by  : Vaibhav Srivastava
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   10-07-2020   Vaibhav Srivastava   Initial Version
**/
public with sharing class CreateRecordLightning {
    public CreateRecordLightning() {
 
    }

    // Method to Create Account Record
    @AuraEnabled
    public static void createAccount(String name, String rating, String phone){
        Account acc = new Account();
        List<Account> accList = new List<Account>();
        acc.Name = name;
        acc.Rating = rating;
        acc.Phone = phone;
        accList.add(acc);
        if (accList != null && accList.size()>0) {
            insert accList;
        }
    }

    // Method to Fetch Accounts
    @AuraEnabled
    public static List<Account>  getAccountByName(String accName){
        String searchKey = '%' + accName + '%';
        List<Account> acc = [SELECT Name, Rating, AccountNumber, Phone 
        FROM Account where Name like :searchKey];
        return acc;
    }
}