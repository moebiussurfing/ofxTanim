meta:
	ADDON_NAME = ofxTanim
	ADDON_DESCRIPTION = Timeline animation library integration for openFrameworks apps
	ADDON_AUTHOR = hegworks + OF integration blueprint
	ADDON_TAGS = "timeline" "animation" "imgui" "entt"
	ADDON_URL = https://github.com/hegworks/tanim

common:
	ADDON_DEPENDENCIES = ofxEnTT ofxImGui

	ADDON_INCLUDES += src
	ADDON_INCLUDES += libs/include
	ADDON_INCLUDES += libs/external/magic_enum/include
	ADDON_INCLUDES += libs/external/visit_struct/include
