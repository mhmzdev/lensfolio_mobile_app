if [ "$CONFIGURATION" == "Debug-stage" ] || [ "$CONFIGURATION" == "Release-stage" ]; then
  cp Runner/stage/GoogleService-Info.plist Runner/GoogleService-Info.plist
elif [ "$CONFIGURATION" == "Debug-qa" ] || [ "$CONFIGURATION" == "Release-qa" ]; then
  cp Runner/qa/GoogleService-Info.plist Runner/GoogleService-Info.plist
elif [ "$CONFIGURATION" == "Debug-prod" ] || [ "$CONFIGURATION" == "Release-prod" ]; then
  cp Runner/prod/GoogleService-Info.plist Runner/GoogleService-Info.plist
fi

