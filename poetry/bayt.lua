-- Split a `.bayt` div into Arabic and English at a horizontal rule.
-- Already-marked `.ar` / `.en` children are left alone.
--
-- ::: bayt
-- صدر البيت
--
-- عجز البيت
--
-- ***
--
-- English translation of the couplet.
-- :::

local function has_marked_child(div)
  for _, child in ipairs(div.content) do
    if child.t == "Div" then
      if child.classes:includes("ar") or child.classes:includes("en") then
        return true
      end
    end
  end
  return false
end

function Div(div)
  if not div.classes:includes("bayt") then
    return nil
  end
  if has_marked_child(div) then
    return nil
  end

  local arabic = {}
  local english = {}
  local seen_rule = false

  for _, child in ipairs(div.content) do
    if child.t == "HorizontalRule" then
      seen_rule = true
    elseif seen_rule then
      table.insert(english, child)
    else
      table.insert(arabic, child)
    end
  end

  if not seen_rule then
    return nil
  end

  local ar = pandoc.Div(arabic, pandoc.Attr("", { "ar" }, { { "dir", "rtl" }, { "lang", "ar" } }))
  local en = pandoc.Div(english, pandoc.Attr("", { "en" }, { { "lang", "en" } }))
  div.content = pandoc.List({ ar, en })
  return div
end
