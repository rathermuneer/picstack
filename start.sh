#!/bin/bash
cd "$(dirname "$0")"

PORT=8080

# Kill any existing server on this port
lsof -ti:$PORT | xargs kill -9 2>/dev/null
sleep 0.3

echo "Starting Collage Maker on http://localhost:$PORT"
python3 -m http.server $PORT &
SERVER_PID=$!

sleep 0.6

# Open in browser
if command -v open &>/dev/null; then
  open "http://localhost:$PORT"
elif command -v xdg-open &>/dev/null; then
  xdg-open "http://localhost:$PORT"
fi

echo "Running (PID $SERVER_PID). Press Ctrl+C to stop."
echo "To install as a desktop app: open Chrome → address bar → Install icon"

wait $SERVER_PID
