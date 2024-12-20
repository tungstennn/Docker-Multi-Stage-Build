# Stage 0: Development Environment

FROM node AS builder

# Not required but best practice to set working directory

WORKDIR /app

COPY . .

RUN npm install

# Stage 1: Production Environment

FROM node:alpine AS production

COPY --from=builder /app .

RUN adduser -S user1

USER user1

EXPOSE 3000

CMD [ "npm", "start" ]
