# frozen_string_literal: true

require "active_support/concern"

#
# Common utilities for presenting profiles
#
module Profilable
  extend ActiveSupport::Concern

  included do
    include DateFormatable

    relative_time :current_sign_in_at, :created_at
  end

  def categories
    work_types.join(", ")
  end

  def languages
    language_skills.join(", ")
  end

  def tabs
    [general_tab, feedback_tab, pictures_tab]
  end

  private

  def general_tab
    # i18n-tasks-use t('shared.profile_header.general')
    { name: tab_name("general"), path: view.user_path(self) }
  end

  def feedback_tab
    # i18n-tasks-use t('shared.profile_header.feedback')
    { name: tab_name("feedback"), path: view.user_feedbacks_path(self) }
  end

  def pictures_tab
    # i18n-tasks-use t('shared.profile_header.pictures')
    { name: tab_name("pictures"), path: view.user_pictures_path(self) }
  end

  def tab_name(key)
    view.t("shared.profile_header.#{key}")
  end

  alias action_name tab_name
end
