#!/bin/bash

# force a clean tree before applying patches
repo forall -c git reset --hard HEAD
repo forall -c git clean -df
# Vold integration
cp external/efs-tools/integration/vold/EncryptedFileStorageCmd.cpp system/vold/
cp external/efs-tools/integration/vold/EncryptedFileStorageCmd.h system/vold/
git apply external/efs-tools/integration/vold/Vold-integration.patch --directory=system/vold/
# Core integration
git apply external/efs-tools/integration/core/Core-integration.patch --directory=system/core/
# Framework integration
git apply external/efs-tools/integration/frameworks-base/MountManagerService-integration.patch --directory=frameworks/base/
# Settings integration
git apply external/efs-tools/integration/settings/Settings-integration.patch --directory=packages/apps/Settings/
# SeLinux policy integration
git apply external/efs-tools/integration/sepolicy/EFS-SeLinux-Policy.patch --directory=external/sepolicy/
