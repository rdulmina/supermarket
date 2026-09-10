import ballerina/http;
import ballerina/tcp;

final tcp:Client tcpClient = check new ("dsd", 321);
final http:Client httpClient = check new ("efd");
