# Slack-specific config. Both sourced files hold credentials and stay untracked.
[ -s "$HOME/.slack_webapp_artifactory" ] && source "$HOME/.slack_webapp_artifactory"
[ -s "$HOME/.secrets" ] && source "$HOME/.secrets"

export KUBECONFIG="$KUBECONFIG:$HOME/.kube/config-commercial:$HOME/.kube/config"

# Claude Code via Bedrock
export CLAUDE_CODE_USE_BEDROCK=1
