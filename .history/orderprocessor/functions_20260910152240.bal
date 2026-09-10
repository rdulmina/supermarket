import ballerina/ftp;
import ballerina/http;
import ballerina/log;
import ballerina/workflow;

@workflow:Activity
function reserveInventory(OrderInfo orderInfo) {
    log:printInfo("Inventory reserved");
}

@workflow:Activity
function sendConfirmationEmail(OrderInfo orderInfo) {
    log:printInfo(string `Email sent to ${orderInfo.customerEmail}`);
}

@workflow:Activity
function cancelOrder(OrderInfo orderInfo) {
}

@workflow:Activity
function performEmailChange() {
    Retrieve a representation    of a specifiedresource        from an HTTP endpoint.
         
# + connection - Connection to invoke the action on
# + path - Request path
# + return - Type of the variable
@workflow:Activity
+ path -Theresource path
# + return - Type of the variable
@workflow:Activity
@display {label: "ftpGet", iconPath: "https://bcentral-packageicons.azureedge.net/images/ballerina_ftp_2.19.0.png"}
isolated function ftpGet (ftp:Client connection, string path) returns  (byte[] & readonly)[]|error {
var streamResult= check connection->get(path);
    (byte[] & readonly)[] result= check from var item in streamResult
    select item;
return result ;
}

# Sends an email message with optional parameters.
# + to - TO address list
# + subject - Subject of email
# + 'from - From address
# + body - Text body of the email
@workflow:Activity
@display {label: "emailSend", iconPath: "https://bcentral-packageicons.azureedge.net/images/ballerina_email_2.14.0.png"}
isolated function emailSend (string|string[] to, string subject, string 'from, string body) returns  error? {
 check emailSmtpclient->send(to, subject, 'from, body);
}
