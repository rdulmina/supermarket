import ballerina/workflow;

@workflow:Activity
function validateOrder(OrderInfo orderInfo) returns error?{
}

@workflow:Activity
function sendEmail(OrderInfo orderInfo) {
}

@workflow:Activity
function cancelOrder(OrderInfo orderInfo) {
}
