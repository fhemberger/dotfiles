#!/usr/bin/env zsh

if [ "${commands[terraform]}" ]; then
  alias tf=terraform

  alias tfa='terraform apply'
  alias tfa!='terraform apply -auto-approve'
  alias tfd='terraform destroy'
  alias tfd!='terraform destroy -auto-approve'
  alias tff='terraform fmt -recursive'
  alias tfi='terraform init'
  alias tfir='terraform init -reconfigure'
  alias tfiu='terraform init -upgrade'
  alias tfiur='terraform init -upgrade -reconfigure'
  alias tfp='terraform plan'
  alias tfv='terraform validate'
fi
