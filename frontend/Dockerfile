FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Set backend URL for Next.js build
ENV NEXT_PUBLIC_API_URL=https://prod-backend-service-5c2dubkgnq-el.a.run.app

# Build Next.js app
RUN npm run build

EXPOSE 3000

CMD ["npm","start"]