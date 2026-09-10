
import ballerina/ftp;
import ballerina/http;
import ballerina/workflow;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /'order on httpDefaultListener {
    resource function post .(@http:Payload OrderInfo payload) returns json|error {
        do {
            string workflowId = check workflow:run(orderWorkflow, payload);

        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function post [string orderId]/payment() returns json|error {
        do {
            check workflow:sendData(orderWorkflow, orderId, "payment", true);
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}
listener ftp:Listener ftpListener = new (host = "localhost", protocol = ftp:FTP, port = 21);
@ftp:ServiceConfig {path: "/"}
service ftp:Service on ftpListener {

}

