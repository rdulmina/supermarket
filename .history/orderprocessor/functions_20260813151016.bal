import ballerina/workflow;

@workflow:Activity
function sendEmail(OrderInfo orderInfo) {
    logreturn "Email sent to " + orderInfo.customerEmail;
}

@workflow:Activity
function cancelOrder(OrderInfo orderInfo) {
}
