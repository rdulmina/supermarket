import ballerina/workflow;

@workflow:Activity
function validateOrder() returns error?{
}

@workflow:Activity
function sendEmail() {
}

@workflow:Activity
function cancelOrder() {
}
