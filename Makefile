_site:
	mkdir _site
	docker run \
        -v $(shell pwd):/srv/jekyll \
        -e BUNDLE_GEMFILE=site/Gemfile \
        jekyll/builder:latest \
        /bin/bash -c 'bundle install && bundle exec jekyll build --trace --source site'

.PHONY: reset
reset:
	rm -rf _site

.PHONY: up
up:
	docker compose up -d

.PHONY: blog
blog: reset _site up

.PHONY: down
down:
	docker compose down