# Liatrio Exercise

## Objectives

✅ Build an application in the programming language of your choice that exposes a REST
endpoint that returns the following JSON payload with the current timestamp and a static
message:
{
“message”: “Automate all the things!”,
“timestamp”: 1529729125
}
- The application must be deployed on a Kubernetes cluster running in a public cloud provider of
your choice. 
✅ The provisioning of the cluster as well as the deployment of the application must
be done through code. Costs incurred as part of this exercise may be reimbursed, please reach out to the Slack channel with questions about specific costs.

--- 

## Requirements

✅ Commit all code to a public git repository.
- Include a README.md containing detailed directions on how to run, what is running, and how to cleanup.
✅ Provide a single command to launch the environment and deploy the application.
✅ Some prerequisites are OK as long as they are properly documented.
✅ We should be able to deploy and run the application in our own public cloud accounts.
- Include some form of automated tests to validate the environment.
- Presentation (deck or medium of your choice)
- Demo prep call with one of the Liatrio engineers

---

## A Super simple API and how to use it Locally

I have built a simple API using Node.js and Express that responds with json:

        {"message":"Automate all the things!","timestamp":1676512119417}

You can run the API with `npm start` but that wouldn't be enough fun, so I dockerized it. To run it with docker, there are 2 ways to go about it:

### The manual way: 
1. Download and run Docker desktop if you haven't already.
0. Clone this repository 
0. `docker build -t liatrio-drew .` - This will have docker build the application
0. `docker run -it -p 8080:3000 liatrio-drew` - The application will run and forward localhost:8080 requests to the server.
0. `open http://localhost:8080`

**Or**
### The scripted way

1. Just run `./run_locally.sh`

---

## Azure

I have created an account and then created a script to prep for terraform called **get_started.sh**. The only requirement for terraforming in azure is that billing is set up and a subscription created. 

The following command will create a role as owner which will have access programmatically - store the credentials safely `az ad sp create-for-rbac --name tf-provider --role="Owner" --scopes="/subscriptions/<INSERT_SUBSCRIPTION_ID>"` 
> Steps are provided here: https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash

provider.tf, main.tf, and variables.tf were created to facilitate creating a blob storage resource to act as a backend. There is also a non-committed tfvar.tf file with credentials for provider.tf.

