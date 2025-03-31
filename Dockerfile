# Start from a minimal base image
FROM alpine:3.19

# Add a simple health check command
RUN apk add --no-cache curl

# Create a basic HTML file to serve
RUN echo "<html><body><h1>ArgoCD Test App</h1><p>If you see this, the image was pulled successfully!</p></body></html>" > /index.html

# Expose port 8080
EXPOSE 8080

# Use busybox httpd to serve the static file
CMD ["busybox", "httpd", "-f", "-p", "8080", "-h", "/"]
