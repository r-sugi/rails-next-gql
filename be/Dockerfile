FROM ruby:3.0.3

# ディレクトリ・ファイルの作成
# RUN mkdir /be
WORKDIR /be
COPY Gemfile /be/Gemfile
COPY Gemfile.lock /be/Gemfile.lock

# gem(Rails6)のインストール
RUN bundle install
COPY . /be

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
