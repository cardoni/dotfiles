#!/bin/bash

run_npm_install=true
# git_provider_hostname=bitbucket.org
git_provider_hostname=github.com
git_provider_username=cardoni
_pwd=$(pwd)
repositories=(
    "platform-authorizer-apigateway-lambda"
    "platform-custom-message-trigger-lambda"
    "platform-post-auth-trigger-lambda"
    "platform-post-confirmation-trigger-lambda"
    "platform-pre-auth-trigger-lambda"
    "platform-pre-signup-trigger-lambda"
    "platform-user-change-attribute-lambda"
    "platform-user-change-password-lambda"
    "platform-user-confirm-registration-lambda"
    "platform-user-create-lambda"
    "platform-user-create-verification-code-lambda"
    "platform-user-delete-lambda"
    "platform-user-forgot-password-lambda"
    "platform-user-lock-lambda"
    "platform-user-login-lambda"
    "platform-user-mfa-login-lambda"
    "platform-user-new-lambda"
    "platform-user-refresh-lambda"
    "platform-user-unlock-lambda"
    "platform-user-update-create-lambda"
    "platform-user-verify-communication-lambda"
    "platform-user-verify-message-lambda"
    "platform-user-verify-password-lambda"
)

print_line () {
    printf '%50s\n' | tr ' ' -
}

printf "\nCloning and/or Updating ${#repositories[@]} Repositories\n"
print_line

for repository in "${repositories[@]}"
do
    printf "Processing \'${repository}\'... "
    if [[ -d "${repository}" && ! -L "${repository}" ]]; then
        printf "Found existing directory. "
        # cd into repo directory; update via `git pull`
        cd "${repository}" || return
        # Evidently it's the case that Mac OS will occasionally generate a new
        # `.DS_Store` file upon folder creation. As such, if a given repository
        # isn't ignoring `.DS_Store` files, it's imperative that any such file
        # be deleted *prior* to executing `git clone` and/or `git pull`.
        rm -rf .DS_Store
        git reset HEAD --hard
        git pull
        if [[ "$run_npm_install" = true ]]; then
            npm install
        fi
        # return to our original directory
        cd "${_pwd}" || return
    else
        printf "Not Found. Cloning repository... "
        rm -rf .DS_Store
        git clone "git@${git_provider_hostname}:${git_provider_username}/${repository}.git"
        if [[ "$run_npm_install" = true ]]; then
            # if it's desired to cd into the directory and run `npm install`
            cd "${repository}" || return
            npm install
            # return to our original directory
            cd "${_pwd}" || return
        fi
        printf "Done.\n\n"
    fi
done

# printf "\n"
