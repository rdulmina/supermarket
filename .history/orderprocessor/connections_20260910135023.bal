import ballerina/email;
import ballerina/ftp;
import ballerina/http;

final http:Client httpClient = check new ("efd");


final ftp:Client ftpClient = check new ({

});
final email:SmtpClient emailSmtpclient = check new ("fdsf");
