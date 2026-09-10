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

