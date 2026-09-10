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

# + connection - Connection to invoke the action on
# + path - Request path
# + return - Type of the variable
@workflow:Activity
+ path -Theresourcepath

# Sends an email message with optional parameters.
# + to - TO address list
# + subject - Subject of email
# + 'from - From address
# + body - Text body of the email
@workflow:Activity
@display {label: "emailSend", iconPath: "https://bcentral-packageicons.azureedge.net/images/ballerina_email_2.14.0.png"}
isolated function emailSend(string|string[] to, string subject, string 'from, string body) returns error? {
    check emailSmtpclient->send(to, subject, 'from, body);
}
