   Map("", "J", Move_to_bottom_screen)
   Map("", "K", Move_to_top_screen)
   Map("", "<Space>", Trim__save__no_highlight)
  --  Vscode: All remaps
--    Map("", "zy", Toggle_typewriter)
   Map("", "zp", Goto_parent_fold)
   Map("", "]f", Next_folding_section)
   Map("", "[f", Prev_folding_section)

-- Vscode: Normal remaps
   Map("n", "gD",        Reveal_definition_aside)
   Map("n", "<leader>s", Toggle_sticky_scroll)
   Map("n", "<leader>r", Rename_symbol)
   Map("n", "==",        Trim_trailing_whitespace)
   Map("n", "gl",        Open_link)
   Map("n", "<<",        Outdent)
   Map("n", ">>",        Indent)
   Map("n", "gcc",       Comment)
   Map("n", "=>",        Reindent)
   Map("n", "=s",        Convert_to_spaces)
   Map("n", "=t",        Convert_to_tabs)
   Map("n", "za",        Toggle_fold)
   Map("n", "=ie",       Format_document)

   Map("n", "<leader>ga", Git_stage_file)
   Map("n", "<leader>gA", Git_stage_all)
   Map("n", "<leader>gu", Git_unstage_file)
   Map("n", "<leader>gm", Git_commit)
   Map("n", "<leader>gM", Git_commit_amend)
   Map("n", "<leader>gp", Git_push)
   Map("n", "<leader>gP", Git_push_force)
   Map("n", "<leader>gr", Git_revert_change)
   Map("n", "<leader>gt", Git_stage_change)
   Map("n", "<leader>gT", Git_unstage_change)
   Map("n", "<leader>gn", Git_open_changes)

    --- Vscode: Visual remaps
 
   Map("v", "<",  Outdent_vis)
   Map("v", "gc", Comment_vis)
   Map("v", ">",  Indent_vis)

-- -split editor remaps
   Map("n", "<leader>v", Split_editor)
