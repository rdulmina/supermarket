import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    anydata result = check ctx->callActivity(validateOrder, {});
    if input.total > 100 {
        OrderApproverResponse orderApproverResponse = check ctx->awaitHumanTask("Approve order quantitiy", "OrderApprover", title = (), timeout = ());
    }
    boolean payment = check wait data.payment;
    anydata result = check ctx->callActivity(sendEmail, {});

}
