Objective-C(iOs) ArsenalPay API SDK
=========

[Arsenal Media LLC](http://www.arsenalmedia.ru/index.php/en)  
[ArsenalPay processing server](https://arsenalpay.ru)

Objective-C(iOs) ArsenalPay API SDK is software development kit for 
fast simple and seamless integration your Objective-C(iOs) application with processing server of ArsenalPay.

Install
----

Clone repo, copy all files within the APFramework folder to your project. All files require ARC


Usage
----
To use the sdk, just import ArsenalPayiOsSDK header file like this:

```objective-c
#import "ArsenalPayiOsSDK.h"
```


Merchant Credentials
----
First of all, if you wish to start using ArsenalPay-SDK for real, you should get real MerchantCredentials. For this, go to **[ArsenalPay support page](https://arsenalpay.ru/index.html)** and send your request.
After some time, you'll get e-mail message from our manager, which will help you.
If you want to test our API, you can use test MerchantCredentials.

Request params
----
1) **ID** - Merchant ID which can be obtain from the payment service provider ArsenalPay  
*Test ID = "9987"*  
2) **Secret** - Merchant Password which can be obtain from the payment service provider ArsenalPay  
*Test Secret = "1234567890"*  
3) **PayerID** - Phone number of the client (9\*\* \*\*\* \*\*\*)  
4) **RecipientID** - Account number of the seller  
5) **Amount** - 10-15000 RUR  
6) **Currency** - Code of currency (ISO 4217)  

Functions of API
----

- Mobile commerce.

Usage
----
**AMRequestPayment and AMCheckPaymentStatus classes. Example code (Objective-C)**:

```objective-c

// Create default facade for requests
id <AMAPICommandsFacade> apiFacade = [[AMAPICommandsFacadeImplementation alloc] init];

// Create payment requests with parameters
AMPaymentRequest *request = [[AMPaymentRequest alloc] init];
request.payerId = @(9140001111L);
request.recipientId = @(123456789L);
request.amount = @(125);
request.currency = @"RUR";
request.comment = @"iOs-sdk-test";
request.test = YES;

// Request payment
[apiFacade requestPayment:request completion:^(AMPaymentResponse *response, NSUInteger statusCode, NSError *error) {
if (!error)
{
    
    // Create payment status request
    AMPaymentStatusRequest *statusRequest = [[AMPaymentStatusRequest alloc] init];
    statusRequest.transactionId = response.transactionId;
    
    // Request payment status check
    [apiFacade checkPaymentStatus:statusRequest completion:^(AMPaymentStatusResponse *response, NSUInteger statusCode, NSError *error) 
        {
            
        }];
    }
}];


```

See more details in Documentation.

**iOs example**
----
iOs example is located in "Example" group.  
It's a simple demonstration how this SDK can be used in iOs application. 


