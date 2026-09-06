# Use the official Node.js version 20 image as the base.
# This pulls a full Debian-based image (roughly 1 GB) that includes
# compilers, curl, git, apt, and hundreds of other tools.
# Those tools are useful for building software but dangerous
# to leave in a production image.
FROM node:20

# Set the working directory inside the container.
# All subsequent instructions run relative to this path.
# If the directory does not exist, Docker creates it automatically.
WORKDIR /app

# Copy everything from the current directory on your machine
# into /app inside the container.
# This includes app.js and package.json -- but also .env,
# any private keys, and everything else in the folder.
COPY . .

# Install Node.js dependencies inside the container.
# Because no USER instruction has appeared yet,
# this runs as root (uid 0).
RUN npm install

# Document that the container listens on port 3000.
# This is metadata only. It does not publish the port.
# You still need -p when running the container.
EXPOSE 3000

# The command that starts when the container runs.
# No USER was set above, so this process runs as root.
CMD ["npm", "start"]
