POST_TEMPLATE := ./_data/blog-post-template.md
EDITOR ?= nvim
POST_NAME ?= "post"
DDATE := $(shell date +%Y-%m-%d)
DDATETIME := $(shell date +"%Y-%m-%d %H:%M:%S")

.PHONY: all
all: 
	docker compose up

.PHONY: post
post:
	@cat $(POST_TEMPLATE) | \
	sed "s/YYYY-MM-DD/$(DDATETIME)/g" | \
	sed "s/blog-title/$(POST_NAME)/g" >> ./_posts/$(DDATE)-$(POST_NAME).md
	@$(EDITOR) ./_posts/$(DDATE)-$(POST_NAME).md
