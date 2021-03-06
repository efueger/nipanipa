# frozen_string_literal: true

#
# Controller for static pages
#
class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def donate
  end

  def terms
  end

  def robots
    robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
    render plain: robots, layout: false
  end
end
