BUILDCOMMAND = xcodebuild
PROJECT = FormulaStyleConstraint.xcodeproj
SCHEME_IOS = FormulaStyleConstraint-iOS
SCHEME_MACOS = FormulaStyleConstraint-Mac
CONFIGURATION = Debug

test: clean	test_ios test_macos

clean:
	$(BUILDCOMMAND) \
	    -project $(PROJECT) \
		clean

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
