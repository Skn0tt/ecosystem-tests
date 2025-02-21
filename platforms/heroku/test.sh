#!/bin/sh

set -eux

if [ "$PRISMA_CLIENT_ENGINE_TYPE" == "binary" ]; then
  files=',"files":["deno","edge.d.ts","edge.js","index-browser.js","index.d.ts","index.js","package.json","query-engine-debian-openssl-3.0.x","schema.prisma"]'
  pnpm ts-node ../../utils/fetch-retry-and-confirm-version.ts --url https://e2e-platforms-heroku-binary.herokuapp.com --prisma-version $(sh ../../utils/prisma_version.sh) --binary-string $files
else
  files=',"files":["deno","edge.d.ts","edge.js","index-browser.js","index.d.ts","index.js","libquery_engine-debian-openssl-3.0.x.so.node","package.json","schema.prisma"]'
  pnpm ts-node ../../utils/fetch-retry-and-confirm-version.ts --url https://e2e-platforms-heroku.herokuapp.com --prisma-version $(sh ../../utils/prisma_version.sh) --binary-string $files
fi

