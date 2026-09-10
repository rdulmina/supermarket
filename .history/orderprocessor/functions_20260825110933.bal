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
function chargePayment(OrderInfo orderInfo) {
}

@workflow:Activity
function notifyFailedEmail() {
}

@workflow:Activity
function startShipment() {
}

@workflow:Activity
function validateEmailChange() {
}

@workflow:Activity
function getPaymentInfo() {
}
