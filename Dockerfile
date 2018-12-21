# Base our image on an official, minimal image of our preferred Ruby
# FROM ruby:2.3.8-slim
FROM ruby:2.3.8

RUN apt-get update -qq \
  && apt-get install -y \
    # Needed for certain gems
    build-essential \
    libxml2 \
    libxml2-dev \
    libpq-dev \
    nodejs \
    qt5-default \
    libqt5webkit5-dev \
    # The following are used to trim down the size of the image by removing unneeded data
  # && apt-get clean autoclean \
  # && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

# Define where our application will live inside the image
ENV RAILS_ROOT /app
ENV RAILS_ENV production

# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
ADD Gemfile* ./

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Finish establishing our Ruby enviornment
RUN bundle install

# Copy the Rails application into place
COPY . .

# add custom scripts
ADD docker-files/vars.sh /vars.sh
ADD docker-files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh /vars.sh

EXPOSE 3000

# execute custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
CMD "bundle exec rails s -p 3000 -b 0.0.0.0"
