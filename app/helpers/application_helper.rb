# -*- coding: utf-8 -*-
module ApplicationHelper
  #ページごとの完全なタイトル
  def full_title(page_title)
    base_title = "ZONE"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
 end
