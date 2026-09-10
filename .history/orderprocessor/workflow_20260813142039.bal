import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input) returns json|error {
    anydata result = check ctx->callActivity(validateOrder, {});
    if input.total > 100 {
    }
    
}
