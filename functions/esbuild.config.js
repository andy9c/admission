require('esbuild').build({
    // the entry point file described above
    entryPoints: ['src/index.js'],
    // the build folder location described above
    outfile: '../web/bundle.js',
    bundle: true,
    minify: true,
    treeShaking: true,
    // Replace with the browser versions you need to target
    target: ['chrome60', 'firefox60', 'safari11', 'edge20'],
    // Optional and for development only. This provides the ability to
    // map the built code back to the original source format when debugging.
    sourcemap: false,
  }).catch(() => process.exit(1))