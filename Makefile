# Executables
AGLIO_EXEC = ./node_modules/.bin/aglio
THEME = slate

generator:
	@rm -rf ./build; mkdir ./build
	@$(AGLIO_EXEC) --theme-variables $(THEME) -i ./docs/account.apib -o ./build/account.html
	@$(AGLIO_EXEC) --theme-variables $(THEME) -i ./docs/analysis.apib -o ./build/analysis.html
	@$(AGLIO_EXEC) --theme-variables $(THEME) -i ./docs/device.apib -o ./build/device.html

live:
	@$(AGLIO_EXEC) --theme-variables $(THEME) -i ./docs/$(doc).apib -s

deploy:
	@echo "not implemented yet"

.PHONY: generator live deploy
