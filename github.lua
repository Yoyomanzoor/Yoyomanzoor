return {
	["github"] = function(args, kwargs, meta)
		-- Get the repo name from the shortcode argument
		local repo = pandoc.utils.stringify(args[1])

		-- Ping the GitHub API using curl
		local handle = io.popen("curl -s https://api.github.com/repos/" .. repo)
		local result = handle:read("*a")
		handle:close()

		-- Parse the JSON response
		local data = quarto.json.decode(result)

		-- Extract the data
		local desc = data.description or "No description provided."
		local stars = data.stargazers_count or 0
		local forks = data.forks_count or 0
		local lang = data.language or "N/A"
		local url = data.html_url or ("https://github.com/" .. repo)

		-- Build the HTML string
		local html = string.format(
			[[
<a href="%s" class="github-repo-card" target="_blank" rel="noopener noreferrer">
  <div class="repo-title">
    <i class="bi bi-github"></i> %s
  </div>
  <div class="repo-desc">
    %s
  </div>
  <div class="repo-meta">
    <span><i class="bi bi-circle-fill" style="color: #3572A5; font-size: 0.5rem;"></i> %s</span>
    <span><i class="bi bi-star"></i> %s</span>
    <span><i class="bi bi-diagram-2"></i> %s</span>
  </div>
</a>
    ]],
			url,
			repo,
			desc,
			lang,
			stars,
			forks
		)

		-- Use RawBlock to prevent Quarto from breaking the HTML structure
		return pandoc.RawBlock("html", html)
	end,
}
