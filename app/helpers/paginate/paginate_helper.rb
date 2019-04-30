module Paginate
  module PaginateHelper 
    def will_paginate(collection_or_options = nil, options = {})
      if collection_or_options.is_a? Hash
        options, collection_or_options = collection_or_options, nil
      end
      unless options[:renderer]
        options = options.merge :renderer => Paginate::PaginateHelper::LinkRenderer
      end
      super *[collection_or_options, options].compact
    end

    class LinkRenderer < WillPaginate::ActionView::LinkRenderer
      protected
      def html_container(html)
        ul = tag(:ul, html, :class => "pagination")
        tag(:nav, ul, {"aria-label" => "..."})
      end

      def page_number(page)
        current = (page == current_page)
        link = link(page, page, {:rel => rel_value(page),
                                 :class => "page-link"})
        li_attr = {:class => "page-item"}
        if page == current_page
          li_attr[:class] = "page-item active"
          li_attr["aria-current"] = "page"
        end 
          tag(:li, link, li_attr)
      end

      def previous_or_next_page(page, text, classname)
        li_attr = {:class => "page-item"}
        unless page
          li_attr[:class] += " disabled"
        end
        tag(:li, link(text, page, :class => "page-link"), li_attr)
      end

    end
  end
end