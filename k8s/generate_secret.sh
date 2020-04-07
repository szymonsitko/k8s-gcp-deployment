# Assign environmental variables
SECRET_NAME=pgpassword
ENV_VAR_NAME=$1
ENV_VAR_VALUE=$2

# Create secret
kubectl create secret generic $SECRET_NAME --from-literal $ENV_VAR_NAME=$ENV_VAR_VALUE

# Describe newly created secret
kubectl describe secret pgpassword