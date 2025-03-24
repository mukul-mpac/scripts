#!/bin/bash

echo "🔍 Checking current key mapping..."
CURRENT_MAPPING=$(hidutil property --get "UserKeyMapping" 2>/dev/null)

# Define the swapped and default states
SWAPPED='{
    "UserKeyMapping": [
        {
            "HIDKeyboardModifierMappingSrc": 30064771129,
            "HIDKeyboardModifierMappingDst": 30064771296
        },
        {
            "HIDKeyboardModifierMappingSrc": 30064771296,
            "HIDKeyboardModifierMappingDst": 30064771129
        }
    ]
}'

DEFAULT='{
    "UserKeyMapping": []
}'

# Detect if Caps Lock is currently mapped to Control
if echo "$CURRENT_MAPPING" | grep -q "30064771129"; then
    echo "🔄 Resetting to default (Caps Lock as Caps Lock, Control as Control)..."
    hidutil property --set "$DEFAULT"
else
    echo "🔄 Swapping Caps Lock and Control..."
    hidutil property --set "$SWAPPED"
fi

# Verify the change
NEW_MAPPING=$(hidutil property --get "UserKeyMapping")
echo "✅ New Mapping: $NEW_MAPPING"
