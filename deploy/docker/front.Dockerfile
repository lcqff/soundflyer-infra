FROM node:20-alpine
WORKDIR /app

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY docker/data/front .

RUN mkdir .next
RUN chown nextjs:nodejs .next

USER nextjs

ENV HOSTNAME="0.0.0.0"
CMD ["node", "server.js"]
