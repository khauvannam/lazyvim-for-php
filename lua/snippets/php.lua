local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function class_name()
  local filename = vim.fn.expand("%:t:r")
  return filename:gsub("%W", "")
end

local function namespace()
  local filepath = vim.fn.expand("%:p:h")
  local project_root = vim.fn.getcwd()
  local relative = filepath:sub(#project_root + 2)
  local ns = relative:gsub("/", "\\")
  ns = ns:gsub("^src\\?", "")
  ns = ns:gsub("^app\\?", "App\\") -- Laravel convention
  return ns
end

return {
  -- Plain PHP file
  s("phpfile", {
    t("<?php"),
    t({ "", "" }),
    i(0),
  }),

  -- Generic PHP Class
  s("phpclass", {
    t("<?php"),
    t({ "", "" }),
    t({ "", "namespace " }),
    f(namespace, {}),
    t(";"),
    t({ "", "", "class " }),
    f(class_name, {}),
    t({ "", "{" }),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Laravel Controller
  s("phpcontroller", {
    t("<?php"),
    t({ "", "" }),
    t({ "", "namespace " }),
    f(namespace, {}),
    t(";"),
    t({ "", "", "use App\\Http\\Controllers\\Controller;" }),
    t({ "", "", "class " }),
    f(class_name, {}),
    t(" extends Controller"),
    t({ "", "{" }),
    t({ "", "\tpublic function __construct()" }),
    t({ "", "\t{" }),
    t({ "", "\t\t" }),
    i(0),
    t({ "", "\t}" }),
    t({ "", "}" }),
  }),

  -- Laravel Model
  s("phpmodel", {
    t("<?php"),
    t({ "", "" }),
    t({ "", "namespace " }),
    f(namespace, {}),
    t(";"),
    t({ "", "", "use Illuminate\\Database\\Eloquent\\Model;" }),
    t({ "", "", "class " }),
    f(class_name, {}),
    t(" extends Model"),
    t({ "", "{" }),
    t({ "", "\tprotected $fillable = [" }),
    t({ "", "\t\t" }),
    i(0),
    t({ "", "\t];" }),
    t({ "", "}" }),
  }),
}
