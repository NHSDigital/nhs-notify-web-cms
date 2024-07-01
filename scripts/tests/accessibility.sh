#!/bin/bash

set -euo pipefail

# Ensure we're at the project root
cd "$(git rev-parse --show-toplevel)"

# CD into docs folder
cd docs

# Run Jekyll app in PM2 container
npm run app:start

# Wait for web application
sleep 5

# Run accessibility tests
npm run test:accessibility

# Kill PM2 container
npm run app:stop

# Return to original directory
cd -
