BUILDCOMMAND = xcodebuild
PROJECT = SwiftyLayout.xcodeproj
SCHEME_IOS = SwiftyLayout-iOS
SCHEME_MACOS = SwiftyLayout-Mac
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
		test \
		TEST_AFTER_BUILD=YES \
		TEST_HOST=

test_macos:
	$(BUILDCOMMAND) \
		-project $(PROJECT) \
		-scheme $(SCHEME_MACOS) \
		-sdk macosx \
		-configuration $(CONFIGURATION) \
		build \
		test \
		TEST_AFTER_BUILD=YES \
		TEST_HOST=
