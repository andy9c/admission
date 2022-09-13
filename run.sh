cd functions
npm run build
cd ..
# flutter clean
flutter build web --release
firebase deploy --only hosting