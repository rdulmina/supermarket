// import ballerina/log;
import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    () _ = check ctx->callActivity(reserveInventory, {orderInfo: input});
    [PaymentInfo] [paymentInfo] = check ctx->await([data.paymentInfo], timeout = {
        minutes: 5
    });

    // log:printInfo("Waiting for payment");

    // if payment {
    //     anydata result = check ctx->callActivity(sendConfirmationEmail, {orderInfo: input});
    // } else {
    //     anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    // }
}
