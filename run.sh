#!/bin/bash

filebrowser -a 0.0.0.0 -p 8081 -r / &
# Start the Docker daemon
dockerd &

# Keep the script running to prevent it from exiting
tail -f /dev/null
