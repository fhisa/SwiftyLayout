PROJECT = FormulaStyleConstraint.xcodeproj
SCHEME = FormulaStyleConstraint

clean:
	xctool -project $(PROJECT) -scheme $(SCHEME) clean

test:
	xctool \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-sdk iphonesimulator \
		-configuration Debug \
		build \
		test
