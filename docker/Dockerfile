FROM node:18-alpine

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production && \
    npm cache clean --force

COPY --chown=nodejs:nodejs . .

USER nodejs

EXPOSE 3000

CMD ["node", "index.js"]
