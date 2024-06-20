# Node image as starting point
FROM node:22-alpine

# Set working directory
WORKDIR /backend

# Copy Required definition files for installation 
COPY package*.json ./

# Install NPM packages
RUN npm install

# Copy project files
COPY . .

# Initialize Prisma
RUN npx prisma generate
RUN npm run migrate:reset

# Set environment variables
ENV PORT=3000

# Port forward
EXPOSE 3000

# Run the server
CMD ["npm", "run", "watch"]