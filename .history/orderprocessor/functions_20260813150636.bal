import ballerina/workflow;

@workflow:Activity
function sendEmail(OrderInfo orderInfo) returns string {
    return "Email sent to " + orderInfo.customerEmail;
}

@workflow:Activity
function cancelOrder() {
}
