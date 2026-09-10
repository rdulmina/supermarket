// import ballerina/log;
import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    error? gd = ctx->callActivity(reserveInventory, {
    orderInfo: {
        id: "",
        customerId: "",
        customerEmail: "",
        total: 0
    }
}, retryPolicy = {});

    // () _ = check ctx->callActivity(reserveInventory, {orderInfo: input}, retryPolicy = {maxRetries: 15, retryDelay: 23, retryBackoff: 3, maxRetryDelay: 4});
    // [PaymentInfo] [paymentInfo] = check ctx->await([data.paymentInfo], timeout = {
    //     minutes: 5
    // });

    // log:printInfo("Waiting for payment");

    // if payment {
    //     anydata result = check ctx->callActivity(sendConfirmationEmail, {orderInfo: input});
    // } else {
    //     anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    // }
}
