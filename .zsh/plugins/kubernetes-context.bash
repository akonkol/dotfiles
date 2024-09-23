function kubernetes-context {
  local context namespace

  if [ -n "$KUBECONFIG" ]; then
    echo -n "\$KUBECONFIG is not supported"
    return
  fi

  context=$(/usr/local/bin/yq '.current-context // ""' ${HOME}/.kube/config)
  fs_context=$(echo ${context} | awk -F_ '{print $2}')

  if [ -z "$context" ]; then
    return
  fi

  namespace=$(
    /opt/homebrew/bin/yq  "(.contexts[] | select(.name == \"$context\").context.namespace) // \"\"" \
      ${HOME}/.kube/config
  )

  echo -n "$fs_context"

  if [ -n "$namespace" ]; then
    echo -n " ❯ $namespace"
  fi
}
