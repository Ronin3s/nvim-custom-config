return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Faster smear settings for a snappier feel
    stiffness = 0.8,                      -- Default  Range
    trailing_stiffness = 0.6,             -- 0.45     [0, 1]
    stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
    trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    damping = 0.95,                       -- 0.85     [0, 1]
    damping_insert_mode = 0.95,           -- 0.9      [0, 1]
    distance_stop_animating = 0.5,        -- 0.1      > 0

    -- Settings for your transparent background
    -- This helps reduce the "shadow" effect of the smear on transparent backgrounds
    transparent_bg_fallback_color = "#303030",
  },
}
