import ballerina/log;
import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    anydata result1 = check ctx->callActivity(reserveInventory, {orderInfo: input});
    log:printInfo("Waiting for payment");
    boolean payment = check wait data.payment;
    if payment {
        anydata result = check ctx->callActivity(sendEmail, {orderInfo: input});
    } else {
anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    }

}
