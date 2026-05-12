local set = vim.keymap.set

vim.g.mapleader = " "
set("n", "<leader>e", vim.cmd.Oil,                { desc = "File explorer" })
set("n", "<leader>ff", function()
  local root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
  require('fzf-lua').files({ cwd = (root and root ~= "") and root or vim.fn.getcwd() })
end, { desc = "Find files" })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    set('n', '<leader>fl', function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local labels, paths = {}, {}
      for _, line in ipairs(lines) do
        for label, path in line:gmatch('%[([^%]]+)%]%(([^%)]+)%)') do
          if not path:match('^https?://') then
            table.insert(labels, label)
            table.insert(paths, path)
          end
        end
      end
      if #paths == 0 then
        vim.notify('No local links found', vim.log.levels.INFO)
        return
      end
      local dir = vim.fn.expand('%:p:h')
      local entries = {}
      for i, label in ipairs(labels) do
        entries[i] = label .. '  →  ' .. paths[i]
      end
      require('fzf-lua').fzf_exec(entries, {
        prompt = 'Links> ',
        actions = {
          ['default'] = function(sel)
            for i, e in ipairs(entries) do
              if e == sel[1] then
                vim.cmd.edit(vim.fn.fnamemodify(dir .. '/' .. paths[i], ':p'))
                break
              end
            end
          end,
        },
      })
    end, { buffer = true, desc = "Markdown links" })
  end,
})
