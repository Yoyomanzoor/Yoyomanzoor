.PHONY: all check-deps post qmd help

# Variables for file generation
# Allows passing a title via CLI, e.g., `make post TITLE="My Awesome Post"`
TITLE ?= Untitled
DATE := $(shell date +%Y-%m-%d)

# Slugify the title (lowercase, replace spaces/special chars with hyphens)
SLUG := $(shell echo "$(TITLE)" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]/-/g' -e 's/-\+/-/g' -e 's/^-//' -e 's/-$$//')

# Fallback if SLUG evaluates to empty
ifeq ($(SLUG),)
SLUG := new-file
endif

# The default target
all:
	quarto render

help:
	@echo "Available targets:"
	@echo "  all         : Render the Quarto website (default target)"
	@echo "  check-deps  : Check for required dependencies (Quarto, extensions, TinyTeX)"
	@echo "  post        : Create a new blog post in posts/ (Usage: make post TITLE=\"My Post\")"
	@echo "  qmd         : Create a new Quarto notebook in notebooks/ (Usage: make qmd TITLE=\"My Notebook\")"
	@echo "  help        : Show this help message"

# Target to check for necessary dependencies
check-deps:
	@echo "🔍 Checking for Quarto..."
	@command -v quarto >/dev/null 2>&1 || { echo >&2 "❌ Quarto is not installed or not in PATH."; exit 1; }
	@echo "✅ Quarto is installed."
	@echo "🔍 Checking for FontAwesome extension..."
	@quarto list extensions 2>&1 | grep -q "quarto-ext/fontawesome" || { echo >&2 "❌ FontAwesome extension missing. Run: quarto add quarto-ext/fontawesome"; exit 1; }
	@echo "✅ FontAwesome extension is present."
	@echo "🔍 Checking for Academicons extension..."
	@quarto list extensions 2>&1 | grep -q "schochastics/academicons" || { echo >&2 "❌ Academicons extension missing. Run: quarto add schochastics/academicons"; exit 1; }
	@echo "✅ Academicons extension is present."
	@echo "🔍 Checking for TinyTeX..."
	@command -v tlmgr >/dev/null 2>&1 || { echo >&2 "❌ TinyTeX (tlmgr) not found in PATH. Run: quarto install tinytex"; exit 1; }
	@echo "✅ TinyTeX is installed."
	@echo "🎉 All dependencies are satisfied!"

# Generate a new blog post
post:
	@mkdir -p posts
	@if [ -f "posts/$(DATE)-$(SLUG).qmd" ]; then \
		echo >&2 "❌ Error: posts/$(DATE)-$(SLUG).qmd already exists. Try providing a different TITLE."; \
		exit 1; \
	fi
	@echo "---" > "posts/$(DATE)-$(SLUG).qmd"
	@echo "title: \"$(TITLE)\"" >> "posts/$(DATE)-$(SLUG).qmd"
	@echo "date: \"$(DATE)\"" >> "posts/$(DATE)-$(SLUG).qmd"
	@echo "categories: []" >> "posts/$(DATE)-$(SLUG).qmd"
	@echo "---" >> "posts/$(DATE)-$(SLUG).qmd"
	@echo "" >> "posts/$(DATE)-$(SLUG).qmd"
	@echo "Write your post here." >> "posts/$(DATE)-$(SLUG).qmd"
	@echo "✅ Created new post: posts/$(DATE)-$(SLUG).qmd"

# Generate a new Quarto Markdown notebook
qmd:
	@mkdir -p notebooks
	@if [ -f "notebooks/$(DATE)-$(SLUG).qmd" ]; then \
		echo >&2 "❌ Error: notebooks/$(DATE)-$(SLUG).qmd already exists. Try providing a different TITLE."; \
		exit 1; \
	fi
	@echo "---" > "notebooks/$(DATE)-$(SLUG).qmd"
	@echo "title: \"$(TITLE)\"" >> "notebooks/$(DATE)-$(SLUG).qmd"
	@echo "date: \"$(DATE)\"" >> "notebooks/$(DATE)-$(SLUG).qmd"
	@echo "---" >> "notebooks/$(DATE)-$(SLUG).qmd"
	@echo "" >> "notebooks/$(DATE)-$(SLUG).qmd"
	@echo "Write your notebook content here." >> "notebooks/$(DATE)-$(SLUG).qmd"
	@echo "✅ Created new Quarto notebook: notebooks/$(DATE)-$(SLUG).qmd"
