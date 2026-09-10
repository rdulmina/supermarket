
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
    future<PaymentInfo> paymentInfo;
|};
