import ballerina/workflow;

@workflow:Activity
function validateOrder(OrderInfo orderInfo) returns boolean{
}

@workflow:Activity
function sendEmail(OrderInfo orderInfo) {
}

@workflow:Activity
function cancelOrder(OrderInfo orderInfo) {
}
