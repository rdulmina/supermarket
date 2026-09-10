// import ballerina/log;

import ballerina/ai;import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    anydata result = check ctx->callActivity(reserveInventory, {orderInfo: input}, retryPolicy = "fd");
    // log:printInfo("Waiting for payment");
    // [boolean] [payment] = check ctx->await([data.payment], timeout = {
    //     minutes: 3
    // });
    // if payment {
    //     anydata result = check ctx->callActivity(sendEmail, {orderInfo: input});
    // } else {
    //     anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    // }

}final ai:Wso2ModelProvider wso2ModelProvider = check ai:getDefaultModelProvider();
final workflow:DurableAgent durableAgenticWorkflow = check new ({systemPrompt: {role: string `durableAgenticWorkflow`, instructions: string ``}, model: wso2ModelProvider});
