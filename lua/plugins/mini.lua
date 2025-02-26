return {
  {
    'echasnovski/mini.pairs',
    opts = {}
  },
  {
    'echasnovski/mini.surround',
    opts = {
      mappings = {
        add = 'gza',        -- Add surrounding in Normal and Visual modes
        delete = 'gzd',     -- Delete surrounding
        find = 'gzf',       -- Find surrounding (to the right)
        find_left = 'gzF',  -- Find surrounding (to the left)
        highlight = 'gzh',  -- Highlight surrounding
        replace = 'gzr',    -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`
      }
    }
  },
  {
    'echasnovski/mini.animate',
    opts = {}
  },
  {
    'echasnovski/mini.files',
    opts = {},
    keys = {
      { '<leader>s', function() require("mini.files").open() end, desc = 'Mini Files' }
    },
    dependencies = {
      -- 'nvim-tree/nvim-web-devicons'
    }
  },
  {
    'echasnovski/mini.hipatterns',
    config = function()
      require('mini.hipatterns').setup({
        highlighters = {
          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        }
      })
    end
  },
  {
    'echasnovski/mini.move',
    opts = {}
  }
}
