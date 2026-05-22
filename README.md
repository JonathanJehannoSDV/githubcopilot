# githubcopilot

Infrastructure Azure gérée avec Terraform et déployée via GitHub Actions.

## Arborescence

- `terraform/` : configuration Terraform principale
- `.github/workflows/deploy.yml` : pipeline de validation et déploiement

## Prérequis

- Terraform `>= 1.5`
- Un abonnement Azure
- Un stockage Blob Azure dédié au `tfstate`
- Les secrets GitHub listés plus bas

## Ressources créées

- Resource Group
- Virtual Network en `10.0.0.0/16`
- Subnet dédié
- Network Security Group avec SSH ouvert sur le port `22`
- Public IP
- NIC
- VM Ubuntu 22.04
- Storage Account

## Variables Terraform

Les variables exposées sont définies dans `terraform/variables.tf`.

- `location` : région Azure, valeur par défaut `westeurope`
- `rg_name` : nom du Resource Group, valeur par défaut `rg-terraform-training`
- `vm_size` : taille de la VM, valeur par défaut `Standard_B2s`

## Backend Terraform

Le backend Azure Blob Storage est défini dans `terraform/backend.tf`.

Le workflow GitHub Actions surcharge ces valeurs avec les secrets suivants :

- `TFSTATE_RESOURCE_GROUP`
- `TFSTATE_STORAGE_ACCOUNT`
- `TFSTATE_CONTAINER`
- `TFSTATE_KEY`

## Secrets GitHub

Crée ces secrets dans le dépôt GitHub pour que le workflow puisse fonctionner :

- `AZURE_CREDENTIALS`
- `TFSTATE_RESOURCE_GROUP`
- `TFSTATE_STORAGE_ACCOUNT`
- `TFSTATE_CONTAINER`
- `TFSTATE_KEY`

Exemple de valeurs pour les secrets liés au state :

- `TFSTATE_RESOURCE_GROUP` = `tfstate-rg`
- `TFSTATE_STORAGE_ACCOUNT` = `sttfstate12345`
- `TFSTATE_CONTAINER` = `tfstate`
- `TFSTATE_KEY` = `terraform.tfstate`

## Déploiement local

Depuis le dossier `terraform/` :

```bash
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan
```

## Pipeline GitHub Actions

Le workflow `.github/workflows/deploy.yml` s'exécute sur `push` vers `main` et en manuel via `workflow_dispatch`.

Jobs présents : `init`, `validate`, `plan`, `apply`.