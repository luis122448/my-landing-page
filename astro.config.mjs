import { defineConfig } from 'astro/config';

import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  site: 'https://luis122448.com',
  base: '/',
  integrations: [tailwind()]
});