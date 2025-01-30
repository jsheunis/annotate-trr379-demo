# Important directories
VUE_APP_DIR = shacl-vue
DIST_DIR = dist

# Install vite and shacl-vue dependencies
install:
	npm install vite
	cd $(VUE_APP_DIR) && npm install

# Build shacl-vue using top-level Vite-config
# Copy shacl-vue config to dist directory
build: clean
	cd $(VUE_APP_DIR) && npm run build
	mv $(VUE_APP_DIR)/dist .
	cp config.json $(DIST_DIR)/config.json

# Clean output
clean:
	rm -rf $(DIST_DIR)

deploy: $(DIST_DIR)
	rsync -rvz --delete $</ herbert.trr379.de:/var/www/annotate.trr379.de/www/

.PHONY: install build clean deploy
