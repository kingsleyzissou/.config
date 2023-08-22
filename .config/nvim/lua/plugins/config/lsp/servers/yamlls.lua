return {
  yaml = {
    format = {
      singleQuote = false,
    },
    schemas = {
      ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
    },
    schemaStore = {
      enable = true,
    },
  },
}
