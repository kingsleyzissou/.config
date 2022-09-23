local project = require('project_nvim')

project.setup()

print(vim.inspect(project.get_recent_projects()))
