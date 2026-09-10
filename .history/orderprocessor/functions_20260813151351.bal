import ballerina/log;
import ballerina/workflow;

@workflow:Activity
function sendEmail(OrderInfo orderInfo) {
    log:printInfo(string `Email sent to ${orderInfo.customerEmail}`);
}

@workflow:Activity
function cancelOrder(OrderInfo orderInfo) {
}
