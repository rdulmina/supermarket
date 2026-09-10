import ballerina/workflow;

@workflow:Activity
function sendEmail(OrderInfo orderInfo) {
    return "Email sent to " + orderInfo.customerEmail;
}

@workflow:Activity
function cancelOrder(OrderInfo orderInfo) {
}
