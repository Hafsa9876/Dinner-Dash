# Use an official Ruby runtime as the base image
FROM ruby:2.7.8

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code to the container
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
