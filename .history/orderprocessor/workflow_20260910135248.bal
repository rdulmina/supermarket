// import ballerina/log;
import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    () _ = check ctx->callActivity(reserveInventory, {orderInfo: input});
    boolean payment = check wait data.payment;
    if payment {
        anydata result = check ctx->callActivity(sendConfirmationEmail, {orderInfo: input});
    } else {
        anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    }

}
