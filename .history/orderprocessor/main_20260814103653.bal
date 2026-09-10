import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function post 'order(@http:Payload OrderInfo payload) returns json|error {
        do {
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}
