#!/usr/bin/env node
import * as cdk from "aws-cdk-lib";
import { MyStack } from "../lib/infra-stack";

const app = new cdk.App();

const stage = app.node.tryGetContext("stage") || "dev";

new MyStack(app, `${stage}-ClientsStack`, { stage });
