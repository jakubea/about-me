import { defineConfig } from 'vite';
import plugin from 'vite-plugin-elm';

export default defineConfig({
  plugins: [plugin()],
  server: { port: 3001 },
  preview: { port: 3001 },
  build: {
    emptyOutDir: true,
    outDir: './build',
    minify: 'terser',
    terserOptions: {
      compress: true,
      mangle: true,
    },
  },
});
