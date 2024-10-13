FROM ruby:3.2

# Cài đặt các dependencies
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client
RUN gem install bundler

# Thiết lập thư mục làm việc
WORKDIR /ruby-swagger

# Sao chép Gemfile và Gemfile.lock vào container
COPY Gemfile /ruby-swagger/Gemfile
# COPY Gemfile.lock /ruby-swagger/Gemfile.lock

# Cài đặt các gem
RUN bundle install

# Sao chép toàn bộ ứng dụng vào container
COPY . /ruby-swagger

# Thêm một script để chạy khi container khởi động
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]