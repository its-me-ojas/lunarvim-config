require('codestats-nvim').setup({
  token = "SFMyNTY.YVhSelkzSmxjM1JtWVd4c1pXND0jI01qUXpNRGc9.exdCNLsCO_oz-1o8dmTZP0op_JVL4ss1R_OAQkRuxnM",
  -- When the token is not provided, codestats.nvim will fallback to the CODESTATS_API_KEY environment variable
  endpoint = "https://codestats.net",
  -- The endpoint which should be used. Mostly you dont want to overwrite it
  interval = 60,
  -- The interval in seconds between pushes to the CodeStats API
})
