import elmPlugin from "vite-plugin-elm"

export default {
  // identify what plugins we want to use
  plugins: [elmPlugin()],
  // configure our build
  build: {
    // file path for the build output directory
    outDir: "build",
    // esbuild target
    target: "es2020"
  }
}
