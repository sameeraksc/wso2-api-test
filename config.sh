#!/bin/sh

#echo $(which apictl)
#apictl version

#rm -rf $HOME/.wso2apictl

echo 'setting up dev environment'
apimcli add-env -n dev \
          --registration https://wso2apim.101digital.io/client-registration/v0.14/register \
          --apim https://wso2apim.101digital.io \
          --token https://wso2apim-is.101digital.io/oauth2/token \
          --import-export  https://wso2apim.101digital.io/api-import-export-2.6.0-v14 \
          --admin https://localhost:9443/api/am/admin/v0.14 \
          --api_list https://wso2apim.101digital.io/api/am/publisher/v0.14/apis \
          --app_list  https://wso2apim.101digital.io/api/am/store/v0.14/applications

echo 'setting up prod environment'
