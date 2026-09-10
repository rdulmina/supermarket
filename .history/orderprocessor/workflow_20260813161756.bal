import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo orderInfo, OrderWorkflowData data) returns json|error {
anydata result = check ctx->callActivity(reserveInventory, {orderInfo: orderInfo});

    boolean payment = check wait data.payment;
    if payment {
        anydata result = check ctx->callActivity(sendEmail, {orderInfo: orderInfo});
    } else {
        anydata result = check ctx->callActivity(cancelOrder, {orderInfo: orderInfo});
    }
}

