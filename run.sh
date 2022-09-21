cd functions
npm run build
cd ..
# flutter clean
flutter build web --web-renderer html --release --dart2js-optimization O4
firebase deploy --only hosting