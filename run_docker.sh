#!/bin/bash

# Simple script to run the Dota 2 Spy Game using Docker
# This script builds and starts the Docker container with the game

echo "Starting Dota 2 Spy Game..."
echo "The application will be available at http://localhost:8080"

# Build and start the container using docker-compose
docker-compose up -d --build

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Dota 2 Spy Game is now running!"
    echo "🌐 Open your browser and go to: http://localhost:8080"
    echo ""
    echo "💡 To stop the game, run: docker-compose down"
else
    echo "❌ Error starting the game. Please check Docker and docker-compose are installed."
    exit 1
fi