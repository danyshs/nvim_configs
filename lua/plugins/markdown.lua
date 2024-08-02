return {
  {
    vim.filetype.add({
      extension = {
        mdx = "markdown",
      }
    })
  },
  {
    "bullets-vim/bullets.vim"
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      local highlight = function(group, options)
        local guifg = options.fg or "NONE"
        local guibg = options.bg or "NONE"
        local guisp = options.sp or "NONE"
        local gui = options.gui or "NONE"
        local blend = options.blend or 0
        local ctermfg = options.ctermfg or "NONE"

        vim.cmd(
          string.format(
            "highlight %s guifg=%s ctermfg=%s guibg=%s guisp=%s gui=%s blend=%d",
            group,
            guifg,
            ctermfg,
            guibg,
            guisp,
            gui,
            blend
          )
        )
      end

      -- highlight("Headline1", { bg = "#000020", fg = "#00cc00" })
      -- highlight("Headline2", { bg = "#000030", fg = "#00cc55" })
      -- highlight("Headline3", { bg = "#000045", fg = "#00dd88" })
      -- highlight("Headline4", { bg = "#000050", fg = "#00eeaa" })
      -- highlight("Headline5", { bg = "#000065", fg = "#00eeff" })
      -- highlight("Headline6", { bg = "#000070", fg = "#00ffff" })
      -- highlight("CodeBlock", { bg = "#500090" })
      --

      -- require("headlines").setup({
      -- markdown = {
      -- headline_highlights = {
      --   "Headline1",
      --   "Headline2",
      --   "Headline3",
      --   "Headline4",
      --   "Headline5",
      --   "Headline6"
      -- },
      -- bullets = { "•", "•", "•", "•", "•", "•" },
      -- codeblock_highlight = "CodeBlock",
      -- dash_highlight = "Dash",
      -- dash_string = "-",
      -- quote_highlight = "Quote",
      -- quote_string = "┃",
      -- fat_headlines = true,
      -- fat_headline_upper_string = "▃",
      -- fat_headline_lower_string = "▀",
      -- fat_headline_upper_string = "⠀",
      -- fat_headline_lower_string = "⠀",
      -- },
      -- })
    end
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown',                                                      -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      --- START HEADINGS
      require('render-markdown').setup({
        heading = {
          -- Turn on / off heading icon & background rendering
          enabled = true,
          -- Turn on / off any sign column related rendering
          sign = false,
          -- Replaces '#+' of 'atx_h._marker'
          -- The number of '#' in the heading determines the 'level'
          -- The 'level' is used to index into the array using a cycle
          -- The result is left padded with spaces to hide any additional '#'
          icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
          -- Added to the sign column if enabled
          -- The 'level' is used to index into the array using a cycle
          signs = { '󰫎 ' },
          -- The 'level' is used to index into the array using a clamp
          -- Highlight for the heading icon and extends through the entire line
          backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
          },
          -- The 'level' is used to index into the array using a clamp
          -- Highlight for the heading and sign icons
          foregrounds = {
            'RenderMarkdownH1',
            'RenderMarkdownH2',
            'RenderMarkdownH3',
            'RenderMarkdownH4',
            'RenderMarkdownH5',
            'RenderMarkdownH6',
          },
        },
      })

      --- END HEADINGS

      --- START CODEBLOCKS
      require('render-markdown').setup({
        code = {
          -- Turn on / off code block & inline code rendering
          enabled = true,
          -- Turn on / off any sign column related rendering
          sign = true,
          -- Determines how code blocks & inline code are rendered:
          --  none: disables all rendering
          --  normal: adds highlight group to code blocks & inline code, adds padding to code blocks
          --  language: adds language icon to sign column if enabled and icon + name above code blocks
          --  full: normal + language
          style = 'full',
          -- Amount of padding to add to the left of code blocks
          left_pad = 0,
          -- Determins how the top / bottom of code block are rendered:
          --  thick: use the same highlight as the code body
          --  thin: when lines are empty overlay the above & below icons
          border = 'thick',
          -- Used above code blocks for thin border
          above = '▄',
          -- Used below code blocks for thin border
          below = '▀',
          -- Highlight for code blocks & inline code
          highlight = 'RenderMarkdownCode',
        },
      })
      --- END CODEBLOCKS
      require('render-markdown').setup({
        dash = {
          -- Turn on / off thematic break rendering
          enabled = true,
          -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
          -- The icon gets repeated across the window's width
          icon = '─',
          -- Highlight for the whole line generated from the icon
          highlight = 'RenderMarkdownDash',
        },
      })
      --- START DASHEDLINE
      require('render-markdown').setup({
        dash = {
          -- Turn on / off thematic break rendering
          enabled = true,
          -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
          -- The icon gets repeated across the window's width
          icon = '─',
          -- Highlight for the whole line generated from the icon
          highlight = 'RenderMarkdownDash',
        },
      })
      --- END DASHEDLINE

      --- START LISTBULLETS
      require('render-markdown').setup({
        bullet = {
          -- Turn on / off list bullet rendering
          enabled = true,
          -- Replaces '-'|'+'|'*' of 'list_item'
          -- How deeply nested the list is determines the 'level'
          -- The 'level' is used to index into the array using a cycle
          -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
          icons = { '●', '○', '◆', '◇' },
          -- Highlight for the bullet icon
          highlight = 'RenderMarkdownBullet',
        },
      })
      --- END LISTBULLETS
      --- START CHECKBOXES
      require('render-markdown').setup({
        -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
        -- There are two special states for unchecked & checked defined in the markdown grammar
        checkbox = {
          -- Turn on / off checkbox state rendering
          enabled = true,
          unchecked = {
            -- Replaces '[ ]' of 'task_list_marker_unchecked'
            icon = '󰄱 ',
            -- Highlight for the unchecked icon
            highlight = 'RenderMarkdownUnchecked',
          },
          checked = {
            -- Replaces '[x]' of 'task_list_marker_checked'
            icon = '󰱒 ',
            -- Highligh for the checked icon
            highlight = 'RenderMarkdownChecked',
          },
          -- Define custom checkbox states, more involved as they are not part of the markdown grammar
          -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
          -- Can specify as many additional states as you like following the 'todo' pattern below
          --   The key in this case 'todo' is for healthcheck and to allow users to change its values
          --   'raw': Matched against the raw text of a 'shortcut_link'
          --   'rendered': Replaces the 'raw' value when rendering
          --   'highlight': Highlight for the 'rendered' icon
          custom = {
            todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
          },
        },
      })
      --- END CHECKBOXES
      --- START BLOCKQUOTES
      require('render-markdown').setup({
        quote = {
          -- Turn on / off block quote & callout rendering
          enabled = true,
          -- Replaces '>' of 'block_quote'
          icon = '▋',
          -- Highlight for the quote icon
          highlight = 'RenderMarkdownQuote',
        },
      })
      --- END BLOCKQUOTES
      --- START TABLES
      require('render-markdown').setup({
        pipe_table = {
          -- Turn on / off pipe table rendering
          enabled = true,
          -- Determines how the table as a whole is rendered:
          --  none: disables all rendering
          --  normal: applies the 'cell' style rendering to each row of the table
          --  full: normal + a top & bottom line that fill out the table when lengths match
          style = 'full',
          -- Determines how individual cells of a table are rendered:
          --  overlay: writes completely over the table, removing conceal behavior and highlights
          --  raw: replaces only the '|' characters in each row, leaving the cells unmodified
          --  padded: raw + cells are padded with inline extmarks to make up for any concealed text
          cell = 'padded',
          -- Characters used to replace table border
          -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
          -- stylua: ignore
          border = {
            '┌', '┬', '┐',
            '├', '┼', '┤',
            '└', '┴', '┘',
            '│', '─',
          },
          -- Highlight for table heading, delimiter, and the line above
          head = 'RenderMarkdownTableHead',
          -- Highlight for everything else, main table rows and the line below
          row = 'RenderMarkdownTableRow',
          -- Highlight for inline padding used to add back concealed space
          filler = 'RenderMarkdownTableFill',
        },
      })
      --- END TABLES
      --- START CALLOUTS
      require('render-markdown').setup({
        -- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'
        -- Can specify as many additional values as you like following the pattern from any below, such as 'note'
        --   The key in this case 'note' is for healthcheck and to allow users to change its values
        --   'raw': Matched against the raw text of a 'shortcut_link', case insensitive
        --   'rendered': Replaces the 'raw' value when rendering
        --   'highlight': Highlight for the 'rendered' text and quote markers
        callout = {
          note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
          tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
          important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
          warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
          caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
          -- Obsidian: https://help.a.md/Editing+and+formatting/Callouts
          abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
          todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
          success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
          question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
          failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
          danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
          bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
          example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
          quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
        },
      })
      --- END CALL
      require('render-markdown').setup({
        link = {
          -- Turn on / off inline link icon rendering
          enabled = true,
          -- Inlined with 'image' elements
          image = '󰥶 ',
          -- Inlined with 'inline_link' elements
          hyperlink = '󰌹 ',
          -- Applies to the inlined icon
          highlight = 'RenderMarkdownLink',
        },
      })
      --- START LINKS
      require('render-markdown').setup({
        link = {
          -- Turn on / off inline link icon rendering
          enabled = true,
          -- Inlined with 'image' elements
          image = '󰥶 ',
          -- Inlined with 'inline_link' elements
          hyperlink = '󰌹 ',
          -- Applies to the inlined icon
          highlight = 'RenderMarkdownLink',
        },
      })
      --- END LINKS
      --- START SIGNS
      require('render-markdown').setup({
        sign = {
          -- Turn on / off sign rendering
          enabled = true,
          -- More granular mechanism, disable signs within specific buftypes
          exclude = {
            buftypes = { 'nofile' },
          },
          -- Applies to background of sign text
          highlight = 'RenderMarkdownSign',
        },
      })
      --- END SIGNS
      --- START COLORS
      vim.cmd [[
        highlight RenderMarkdownH1Bg guibg=#000020
        highlight RenderMarkdownH2Bg guibg=#000030
        highlight RenderMarkdownH3Bg guibg=#000045
        highlight RenderMarkdownH4Bg guibg=#000050
        highlight RenderMarkdownH5Bg guibg=#000065
        highlight RenderMarkdownH6Bg guibg=#000070
        highlight RenderMarkdownH1 guifg=#00cc00
        highlight RenderMarkdownH2 guifg=#00cc55
        highlight RenderMarkdownH3 guifg=#00dd88
        highlight RenderMarkdownH4 guifg=#00eeaa
        highlight RenderMarkdownH5 guifg=#00eeff
        highlight RenderMarkdownH6 guifg=#00ffff
      ]]
      --- END COLORS

      ---
    end,
  },
}
