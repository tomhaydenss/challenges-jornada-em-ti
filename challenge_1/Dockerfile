FROM elixir:1.14-alpine

WORKDIR /app

COPY mix.exs ./
COPY lib lib

ENTRYPOINT ["mix", "app.start"]

