return function(tools)
  return function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    for _, tool in ipairs(tools) do
      table.insert(opts.ensure_installed, tool)
    end
    return opts
  end
end
