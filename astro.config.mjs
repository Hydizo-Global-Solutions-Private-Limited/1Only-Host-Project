import { defineConfig } from 'astro/config';
import node from '@astrojs/node';

// https://astro.build/config
export default defineConfig({
  site: 'https://1onlyhost.com',
  output: 'hybrid',
  adapter: node({
    mode: 'middleware'
  }),
  devToolbar: {
    enabled: false
  },
  vite: {
    optimizeDeps: {
      entries: ['src/**/*']
    }
  }
});
