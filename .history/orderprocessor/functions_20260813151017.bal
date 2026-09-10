import ballerina/workflow;

@workflow:Activity
function sendEmail(OrderInfo orderInfo) {
    log:return "Email sent to " + orderInfo.customerEmail;
}

@workflow:Activity
function cancelOrder(OrderInfo orderInfo) {
}
