import ballerina/http;
import ballerina/workflow;
import ballerinax/trigger.github;

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
            check workflow:sendData(orderWorkflow, orderId, "paymentInfo", paymentInfo);

        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

listener github:Listener githubListener = new ({webhookSecret: "fs"}, 8090);

service github:IssuesService on githubListener {
    remote function onOpened(github:IssuesEvent payload) returns error? {
    }

    remote function onClosed(github:IssuesEvent payload) returns error? {
    }

    remote function onReopened(github:IssuesEvent payload) returns error? {
    }

    remote function onAssigned(github:IssuesEvent payload) returns error? {
    }

    remote function onUnassigned(github:IssuesEvent payload) returns error? {
    }

    remote function onLabeled(github:IssuesEvent payload) returns error? {
    }

    remote function onUnlabeled(github:IssuesEvent payload) returns error? {
    }
}
