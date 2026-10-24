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

-- Mark a footnote by its first strong letter so the poem sheet can set
-- face and direction. Arabic glosses use the verse face; English notes
-- use the translation face.
local function script_of(blocks)
  local text = pandoc.utils.stringify(blocks)
  for _, code in utf8.codes(text) do
    if (code >= 0x0600 and code <= 0x06FF)
      or (code >= 0x0750 and code <= 0x077F)
      or (code >= 0x08A0 and code <= 0x08FF)
      or (code >= 0xFB50 and code <= 0xFDFF)
      or (code >= 0xFE70 and code <= 0xFEFF) then
      return "ar"
    end
    if (code >= 0x41 and code <= 0x5A) or (code >= 0x61 and code <= 0x7A) then
      return "en"
    end
  end
  return "en"
end

function Note(note)
  local script = script_of(note.content)
  local dir = script == "ar" and "rtl" or "ltr"
  local class = script == "ar" and "poem-note-ar" or "poem-note-en"
  local attr = pandoc.Attr("", { "poem-note", class }, { { "dir", dir }, { "lang", script } })

  for i, block in ipairs(note.content) do
    if block.t == "Para" or block.t == "Plain" then
      note.content[i] = pandoc.Para({ pandoc.Span(block.content, attr) })
    end
  end
  return note
end
