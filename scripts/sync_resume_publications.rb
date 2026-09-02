#!/usr/bin/env ruby

require 'bibtex'
require 'date'
require 'json'

ROOT = File.expand_path('..', __dir__)
BIBLIOGRAPHY_PATH = File.join(ROOT, '_bibliography', 'papers.bib')
RESUME_PATH = File.join(ROOT, 'assets', 'json', 'resume.json')

MONTHS = Date::MONTHNAMES.each_with_index.filter_map do |name, index|
  [name.downcase, index] if name
end.to_h.freeze

def text(entry, field)
  value = entry[field]
  return '' unless value

  value.convert(:latex).to_s.strip
end

def month_number(value)
  normalized = value.to_s.downcase.strip
  return format('%02d', normalized.to_i) if normalized.match?(/^\d+$/) && normalized.to_i.between?(1, 12)

  month = MONTHS.find { |name, _number| normalized.start_with?(name[0, 3]) }
  month ? format('%02d', month[1]) : '01'
end

def publication_url(entry)
  website = text(entry, :website)
  return website unless website.empty?

  doi = text(entry, :doi)
  return "https://doi.org/#{doi}" unless doi.empty?

  arxiv = text(entry, :arxiv)
  return "https://arxiv.org/abs/#{arxiv}" unless arxiv.empty?

  url = text(entry, :url)
  return url unless url.empty?

  pdf = text(entry, :pdf)
  return '' if pdf.empty?
  return pdf if pdf.match?(%r{^https?://})

  "/assets/pdf/#{pdf}"
end

bibliography = BibTeX.open(BIBLIOGRAPHY_PATH)
publications = bibliography.entries.values.filter_map do |entry|
  year = text(entry, :year)
  next if year.empty?

  publisher = %i[booktitle journal institution school publisher note]
    .map { |field| text(entry, field) }
    .find { |value| !value.empty? }.to_s

  authors = entry.author&.convert(:latex)&.map(&:to_s)&.join('; ').to_s

  {
    'name' => text(entry, :title),
    'publisher' => publisher,
    'releaseDate' => "#{year}-#{month_number(text(entry, :month))}-01",
    'authors' => authors,
    'pages' => text(entry, :pages),
    'url' => publication_url(entry)
  }
end

publications.sort_by! { |publication| [publication['releaseDate'], publication['name']] }
publications.reverse!

resume = JSON.parse(File.read(RESUME_PATH))
resume['publications'] = publications
resume['references'] = []
resume['meta']['canonical'] = 'https://piyush314.github.io/assets/json/resume.json'
resume['meta']['lastModified'] = Time.now.utc.strftime('%Y-%m-%dT%H:%M:%SZ')

File.write(RESUME_PATH, JSON.pretty_generate(resume) + "\n")

puts "Synced #{publications.length} publications into #{RESUME_PATH}"
