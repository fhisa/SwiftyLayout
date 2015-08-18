PROJECT = FormulaStyleConstraint.xcodeproj
TARGET = FormulaStyleConstraint
SCHEME = FormulaStyleConstraint

clean:
	xcodebuild -project $(PROJECT) -configuration Debug clean
	xcodebuild -project $(PROJECT) -configuration Release clean

test:
	xctool \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-sdk iphonesimulator \
 		-configuration Debug \
		build \
		test
	
# test:
# 	xcodebuild \
# 		-project $(PROJECT) \
# 		-scheme $(SCHEME) \
# 		-sdk iphonesimulator \
# 		-configuration Debug \
# 		TEST_AFTER_BUILD=YES \
# 		TEST_HOST= \
# 		test
