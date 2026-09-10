import ballerinax/slack;import ballerina/http;
import ballerina/tcp;

final tcp:Client tcpClient = check new ("dsd", 321);
final http:Client httpClient = check new ("efd");
final slack:Client slackClient = check new ({
    auth: {
        token: ""
    }
});
