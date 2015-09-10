BUILDCOMMAND = xctool
PROJECT = FormulaStyleConstraint.xcodeproj
SCHEME_IOS = FormulaStyleConstraint-iOS
SCHEME_MACOS = FormulaStyleConstraint-Mac
CONFIGURATION = Debug

clean:
	$(BUILDCOMMAND) -project $(PROJECT) -scheme $(SCHEME_IOS) clean
	$(BUILDCOMMAND) -project $(PROJECT) -scheme $(SCHEME_MACOS) clean

test: test_ios test_macos

test_ios:
	$(BUILDCOMMAND) \
		-project $(PROJECT) \
		-scheme $(SCHEME_IOS) \
		-sdk iphonesimulator \
		-configuration $(CONFIGURATION) \
		build \
		test

test_macos:
	$(BUILDCOMMAND) \
		-project $(PROJECT) \
		-scheme $(SCHEME_MACOS) \
		-sdk macosx \
		-configuration $(CONFIGURATION) \
		build \
		test
