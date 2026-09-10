


import ballerina/ai;import ballerina/workflow;final ai:Wso2ModelProvider wso2ModelProvider = check ai:getDefaultModelProvider();
final workflow:DurableAgent orderWorkflow = check new ({systemPrompt: {role: string `orderWorkflow`, instructions: string ``}, model: wso2ModelProvider});