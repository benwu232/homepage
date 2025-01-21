# Makefile for deploying the Flutter web projects to GitHub

# For root deployment, BASE_HREF should be /
BASE_HREF = /
# Replace this with your GitHub username
GITHUB_USER = benwu232
GITHUB_REPO = https://github.com/$(GITHUB_USER)/$(GITHUB_USER).github.io
BUILD_VERSION := $(shell findstr "version:" pubspec.yaml | find "version:" > tmp.txt && for /f "tokens=2" %%i in (tmp.txt) do @echo %%i && del tmp.txt)

# Deploy the Flutter web project to GitHub
deploy:
	@echo "Clean existing repository"
	flutter clean
	
	@echo "Getting packages..."
	flutter pub get
	
	@echo "Generating the web folder..."
	flutter create . --platform web
	
	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release
	
	@echo "Copying app-ads.txt to web build..."
	copy app-ads.txt build\web\app-ads.txt
	
	@echo "Copying assetlinks.json to web build..."
	mkdir build\web\.well-known 2>nul
	copy assetlinks.json build\web\.well-known\assetlinks.json
	
	@echo "Deploying to git repository: $(GITHUB_REPO)"
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M master && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u -f origin master
	
	@echo "✅ Finished deploy: $(GITHUB_REPO)"
	@echo "🚀 Flutter web URL: https://$(GITHUB_USER).github.io/"

.PHONY: deploy
