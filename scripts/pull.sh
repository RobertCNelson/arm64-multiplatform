#!/bin/bash

# SPDX-FileCopyrightText: Robert Nelson <robertcnelson@gmail.com>
# SPDX-License-Identifier: MIT

BRANCH="v6.6.x-arm64-k3"
REPO="arm64-multiplatform"

git pull --no-edit https://github.com/RobertCNelson/${REPO}.git ${BRANCH}
git pull --no-edit https://gitlab.com/RobertCNelson/${REPO}.git ${BRANCH}
