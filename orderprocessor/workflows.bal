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
