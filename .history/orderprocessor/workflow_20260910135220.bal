// import ballerina/log;
import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    // if emailResult is error {
    //     () _ = check ctx->callActivity(notifyFailedEmail, {});
    // }

    // () _ = check ctx->callActivity(startShipment, {});

    // () _ = check ctx->callActivity(reserveInventory, {
    //     orderInfo: {
    //         id: "",
    //         customerId: "",
    //         customerEmail: "",
    //         total: 0
    //     }
    // });
    boolean payment = check wait data.payment;

    () _ = check ctx->callActivity(reserveInventory, {orderInfo: input});

    // if payment {
    //     anydata result = check ctx->callActivity(sendConfirmationEmail, {orderInfo: input});
    // } else {
    //     anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    // }

}
