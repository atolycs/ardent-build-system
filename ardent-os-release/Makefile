SOURCE_FILE := os-release.pre
.PHONY: amiya doctor

all: amiya doctor

amiya: 
	sed -e 's/%EDITION_NAME%/Amiya/g' -e 's/%EDITION_NAME_SMALL%/amiya/g' $(SOURCE_FILE) >> os-release.$@

doctor:
	sed -e 's/%EDITION_NAME%/doctor/g' -e 's/%EDITION_NAME_SMALL%/doctor/g' $(SOURCE_FILE) >> os-release.$@
