import ballerina/workflow;

@workflow:Workflow
function InsuranceClaim(workflow:Context ctx, ClaimInfo input) returns string?|error {
    FinanceResponse result = check ctx->awaitHumanTask("Validate Documents", userRoles = "Finance", taskInput = input);
    if result.status {
        () _ = check ctx->callActivity(payClaim, {}, approvalPolicy = {userRoles: "Finance"});
        return "claimCompleted";
    } else {
        () _ = check ctx->callActivity(cancleClaim, {});
        return result.reason;
    }
}

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    () _ = check ctx->callActivity(reserveInventory, {orderInfo: input});
    PaymentInfo paymentInfo = check wait data.paymentInfo;
    if paymentInfo.status == "SUCCESS" {
        anydata result = check ctx->callActivity(sendConfirmationEmail, {orderInfo: input});
    } else {
        anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    }
}
