#!/bin/bash

echo "Preparing the 'argparse' library for the installation" && \
  git submodule init && git submodule update && \
  echo "The 'argparse' library is prepared for the installation"
