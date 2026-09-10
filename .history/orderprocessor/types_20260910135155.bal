
type OrderInfo record {|
    string id;
    string customerId;
    string customerEmail;
    int total;
|};

type PaymentInfo record {|
    string id;
    string orderId;
    int total;
    string status;
|};

# Data record for workflow function
type OrderWorkflowData record {|
    future<boolean> e;

|};

public enum RequestAction {
    REQUEST_BILL,
    REJECT
}

public type RequestDecision record {|
    RequestAction action;
    string comment = "";
|};

type HrResponse record {|
    string team;
    string lead;
|};
