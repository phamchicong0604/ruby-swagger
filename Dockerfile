# Use an official Ruby runtime as a parent image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory in the container
WORKDIR /ruby-swagger

# Add the Gemfile and Gemfile.lock from your app
COPY Gemfile /ruby-swagger/Gemfile
COPY Gemfile.lock /ruby-swagger/Gemfile.lock

# Install gems
RUN bundle install

# Add the rest of your app's code
COPY . /ruby-swagger

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]