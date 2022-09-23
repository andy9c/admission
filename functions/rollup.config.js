import { nodeResolve } from '@rollup/plugin-node-resolve';
// import { terser } from 'rollup-plugin-terser';
import commonjs from '@rollup/plugin-commonjs';

export default {
  // the entry point file described above
  input: 'src/index.js',
  // the output for the build folder described above
  output: {
    file: '../web/bundle.js',
    // Optional and for development only. This provides the ability to
    // map the built code back to the original source format when debugging.
    //sourcemap: 'inline',
    // Configure Rollup to convert your module code to a scoped function
    // that "immediate invokes". See the Rollup documentation for more
    // information: https://rollupjs.org/guide/en/#outputformat
    format: 'iife',
    compact: true
  },
  // Add the plugin to map import paths to dependencies
  // installed with npm
  plugins: [nodeResolve(),
    // terser({
    //   compress: {
    //     defaults: false,
    //   },
    //   output: {
    //     comments: false,
    //   },
    // }),
  commonjs({
    // non-CommonJS modules will be ignored, but you can also
    // specifically include/exclude files
    include: [ "src/index.js", "node_modules/**" ], // Default: undefined

    // if true then uses of `global` won't be dealt with by this plugin
    ignoreGlobal: false, // Default: false

    // if false then skip sourceMap generation for CommonJS modules
    sourceMap: false // Default: true
  }),]
};