import ballerina/log;
import ballerina/workflow;

@workflow:Activity
function reserveInventory(OrderInfo orderInfo) {
    log:printInfo("Inventory reserved");
}


@workflow:Activity
function sendEmail(OrderInfo orderInfo) {
}