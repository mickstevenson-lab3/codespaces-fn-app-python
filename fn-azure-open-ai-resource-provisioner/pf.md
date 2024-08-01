# prompt-flow

https://gloveboxes.github.io/prompt_flow_workshop
https://gloveboxes.github.io/prompt_flow_workshop/azure_provision




=======================================================================================================================
You are establishing an AzureOpenAI connection using an MEID token for authentication. We recommend updating your azure-identity dependency to the latest version and run `az login` if you encounter any authentication issues.

https://pypi.org/project/azure-identity/

=======================================================================================================================
# Notices:
# - Don't replace the '<user-input>' placeholder in this file, the application will prompt you to enter a value when it runs.
# - Manually save the file will create the connection after basic validation.
# - The connection information will be stored in a local database with api_key encrypted for safety.
# - Prompt flow will ONLY use the connection information (incl. keys) when instructed by you, e.g. manage connections, use connections to run flow etc.
# - All the values should be string type, please use "123" instead of 123 or "True" instead of True.

$schema: https://azuremlschemas.azureedge.net/promptflow/latest/CognitiveSearchConnection.schema.json
name: "srch-lyzyzqbqcp7ju"
type: cognitive_search # snake case
api_key: "<user-input>" # Don't replace the '<user-input>' placeholder. The application will prompt you to enter a value when it runs.
api_base: "endpoint"
api_version: "2023-11-01"

=======
 /usr/local/bin/python /home/vscode/.vscode-server/extensions/prompt-flow.prompt-flow-1.20.1/pfutil/pfutil.py connection upsert -f /home/vscode/.promptflow/temp/new_CognitiveSearch_connection.yaml -o /tmp/pf-upsertConnection-95526c16-f704-4d5c-bf07-cf3581a83164.json

=======================================================================================================================
# Notices:
# - Don't replace the '<user-input>' placeholder in this file, the application will prompt you to enter a value when it runs.
# - Manually save the file will create the connection after basic validation.
# - The connection information will be stored in a local database with api_key encrypted for safety.
# - Prompt flow will ONLY use the connection information (incl. keys) when instructed by you, e.g. manage connections, use connections to run flow etc.
# - All the values should be string type, please use "123" instead of 123 or "True" instead of True.

# - You have several ways to get such info:
#   1. Go to the AOAI studio, open playground, view code, then you can get what you need;
#   2. Go to the AOAI studio, settings -- resource -- list of resource, endpoint is api_base and key is api_key;
#   3. Go to the Azure portal, find your AOAI resource, and then get the keys.

$schema: https://azuremlschemas.azureedge.net/promptflow/latest/AzureOpenAIConnection.schema.json
name: "aoai-lyzyzqbqcp7ju"
type: azure_open_ai # snake case
#api_key: "<user-input>" # Don't replace the '<user-input>' placeholder. The application will prompt you to enter a value when it runs.
api_base: "https://aoai-lyzyzqbqcp7ju.openai.azure.com/"
api_type: "azure"
api_version: "2024-02-01"
auth_mode: meid_token # auth_mode: meid_token to use managed identity, and comment 'api_key' line out.   

=======
$ /usr/local/bin/python /home/vscode/.vscode-server/extensions/prompt-flow.prompt-flow-1.20.1/pfutil/pfutil.py connection upsert -f /home/vscode/.promptflow/temp/new_AzureOpenAI_connection.yaml -o /tmp/pf-upsertConnection-9a568c37-257a-45f1-8cc4-ea10924c6c5c.json
=======================================================================================================================



ensure that the requirements are correct

=============================================
build process
=============================================
pf flow build --source flows/ --output flows-output/ --format docker
docker build flows-output -t dag-flow-image:0.0.1
docker run -p 8080:8080 -e PROMPTFLOW_WORKER_NUM=1 -e PROMPTFLOW_WORKER_THREADS=1 dag-flow-image:0.0.1

curl http://localhost:8080/score --data '{"question":"what are the 10 commandments"}' -X POST  -H "Content-Type: application/json"

=============================================



pf flow build --source flows/ --output flows-output/ --format docker
docker build flows-output -t dag-flow-image:0.0.1
docker run -p 8080:8080 -e PROMPTFLOW_WORKER_NUM=1 -e PROMPTFLOW_WORKER_THREADS=1 -e AZURE_CLIENT_ID=673c1932-2d78-45f2-a792-6e519efa0876 -e AZURE_TENANT_ID=8c2f9663-624c-49be-9084-3a09a7483592 -e AZURE_CLIENT_SECRET=NG18Q~Y0cOOI5ruUTsB151zsiGz1i7VX81nxXbcv dag-flow-image:0.0.4 


curl http://localhost:8080/score --data '{"question":"what are the 10 commandments"}' -X POST  -H "Content-Type: application/json"


az ad sp create-for-rbac -n SPPromptFlow --role="Contributor" --scopes="/subscriptions/8bb6820f-0dbe-4107-b936-7f76b687202d"
{
  "appId": "673c1932-2d78-45f2-a792-6e519efa0876",
  "displayName": "SPPromptFlow",
  "password": "NG18Q~Y0cOOI5ruUTsB151zsiGz1i7VX81nxXbcv",
  "tenant": "8c2f9663-624c-49be-9084-3a09a7483592"
}


=============================================================

* the container built with a set of connections with blank values
* at startup the connection initiator is called using the mapping file will create each connection setting values from the specified environment variables
* validation required to check that all connections have been created that are required

pf connection create  -f flows/connections/azure_open_ai.yaml --set api_base='https://aoai-lyzyzqbqcp7ju.openai.azure.com/'

=============================================================
