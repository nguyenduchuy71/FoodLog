# Use the official Ruby image as the base image
FROM ruby:3.0.2

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock /app/

# Update bundler
RUN gem update bundler

# Install gems
RUN bundle install

# Copy the rest of the application code to the container
COPY . /app/

# Create the database (this example assumes you are using PostgreSQL)
RUN bundle exec rake db:create

# Expose port 3000 to the Docker host, so it can be accessed from the outside
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
