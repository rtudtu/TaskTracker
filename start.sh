#!/bin/bash

export MIX_ENV=prod
export PORT=4795

echo "Stopping old copy of app, if any..."

_build/prod/rel/tasktracker/bin/tasktracker stop || true

echo "Starting app..."

# Start to run in background from shell.
#_build/prod/rel/blackjack/bin/blackjack start

# Foreground for testing and for systemd
_build/prod/rel/tasktracker/bin/tasktracker foreground