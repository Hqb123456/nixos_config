return {
  {
    "xeluxee/competitest.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('competitest').setup({
        local_config_file_name = ".competitest.lua",
        floating_border = "rounded",
        floating_border_highlight = "FloatBorder",
        picker_ui = {
          width = 0.2,
          height = 0.3,
          mappings = {
            focus_next = { "j", "<down>", "<Tab>" },
            focus_prev = { "k", "<up>", "<S-Tab>" },
            close = { "<esc>", "<C-c>", "q", "Q" },
            submit = "<cr>",
          },
        },
        editor_ui = {
          popup_width = 0.4,
          popup_height = 0.6,
          show_nu = true,
          show_rnu = false,
          normal_mode_mappings = {
            switch_window = { "<C-h>", "<C-l>", "<C-i>" },
            save_and_close = "<C-s>",
            cancel = { "q", "Q" },
          },
          insert_mode_mappings = {
            switch_window = { "<C-h>", "<C-l>", "<C-i>" },
            save_and_close = "<C-s>",
            cancel = "<C-q>",
          },
        },
        runner_ui = {
          interface = "popup",
          selector_show_nu = false,
          selector_show_rnu = false,
          show_nu = true,
          show_rnu = false,
          mappings = {
            run_again = "R",
            run_all_again = "<C-r>",
            kill = "K",
            kill_all = "<C-k>",
            view_input = { "i", "I" },
            view_output = { "a", "A" },
            view_stdout = { "o", "O" },
            view_stderr = { "e", "E" },
            toggle_diff = { "d", "D" },
            close = { "q", "Q" },
          },
          viewer = {
            width = 0.5,
            height = 0.5,
            show_nu = true,
            show_rnu = false,
            open_when_compilation_fails = true,
          },
        },
        popup_ui = {
          total_width = 0.8,
          total_height = 0.8,
          layout = {
            { 4, "tc" },
            { 5, { { 1, "so" }, { 1, "si" } } },
            { 5, { { 1, "eo" }, { 1, "se" } } },
          },
        },
        split_ui = {
          position = "right",
          relative_to_editor = true,
          total_width = 0.3,
          vertical_layout = {
            { 1, "tc" },
            { 1, { { 1, "so" }, { 1, "eo" } } },
            { 1, { { 1, "si" }, { 1, "se" } } },
          },
          total_height = 0.4,
          horizontal_layout = {
            { 2, "tc" },
            { 3, { { 1, "so" }, { 1, "si" } } },
            { 3, { { 1, "eo" }, { 1, "se" } } },
          },
        },
        save_current_file = true,
        save_all_files = false,
        compile_directory = ".",
        compile_command = {
          c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "build/$(FNOEXT)" } },
          cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "build/$(FNOEXT)" } },
          rust = { exec = "rustc", args = { "$(FNAME)", "-o", "build/$(FNOEXT)" } },
          java = { exec = "javac", args = { "-d", "build", "$(FNAME)" } },
        },
        running_directory = "build",
        run_command = {
          c = { exec = "./$(FNOEXT)" },
          cpp = { exec = "./$(FNOEXT)" },
          rust = { exec = "./$(FNOEXT)" },
          python = { exec = "python3", args = { "../$(FNAME)" } },
          java = { exec = "java", args = { "$(FNOEXT)" } },
        },
        multiple_testing = -1,
        maximum_time = 5000,
        output_compare_method = "squish",
        view_output_diff = false,
        testcases_directory = "testpoint",
        testcases_use_single_file = false,
        testcases_auto_detect_storage = true,
        testcases_single_file_format = "$(FNOEXT).testcases",
        testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
        testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",
        companion_port = 27121,
        receive_print_message = true,
        start_receiving_persistently_on_setup = false,
        template_file = vim.fn.expand("~/模板/temp.cpp"),
        evaluate_template_modifiers = true,
        date_format = "%c",
        received_files_extension = "cpp",
        received_problems_path = "$(CWD)/$(PROBLEM).$(FEXT)",
        received_problems_prompt_path = false,
        received_contests_directory = "$(CWD)/testpoint",
        received_contests_problems_path = "$(PROBLEM).$(FEXT)",
        received_contests_prompt_directory = false,
        received_contests_prompt_extension = false,
        open_received_problems = true,
        open_received_contests = true,
        replace_received_testcases = true,
        start_receiving_persistently_on_setup = true,
        receive_print_message = true,
      })

      -- ============================================
      -- 快捷键映射（使用 <leader>K 前缀）
      -- ============================================
      local map = vim.keymap.set

      -- 接收功能
      map("n", "<leader>Kr", "<CMD>CompetiTest receive testcases<CR>", 
          { desc = "CompetiTest: 接收测试用例" })
      map("n", "<leader>Kp", "<CMD>CompetiTest receive problem<CR>", 
          { desc = "CompetiTest: 接收题目" })
      map("n", "<leader>Kc", "<CMD>CompetiTest receive contest<CR>", 
          { desc = "CompetiTest: 接收竞赛" })
      map("n", "<leader>KRc", "<CMD>CompetiTest receive persistently<CR>", 
          { desc = "CompetiTest: 持续接收" })
      map("n", "<leader>KRs", "<CMD>CompetiTest receive status<CR>", 
          { desc = "CompetiTest: 接收状态" })
      map("n", "<leader>KRx", "<CMD>CompetiTest receive stop<CR>", 
          { desc = "CompetiTest: 停止接收" })

      -- 测试用例管理
      map("n", "<leader>Ka", "<CMD>CompetiTest add_testcase<CR>", 
          { desc = "CompetiTest: 添加测试用例" })
      map("n", "<leader>Ke", "<CMD>CompetiTest edit_testcase<CR>", 
          { desc = "CompetiTest: 编辑测试用例" })
      map("n", "<leader>Kd", "<CMD>CompetiTest delete_testcase<CR>", 
          { desc = "CompetiTest: 删除测试用例" })
      map("n", "<leader>Kcv", "<CMD>CompetiTest convert<CR>", 
          { desc = "CompetiTest: 转换测试用例格式" })

      -- 运行测试
      map("n", "<leader>Kt", "<CMD>CompetiTest run<CR>", 
          { desc = "CompetiTest: 运行测试" })
      map("n", "<F4>", "<CMD>CompetiTest run<CR>", 
          { desc = "CompetiTest: 运行测试 (F4)" })
      map("n", "<leader>Kn", "<CMD>CompetiTest run_no_compile<CR>", 
          { desc = "CompetiTest: 不编译运行" })
      map("n", "<leader>Ks", "<CMD>CompetiTest show_ui<CR>", 
          { desc = "CompetiTest: 显示运行界面" })
    end,
  },
}
