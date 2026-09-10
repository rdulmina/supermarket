import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input) returns json|error {
    anydata result = check ctx->callActivity(reserveInventory, {orderInfo: input});

}
