import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo orderInfo, OrderWorkflowData data) returns json|error {

    if orderInfo.total > 100 {
        OrderApproverResponse orderApproverResponse = check ctx->awaitHumanTask("Approve order quantitiy", "OrderApprover", title = (), timeout = ());
    }
    boolean payment = check wait data.payment;
    if payment {
        anydata result = check ctx->callActivity(sendEmail, {orderInfo: orderInfo});
    } else {
        anydata result = check ctx->callActivity(cancelOrder, {orderInfo: orderInfo});
    }
}
