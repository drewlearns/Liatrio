# Liatrio Exercise

## Objectives

✅ Build an application in the programming language of your choice that exposes a REST
endpoint that returns the following JSON payload with the current timestamp and a static
message:
{
“message”: “Automate all the things!”,
“timestamp”: 1529729125
}

✅ The application must be deployed on a Kubernetes cluster running in a public cloud provider of
your choice. 

✅ The provisioning of the cluster as well as the deployment of the application must
be done through code. Costs incurred as part of this exercise may be reimbursed, please reach out to the Slack channel with questions about specific costs.

--- 

## Requirements

✅ Commit all code to a public git repository.

✅ Include a README.md containing detailed directions on how to run, what is running, and how to cleanup.

✅ Provide a single command to launch the environment and deploy the application.

✅ Some prerequisites are OK as long as they are properly documented.

✅ We should be able to deploy and run the application in our own public cloud accounts.

✅ Include some form of automated tests to validate the environment.

✅ Presentation (deck or medium of your choice)

❌ Demo prep call with one of the Liatrio engineers

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

> The get_started.sh script uses the following command will create a role as owner which will have access programmatically - store the credentials safely `az ad sp create-for-rbac --name tf-provider --role="Owner" --scopes="/subscriptions/<INSERT_SUBSCRIPTION_ID>"` in .env then source the file and check it using `printenv`. Steps are provided here: https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash

Originally I was going to create a storage backend for my terraform state but I thought about it and it was not necessary since its only me in this repository.

In terraform we create 13 resources including AKS cluster, Storage, Devops solution (speaking of there is a personal access token that you need from the UI and place in .env file). It's total overkill for such a simple application.

---

## Azure Devops Pipelines

To get this to work I had to downgrade K8s to version 1.23.15 due to a known issue I stumbled upon at azure with service connections and v1.24+ not auto provisioning service accounts. This decision was based on saving time more than doing the job the right way. Lessons were learned and some love for Azure disappated in the process. 

After downgrading it was a simple process of creating a pipeline with service connections to k8s and the registry. 

I then added a step that runs a 10 second max call to the assigned IP and fails if there is no response or any errors. It's not the best test but it demonstrates my ability to create pipeline with added steps related to test.

Upon getting the build to work I did initially struggle with getting the IP address to answer, the problem lied in my manifest files due to the port I was exposing not matching my actual port I expose in javascript. I updated all ports to port 80 so no port was required to be added to any calls to the container.

---

## What I learned and enjoyed about this process

I got to play with all the tools and be creative with the Node.js application. I learned a few things about service accounts and added service accounts to my list of subjects to grow on. 

I got to screen share with Blaire who was exceptionally helpful, thoughtful and patient.

Lastly, I learned I should better time box projects like this in the future. I also added github actions udemy course with 10.5 hours of instruction to my syllabus. 

