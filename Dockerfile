# Use the latest nginx alpine image for smaller size
FROM nginx:alpine

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Create directory and copy application files
RUN rm -rf /usr/share/nginx/html/*
COPY dota-spy-game/ /usr/share/nginx/html/

# Health check to ensure container is running properly
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

# Expose port 80
EXPOSE 80

# Set non-root user for security (nginx runs as nginx user by default in alpine)
USER nginx

# Start nginx
CMD ["nginx", "-g", "daemon off;"]