import ballerina/http;
import ballerina/workflow;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /'order on httpDefaultListener {
    resource function post .(@http:Payload OrderInfo payload) returns json|error {
        do {
            string workflowId = check workflow:run(orderWorkflow, payload);
            return workflowId;

        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function post [string orderId]/payment(@http:Payload PaymentInfo paymentInfo) returns json|error {
        do {
            check workflow:sendData(emailChangeRequest, orderId, "paymentInfo", paymentInfo);

        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

