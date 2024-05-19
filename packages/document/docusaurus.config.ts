// @ts-nocheck
// Note: type annotations allow type checking and IDEs autocompletion
import type {Config} from '@docusaurus/types';
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
