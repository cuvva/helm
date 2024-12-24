# Cuvva Service Helm Chart

This repository contains the Helm chart to render the kubernetes resources for 
each backend service.

These templates are currently rendered by ArgoCD.

## Development

After making changes to the helm charts, also make changes to the `test_values.yaml` file and run:
- `make lint` to try rendering the helm chart, check the output is as you expect.

## Releasing a new version

- Merge the new code changes to master
- Change the version in the `Chart.yaml` file
- Run `make build` to create the new version archive and update the index.yaml
- Create pull request for the release

Then update ArgoCD to use the new version.

In the monorepo `infra/argocd-nonprod/argo-app.tf` lines change the `targetRevision` to the new version.
```terraform
chart          = "service"
repoURL        = "https://cuvva.github.io/helm/"
targetRevision = "0.5.0"
```
