#!/bin/bash

VERSION_SCRIPT="Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC1090
. "$VERSION_SCRIPT" && \
  echo "Installing the '$VERSIONABLE_NAME' target, please wait" && \
  cd "Library" && \
  rm -rf ./Build && \
  mkdir Build && \
  cd Build && \
  cmake -GNinja .. && \
  ninja -j "$(nproc)" && \
  sudo ninja install && \
  echo "The '$VERSIONABLE_NAME' target has been installed with success" && \
  cd .. && rm -rf ./Build

# Install log example:
#
#-- Install configuration: ""
#-- Installing: /usr/local/lib/cmake/argparse/argparseConfig.cmake
#-- Installing: /usr/local/include/argparse/argparse.hpp
#-- Installing: /usr/local/lib/cmake/argparse/argparseConfig-version.cmake
#-- Installing: /usr/local/lib/pkgconfig/argparse.pc

