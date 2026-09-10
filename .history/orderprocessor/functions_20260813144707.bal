import ballerina/workflow;

@workflow:Activity
function validateOrder() retu error?{
}

@workflow:Activity
function sendEmail() {
}

@workflow:Activity
function cancelOrder() {
}
