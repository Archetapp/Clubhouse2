# Clubhouse Clone App

## Build Instructions
Since the app is using AWS Amplify as a backend, we will be working with the Amplify CLI. To install, run the following:

```shell
$ curl -sL https://aws-amplify.github.io/amplify-cli/install | bash && $SHELL
```

Amplify requires certain configuration files to communicate with AWS and keep changes in sync. Since we are currently working in a sandbox mode, run the following command at the root of the project directory to pull that configuration to your local project.

```shell
$ amplify pull --sandboxId 69dd8f91-fb1c-4097-be88-9250cf0454d1
```