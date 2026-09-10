
type OrderInfo record {|
    string id;
    string customerId;
    string customerEmail;
    int total;
|};

type PaymentInfo record {|
    string status;
|};

# Data record for workflow function
type OrderWorkflowData record {|
    future<PaymentInfo> paymentInfo;
|};

