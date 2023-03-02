#! /bin/bash

echo "✓ Set Scripts variables and Secrets for usage."
source .env-script
source .env-secrets

echo "✓ Set Github Token as local variable." 
export GH_TOKEN=$GH_TOKEN

echo "✓ Replace Client and Environments name."
sed -i '' 's/GHCLIENT/'${GHCLIENT}'/' .env-secrets
sed -i '' 's/GHENVIRONMENT/'$GHENVIRONMENT'/' .env-secrets

echo "✓ Set Github repo secrets."
gh secret set -f .env-secrets

echo "✓ Backup created secret file."
touch .ENV-$GHCLIENT-$GHENVIRONMENT
cat .env-secrets >> .ENV-$GHCLIENT-$GHENVIRONMENT

echo "✓ Reset Client and Environments name to default."
sed -i '' 's/'$GHCLIENT'/GHCLIENT/' .env-secrets
sed -i '' 's/'$GHENVIRONMENT'/GHENVIRONMENT/' .env-secrets

echo "✓ Done!. Secrets has been set."