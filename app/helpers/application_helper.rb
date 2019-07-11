module ApplicationHelper
  def header(text)
    content_for(:header) { text.to_s }
  end

  def trim_content(string, limit)
    first_chars = string.first(limit)
    first_chars += '...' if string.length > limit
    first_chars
  end

  def rows_count(text)
    return 10 unless text

    min_rows = text.length.to_i / 120
    return min_rows if min_rows < 25

    [min_rows, 25].max
  end
end
