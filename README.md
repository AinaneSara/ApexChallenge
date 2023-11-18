# Salesforce Apex Implementation - README

## Overview

This repository contains an implementation of Salesforce Apex classes and a trigger handler framework designed to efficiently manage triggers related to Contacts and Accounts. The codebase follows best practices, including the use of selector layers, a trigger handler framework, and a TestDataFactory for robust testing.

## Implementation Details

### Apex Classes

#### `ContactSelector`

The `ContactSelector` class provides methods to retrieve Contact records based on specified criteria. It is designed as a selector layer to encapsulate the logic for querying Contact records.

- **Methods:**
  - `retriveContactsWithAccountIds(List<Id> accountIds): List<Contact>`: Retrieves contacts associated with a list of Account Ids.
  - `retriveContactsWithIds(List<Id> contactIds): List<Contact>`: Retrieves contacts based on a list of Contact Ids.

#### `AccountSelector`

The `AccountSelector` class follows a similar structure to `ContactSelector` and provides methods to retrieve Account records.

- **Methods:**
  - `retriveAccountsWithIds(Set<Id> ids): List<Account>`: Retrieves accounts based on a set of Account Ids.

#### `TriggerHandler`

The `TriggerHandler` class acts as a framework to handle trigger operations related to Contacts and Accounts. It includes two main methods:

- `handleContactActivation(Map<Id, Account> oldAccountMap, Map<Id, Account> newAccountMap)`: Handles the activation/deactivation of contacts related to Accounts.
- `handleAccountActivation(Map<Id, Contact> oldContactMap, Map<Id, Contact> newContactMap)`: Handles the activation/deactivation of Accounts related to Contacts.

### Test Data Factory - `TestDataFactory`

The `TestDataFactory` class is responsible for creating test data to be used in unit tests. It includes methods to create test accounts and contacts with various configurations.

- **Methods:**
  - `createTestAccounts(Integer numberOfAccounts): List<Account>`: Creates a specified number of test accounts.
  - `createTestContacts(List<Account> relatedAccounts, Integer numberOfContactsPerAccount): List<Contact>`: Creates test contacts related to a list of accounts.

## Testing

The implementation includes comprehensive unit tests to achieve 100% test coverage. The test classes use the Salesforce `Test.StartTest()` and `Test.StopTest()` methods to ensure proper execution context.

### Test Classes

#### `ContactSelectorTest`

This test class covers the methods in the `ContactSelector` class.

- `testRetrieveContactsWithAccountIds()`: Tests the `retriveContactsWithAccountIds` method.
- `testRetrieveContactsWithIds()`: Tests the `retriveContactsWithIds` method.

#### `AccountSelectorTest`

This test class covers the methods in the `AccountSelector` class.

- `testRetrieveAccountsWithIds()`: Tests the `retriveAccountsWithIds` method.

#### `TriggerHandlerTest`

This test class covers the methods in the `TriggerHandler` class. It uses the `Test.StartTest()` and `Test.StopTest()` methods.

- `testHandleContactActivation()`: Tests the `handleContactActivation` method.
- `testHandleAccountActivation()`: Tests the `handleAccountActivation` method.

### Test Data

The tests use dynamically generated test data created by the `TestDataFactory` class. This ensures that the tests are isolated and independent of existing data in the Salesforce org.

## Usage

To use these classes in your Salesforce org:

1. Deploy the Apex classes to your Salesforce environment.
2. Incorporate the trigger handler framework into your trigger logic.
3. Utilize the selector layers for efficient and encapsulated data retrieval.
4. Leverage the `TestDataFactory` class to create test data for unit tests.

## Contribution

Feel free to contribute to the improvement of this implementation by submitting issues or pull requests. Your feedback is highly appreciated!
