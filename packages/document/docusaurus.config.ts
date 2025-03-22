// @ts-nocheck
// Note: type annotations allow type checking and IDEs autocompletion
import fs from "node:fs";
import path from "node:path";

import type {Config, RouteConfig} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const {themes} = require('prism-react-renderer');
const lightCodeTheme = themes.github
const darkCodeTheme = themes.dracula

const config : Config = {
  title: 'ShuttlePub',
  tagline: 'A Blazing Fast Fediverse MicroBlog',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://docs.shuttle.pub',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/',
  staticDirectories: ['static'],

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'ShuttlePub', // Usually your GitHub org/user name.
  projectName: 'document', // Usually your repo name.

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  markdown: {
    mermaid: true,
  },
  themes: ['@docusaurus/theme-mermaid'],

  // Even if you don't use internalization, you can use this field to set useful
  // metadata like html lang. For example, if your site is Chinese, you may want
  // to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'ja',
    locales: ['ja'],
  },

  scripts: [
    {
      src: 'https://d3js.org/d3.v7.min.js',
      async: false
    }
  ],
  clientModules: [
    './src/mermaid-zoom.ts'
  ],
  plugins: [
    // https://github.com/prisma/docs/pull/6645
    async function pluginLlmsTxt(context) {
      return {
        name: "llms-txt-plugin",
        loadContent: async () => {
          const { siteDir } = context;
          const contentDir = path.join(siteDir, "docs");
          const allMdx: string[] = [];

          // recursive function to get all mdx files
          const getMdxFiles = async (dir: string) => {
            const entries = await fs.promises.readdir(dir, { withFileTypes: true });

            for (const entry of entries) {
              const fullPath = path.join(dir, entry.name);
              if (entry.isDirectory()) {
                await getMdxFiles(fullPath);
              } else if (entry.name.endsWith(".mdx")) {
                const content = await fs.promises.readFile(fullPath, "utf8");
                allMdx.push(content);
              }
            }
          };

          await getMdxFiles(contentDir);
          return { allMdx };
        },
        postBuild: async ({ content, routes, outDir }) => {
          const { allMdx } = content as { allMdx: string[] };
          // Write concatenated MDX content
          const concatenatedPath = path.join(outDir, "llms-full.txt");
          await fs.promises.writeFile(concatenatedPath, allMdx.join("\n\n---\n\n"));

          // we need to dig down several layers:
          // find PluginRouteConfig marked by plugin.name === "docusaurus-plugin-content-docs"
          const docsPluginRouteConfig = routes.filter(
            (route) => route.plugin.name === "docusaurus-plugin-content-docs"
          )[0];

          // docsPluginRouteConfig has a routes property has a record with the path "/" that contains all docs routes.
          const allDocsRouteConfig = docsPluginRouteConfig.routes?.filter(
            (route) => route.path === "/"
          )[0];

          // A little type checking first
          if (!allDocsRouteConfig?.props?.version) {
            return;
          }

          // this route config has a `props` property that contains the current documentation.
          const currentVersionDocsRoutes = (
            allDocsRouteConfig.props.version as Record<string, unknown>
          ).docs as Record<string, Record<string, unknown>>;

          // for every single docs route we now parse a path (which is the key) and a title
          const docsRecords = Object.entries(currentVersionDocsRoutes).map(([path, record]) => {
            return `- [${record.title}](${path}): ${record.description}`;
          });

          // Build up llms.txt file
          const llmsTxt = `# ${context.siteConfig.title}\n\n## Docs\n\n${docsRecords.join("\n")}`;

          // Write llms.txt file
          const llmsTxtPath = path.join(outDir, "llms.txt");
          try {
            fs.writeFileSync(llmsTxtPath, llmsTxt);
          } catch (err) {
            throw err;
          }
        },
      };
    },
  ],

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          editUrl:
            'https://github.com/ShuttlePub/document/tree/main/docs',
        },
        blog: {
          showReadingTime: true,
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          editUrl:
            'https://github.com/ShuttlePub/document/tree/main/blog',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      } satisfies Preset.Options,
    ],
    [
      'redocusaurus',
      {
        debug: Boolean(process.env.DEBUG || process.env.CI),
        specs: [
          {
            spec: './static/api-spec/shuttlepub/v1.yaml',
            route: '/api-spec/shuttlepub/v1/'
          },
          {
            spec: './static/api-spec/openapi.Emumet.v1.yaml',
            route: '/api-spec/emumet/v1/'
          },
        ],
        theme: {
          primaryColor: '#1bd96a',
          redocOptions: {
            hideLoading: true,
            noAutoAuth: true,
          }
        }
      }
    ]
  ],

  themeConfig: {
      // Replace with your project's social card
      image: 'img/docusaurus-social-card.jpg',
      navbar: {
        title: 'ShuttlePub Docs',
        logo: {
          alt: 'My Site Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'shuttlepub/features',
            position: 'left',
            label: 'Features',
          },
          { to: '/blog', label: 'Blog', position: 'left' },
          {
            label: 'API Spec',
            position: 'left',
            items: [
              {
                label: 'ShuttlePub v1',
                to: 'api-spec/shuttlepub/v1/',
              },
              {
                label: 'Emumet v1',
                to: 'api-spec/emumet/v1/',
              },
            ],
          },
          {
            href: 'https://github.com/ShuttlePub/document',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Docs',
            items: [
              {
                label: 'Tutorial',
                to: '/docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Discord',
                href: 'https://discord.gg/Zq6JBAyDda ',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Blog',
                to: '/blog',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/ShuttlePub/ShuttlePub',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} ShuttlePub. Built with Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
        additionalLanguages: ['bash', 'json']
      },
    } satisfies Preset.ThemeConfig,
};

export default config;
