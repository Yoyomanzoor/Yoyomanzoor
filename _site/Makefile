POST_TEMPLATE := ./_data/blog-post-template.md
EDITOR ?= nvim
POST_NAME ?= "post"
DDATE := $(shell date +%Y-%m-%d)
DDATETIME := $(shell date +"%Y-%m-%d %H:%M:%S")

.PHONY: all
all:
	jekyll serve

.PHONY: post
post: rename
	# POST_NAME=$$(echo $(POST_NAME) | tr ' ' -);
	@echo "Creating new post: $(POST_NAME)"
	@cat $(POST_TEMPLATE) | \
	sed "s/YYYY-MM-DD/$(DDATETIME)/g" | \
	sed "s/blog-title/$(POST_NAME)/g" >> ./_posts/$(DDATE)-$(POST_NAME).md
	@$(EDITOR) ./_posts/$(DDATE)-$(POST_NAME).md

rename:
	$(eval POST_NAME = $(shell echo $(POST_NAME) | tr ' ' -))
