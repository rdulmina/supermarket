import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    anydata result = check ctx->callActivity(reserveInventory, {orderInfo: input});
    boolean payment = check wait data.payment;

}
