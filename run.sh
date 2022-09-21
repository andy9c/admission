cd functions
npm run build
cd ..
# flutter clean
flutter build web --web-renderer html --release --dart2js-optimization O4 --no-tree-shake-icons
firebase deploy --only hosting