import * as cdk from "aws-cdk-lib";
import * as dynamodb from "aws-cdk-lib/aws-dynamodb";
import { Construct } from "constructs";

interface MyStackProps extends cdk.StackProps {
  stage: string; // "dev" or  "prd"
  version?: string; // default  "v1"
}

export class MyStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props: MyStackProps) {
    super(scope, id, props);

    const prefix = `${props.stage}-`;
    const version = props.version ?? "v1";

    // Create Table
    const clientsTable = new dynamodb.Table(this, "ClientsTable", {
      tableName: `${prefix}Clients_${version}`,
      partitionKey: { name: "ID", type: dynamodb.AttributeType.STRING },
      billingMode: dynamodb.BillingMode.PAY_PER_REQUEST,
      removalPolicy:
        props.stage === "prd"
          ? cdk.RemovalPolicy.RETAIN
          : cdk.RemovalPolicy.DESTROY,
      pointInTimeRecovery: props.stage === "prd",
    });

    // Global Secondary Index
    clientsTable.addGlobalSecondaryIndex({
      indexName: `${prefix}Clients_${version}-CNPJIndex`,
      partitionKey: { name: "CNPJ", type: dynamodb.AttributeType.STRING },
      projectionType: dynamodb.ProjectionType.ALL,
    });

    // billing
    cdk.Tags.of(clientsTable).add("Environment", props.stage);
    cdk.Tags.of(clientsTable).add("Project", "MyProject");
    cdk.Tags.of(clientsTable).add("Version", version);
  }
}
