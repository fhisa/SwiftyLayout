PROJECT = FormulaStyleConstraint.xcodeproj
TARGET = FormulaStyleConstraint
SCHEME = FormulaStyleConstraint

clean:
	xcodebuild -project $(PROJECT) -configuration Debug clean
	xcodebuild -project $(PROJECT) -configuration Release clean

test:
	xcodebuild \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-sdk iphonesimulator \
		-configuration Debug \
		TEST_AFTER_BUILD=YES \
		TEST_HOST= \
		test
