# frozen_string_literal: true

class ArchivesController < ApplicationController
  def index
    @archive = Entry.all.group_by(&:day)
  end
end
