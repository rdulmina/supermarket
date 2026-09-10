import ballerina/workflow;

@workflow:Activity
function sendEmail(OrderInfo orderInfo) returns string {
    return "Email sent to " + orderInfo.cu;
}

@workflow:Activity
function cancelOrder() {
}
