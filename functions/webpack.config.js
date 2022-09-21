const path = require('path');

module.exports = {
  // The entry point file described above
  entry: './src/index.js',
  // The location of the build folder described above
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, '../web'),
  },
  // Optional and for development only. This provides the ability to
  // map the built code back to the original source format when debugging.
  devtool: 'eval-source-map',
  mode: 'production',
  optimization: {
    usedExports: true,
    runtimeChunk: 'single',
    splitChunks: {
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name: 'vendors',
          chunks: 'all'
        }
      }
    }
  },
};