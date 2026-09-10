// import ballerina/log;
import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input) returns json|error {
    () _ = check ctx->callActivity(reserveInventory, {orderInfo: input}, retryPolicy = {});

    // log:printInfo("Waiting for payment");

    // if payment {
    //     anydata result = check ctx->callActivity(sendConfirmationEmail, {orderInfo: input});
    // } else {
    //     anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    // }
}
