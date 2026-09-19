.PHONY: lint fix

IS_WORKTREE := $(shell git -C $(CURDIR) worktree list 2>/dev/null | grep -q "$(CURDIR)" && echo "yes" || echo "no")

# If worktree, fetch common git directory path
ifeq ($(IS_WORKTREE), yes)
GIT_COMMON_DIR := $(shell git -C $(CURDIR) rev-parse --git-common-dir)
endif

# Build Docker run command
ifeq ($(IS_WORKTREE), yes)
DOCKER_VOLUMES := -v $(GIT_COMMON_DIR):$(GIT_COMMON_DIR) -v $(CURDIR):/tmp/lint
else
DOCKER_VOLUMES := -v $(CURDIR):/tmp/lint
endif

# Main target
lint:
	@echo "Running Super-Linter..."
	docker run --rm \
	  -e RUN_LOCAL=true \
	  -e DEFAULT_BRANCH=main \
	  -e FILTER_REGEX_EXCLUDE="^.*\.agents.+" \
	  -e VALIDATE_JSCPD=false \
	  -e VALIDATE_BIOME_FORMAT=false \
	  -e VALIDATE_BIOME_LINT=false \
	  -e VALIDATE_PYTHON_BLACK=false \
	  $(DOCKER_VOLUMES) \
	  ghcr.io/super-linter/super-linter:latest

# Linter to run in fix mode
FIX_LINTER := MARKDOWN

# Fix target
fix:
	@echo "Running Super-Linter in fix mode..."
	docker run --rm \
	  -e RUN_LOCAL=true \
	  -e DEFAULT_BRANCH=main \
	  -e FILTER_REGEX_EXCLUDE="^.*\.agents.+" \
	  -e VALIDATE_JSCPD=false \
	  -e VALIDATE_BIOME_FORMAT=false \
	  -e VALIDATE_BIOME_LINT=false \
	  -e VALIDATE_PYTHON_BLACK=false \
	  -e FIX_$(FIX_LINTER)=true
	  $(DOCKER_VOLUMES) \
	  ghcr.io/super-linter/super-linter:latest
