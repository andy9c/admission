cd functions
npm run build
cd ..
flutter clean
flutter build web --no-source-maps --csp
firebase deploy --only hosting