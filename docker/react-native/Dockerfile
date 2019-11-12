FROM node:10-alpine

RUN apk add --no-cache \
		gmp-dev \
		yaml-dev \
		zlib-dev

COPY --from=ruby:2.6-alpine /usr/local/ /usr/local/

RUN ruby --version; \
	gem --version; \
	bundle --version

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
# path recommendation: https://github.com/bundler/bundler/pull/6469#issuecomment-383235438
ENV PATH $GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH
# adjust permissions of a few directories for running "gem install" as an arbitrary user
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"

RUN gem install cocoapods
