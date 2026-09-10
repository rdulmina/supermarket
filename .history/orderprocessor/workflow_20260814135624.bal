// import ballerina/log;
import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    anydata result = check ctx->callActivity(reserveInventory, {orderInfo: input}, retryPolicy = "fd");
    // log:printInfo("Waiting for payment");
    // [boolean] [payment] = check ctx->await([data.payment], timeout = {
    //     minutes: 3
    // });
    // if payment {
    //     anydata result = check ctx->callActivity(sendEmail, {orderInfo: input});
    // } else {
    //     anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    // }

}
