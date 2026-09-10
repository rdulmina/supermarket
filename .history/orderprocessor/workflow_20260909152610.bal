// import ballerina/log;

import ballerina/email;
import ballerina/time;
import ballerina/workflow;
import ballerina/workflow.activity;

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
    // boolean p = check wait data.e;

    // () _ = check ctx->callActivity(reserveInventory, {orderInfo: input});
    // [PaymentInfo] [paymentInfo] = check ctx->await([data.paymentInfo], timeout = {
    //     minutes: 5
    // });

    // if payment {
    //     anydata result = check ctx->callActivity(sendConfirmationEmail, {orderInfo: input});
    // } else {
    //     anydata result = check ctx->callActivity(cancelOrder, {orderInfo: input});
    // }
    xml request = xml `<m:GetInvoice xmlns:m="http://example.com"><m:id>${invoiceId}</m:id></m:GetInvoice>`;
    xml response = check ctx->callActivity(activity:callSoapAPI, {
        connection: billing,
        body: request,
        action: "urn:GetInvoice"
    });
}
