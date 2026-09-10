
type OrderInfo record {|
    string id;
    string customerId;
    string customerEmail;
    int total;
|};

type OrderApproverResponse record {|
    int apporvedQty;
    string reason;
|};

# Data record for workflow function
type OrderWorkflowData record {|
    future<boolean> payment;
|};
