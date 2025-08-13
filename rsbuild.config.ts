import { defineConfig } from '@rsbuild/core';
import { pluginReact } from '@rsbuild/plugin-react';

const DEV = process.env.NODE_ENV === 'development';

export default defineConfig({
  plugins: [pluginReact()],
  server: (DEV ? (
    {
      proxy: {
        '/api': 'http://backend:8000'
      }
    }
  ) : undefined),
});
