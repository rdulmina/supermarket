import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input) returns json|error {
    anydata result = check ctx->callActivity(validateOrder, {});
    OrderApproverResponse resultResult = check ctx->awaitHumanTask("Approve order quantitiy", "OrderApprover", title = (), timeout = ());
}
