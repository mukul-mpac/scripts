#!/bin/bash

echo "🔄 Swapping Caps Lock and Control..."
hidutil property --set '{
    "UserKeyMapping": [
        {
            "HIDKeyboardModifierMappingSrc": 0x700000039,
            "HIDKeyboardModifierMappingDst": 0x7000000e0
        },
        {
            "HIDKeyboardModifierMappingSrc": 0x7000000e0,
            "HIDKeyboardModifierMappingDst": 0x700000039
        }
    ]
}'
